// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contract A: Logic Contract
contract A {
    uint public x;

    function setX(uint _x) external {
        x = _x;
    }
}

// Contract B: Uses call to invoke A
contract B {
    address public aAddress;

    constructor(address _aAddress) {
        aAddress = _aAddress;
    }

    function callSetX(uint _x) external payable {
        (bool success, ) = aAddress.call{value: msg.value}(
            abi.encodeWithSignature("setX(uint256)", _x)
        );
        require(success, "Call failed");
    }
}

// Proxy Contract: Uses delegatecall to invoke A's logic
contract Proxy {
    address public aAddress;
    uint public x;

    constructor(address _aAddress) {
        aAddress = _aAddress;
    }

    function delegateSetX(uint _x) external {
        (bool success, ) = aAddress.delegatecall(
            abi.encodeWithSignature("setX(uint256)", _x)
        );
        require(success, "Delegatecall failed");
    }
}