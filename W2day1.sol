// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Example {

    uint256 public total = 56; //Public State Variable
    uint256 private _secret; //Private State Variable
    uint256 internal _noSecret; //Internal State Variable
    //uint256 external noTPossible; //This will throw error because state variables are always stored on the blockchain and rep the permanent memory.

    
    function add(uint value /*local variable*/) public {
        uint newTotal/*local variable*/ = total + value;
        total = newTotal;
    }

    function _internalLogic(uint value /*local variable*/) internal pure returns (uint) {
        return value * 2/*local variable in logic*/;
    }

    function externalCall() external pure returns (string memory) {
        return "Hello";
    }

    function _secretLogic(uint256 value) private {
        _noSecret = value;
    }
}
