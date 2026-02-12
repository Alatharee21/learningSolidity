// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SimpleVaultContract{
    receive() external payable { }
    fallback() external payable { }

    enum Role {Member, Admin}

    address public owner;
    mapping(address => uint256) public balance;
    mapping(address => Role) public roles;


    error InvalidAmount();
    error NotAnAdmin();

    constructor(){
        owner = msg.sender;
    }

    function Deposit() public payable{
        require(msg.value > 0, InvalidAmount());

        balance[msg.sender] += msg.value;

    }

    function setRole(address user, Role _role) public {
        roles[user] = _role; 
    }

    function Withdraw(uint256 amount) public payable{
        require(msg.value < 0, InvalidAmount());
        require(roles[msg.sender] == Role.Admin, NotAnAdmin());

        balance[msg.sender] -= msg.value;

        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Transaction failed");
    }

}