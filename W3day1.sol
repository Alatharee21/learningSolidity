// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract NestedStruct{

    struct Wallet {
        uint256 balance;
        uint256 lastDeposit;
    }

    struct Security {
        bool twoFAenabled;
        bool isFrozen;
    }

    struct Profile{
        string username;
        uint256 createdAt;
    }

    struct User{
        Wallet wallet;
        Security security;
        Profile profile;
    }

    mapping(address => User) public users;

    function Register(string memory username) public{
        users[msg.sender].profile = Profile({
            username: username,
            createdAt: block.timestamp
        });

        users[msg.sender].security.isFrozen = false;
    }

    function Deposit() public payable{
        require(users[msg.sender].security.isFrozen == false, "Account is FROZEN");
        require(msg.value > 0, "Deposit a valid amount");

        users[msg.sender].wallet.balance += msg.value;
        users[msg.sender].wallet.lastDeposit = block.timestamp;
    }

    function getBalance(address user) public view {
        users[user].wallet.balance;
    }

    function frozeProfile(address user) public {
        users[user].security.isFrozen = true;
    }
}