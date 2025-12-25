// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title
/// @author
/// @notice
/// @dev

//General syntax of function
/*
function functionName(parameters) visibility stateMutability(View,Pure or nill) returns(returnType){
    logic
    }

    Not every function needs every keyword

    Visibility:
    Public- use when anyone should be able tocall it.
    External- Can only be called outside the contract! use when it is for users or other contracts to call.
    Internal- Can only be called inside the contract! use for shared internal logic or child contracts.
    Private- Can only be called inside the contract! Use for restricted internal helpers.

*/

contract FunctionBasic{
    uint256 private _myNumber;

    function setNum(uint256 __myNumber) public {
        _myNumber = __myNumber;
    }

    function getNum() public view returns(uint256){
        return _myNumber;
    }

    function doubleNum(uint256 myNumber) public pure returns(uint256){
        return myNumber * 2;
    }
}