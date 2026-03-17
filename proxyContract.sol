// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract UUPSProxy {

    address public implementation;

    constructor(address _impl, bytes memory data) {
        implementation = _impl;

        if(data.length > 0){
            (bool success,) = _impl.delegatecall(data);
            require(success);
        }
    }

    receive() external payable { }
    fallback() external payable {
        address impl = implementation;

        assembly {
            calldatacopy(0, 0, calldatasize())

            let result := delegatecall(
                gas(),
                impl,
                0,
                calldatasize(),
                0,
                0
            )

            returndatacopy(0, 0, returndatasize())

            switch result
            case 0 { revert(0, returndatasize()) }
            default { return(0, returndatasize()) }
        }
    }
}