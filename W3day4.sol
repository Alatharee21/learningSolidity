// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//Contract from chatgpt example

/*contract EventExample {

    mapping(address => uint256) public balances;

    event Deposit(address indexed user, uint256 amount);
    event Withdraw(address indexed user, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function deposit() public payable {
        require(msg.value > 0, "Send ETH");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdrawal not successful");
        emit Withdraw(msg.sender, amount);
    }

    function transfer(address to, uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }
}*/


//Create events for:
//User registration

contract registration{
    mapping(address => uint256) public balance;
    mapping(address => bool) public isRegistered;
    uint256 private id = 0;
    string public username;

    enum Role  {
        none,
        admin,
        member
    }

    mapping(address => Role) public roles;

    event Register(address indexed user, uint256 indexed uid);
    event Roole(address indexed user, Role roles);
    event Balance(address indexed user, uint256 amount);

    function RegisterNow(string memory _username) external {
        require(!isRegistered[msg.sender], "Account already exist");

        isRegistered[msg.sender] = true;
        username = _username;
        uint256 uid = id++;
        emit Register(msg.sender, uid);
    }

    function ChangeRole(Role _roles) public {
        roles[msg.sender] = _roles;
        emit Roole(msg.sender, _roles);
    }
}
/*
Role changes
Balance updates

Index:
Addresses
IDs

Avoid indexing:
Strings
Large bytes*/
