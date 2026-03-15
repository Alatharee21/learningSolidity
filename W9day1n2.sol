// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Prozy{

    address public owner;
    bool private initialized;//To prevent anyone from turning themselves to owner

    error AlreadyInitialized();

    modifier initializer(){
        require(!initialized, AlreadyInitialized());
        _;
    }
    
    function initialize(address _owner) public initializer {

        owner = _owner;

        initialized = true;
    }

    /*
    Openzeppelin
    function initialize(address _owner) public initializer {
        owner = _owner;
    }
    */

}