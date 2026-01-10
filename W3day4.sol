// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//Contract from chatgpt example

contract EventExample {

    mapping(address => uint) public balances;

    event Deposit(address indexed user, uint amount);
    event Withdraw(address indexed user, uint amount);
    event Transfer(address indexed from, address indexed to, uint amount);

    function deposit() public payable {
        //require(msg.value > 0, "Send ETH");
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
}

/*Create events for:
User registration
Role changes
Balance updates

Index:
Addresses
IDs

Avoid indexing:
Strings
Large bytes*/
