// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// ================= IMPLEMENTATION =================
contract LogicV1 {

    uint public value;
    address public owner;

    function initialize(uint _value) public {
        require(owner == address(0), "Already initialized");
        value = _value;
        owner = msg.sender;
    }

    function setValue(uint _value) public {
        require(msg.sender == owner, "Not owner");
        value = _value;
    }
}

// ================= PROXY =================
contract SimpleProxy {

    uint public value;
    address public owner;

    address public implementation;

    constructor(address _implementation, bytes memory data) {
        implementation = _implementation;

        if(data.length > 0){
            (bool success,) = _implementation.delegatecall(data);
            require(success, "Init failed");
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