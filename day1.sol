// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; //>=0.8.0 <0.9.0

// This is called NatSpec Comments
/// @title My Day1 Contract
/// @author Rasheed
/// @notice Stores and retrieves a number
/// @dev demonstrates state variables, constructor, and simple functions

//A simple contract contains State variable, Constructor and functions.

contract learningContract{
    uint256 public myNumber;//State Variable

    constructor(uint256 _initNumber){
        myNumber = _initNumber;
    }

    function setMyNumber(uint256 _newNumber) public{
        myNumber = _newNumber;
    }

    function getMyNumber() public view returns(uint256){
        return myNumber;
    }

}