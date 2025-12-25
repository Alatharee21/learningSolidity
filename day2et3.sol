// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title Value Types Practice
/// @notice Practice working with uint, int, bool, and address
contract ValueTypes {
    uint256 public myUint;
    int256 public myInt;
    bool public isActive;
    address public owner;

    // Constructor
    constructor() {
        myUint = 100;
        myInt = -50;
        isActive = true;
        owner = msg.sender;
    }

    // Update functions
    function setUint(uint _num) public {
        myUint = _num;
    }

    function setInt(int _num) public {
        myInt = _num;
    }

    function toggleActive() public {
        isActive = !isActive;
    }

    function setOwner(address _owner) public {
        owner = _owner;
    }
}

/// @title Reference Types Practice
/// @notice Practice strings, arrays, mappings, and structs
contract ReferenceTypes {
    // String
    string public greeting = "Hello Rasheed";

    // Array
    uint256[] public numbers;

    // Mapping
    mapping(address => uint256) public balances;

    // Struct
    struct User {
        string name;
        uint256 age;
        bool isActive;
    }
    mapping(address => User) public users;

    // Functions
    function updateGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

    function addNumber(uint256 _num) public {
        numbers.push(_num);
    }

    function updateBalance(uint256 _amount) public {
        balances[msg.sender] = _amount;
    }

    function addUser(string memory _name, uint256 _age) public {
        users[msg.sender] = User(_name, _age, true);
    }

    function deactivateUser(address _user) public {
        users[_user].isActive = false;
    }
}