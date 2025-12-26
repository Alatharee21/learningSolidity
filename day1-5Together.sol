// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title Combining day1-5 knowledge
/// @author Rasheed
/// @notice Profile Onchain
/// @dev Stores profile details

contract Profile{
    enum AccountStatus{
        Unregistered,
        Active,
        Inactive
    }

    struct User{
    string  username;
    uint256 age;
    address wallet;
    uint256 creationTime;
    AccountStatus status;
    }
    
    mapping(address => User) stored;

    function createProfile(string memory _username, uint256 _age) public  {
        require(stored[msg.sender].status == AccountStatus.Unregistered, "Account already exist!");

        stored[msg.sender] = User({
            username: _username,
            age: _age,
            wallet: msg.sender,
            creationTime: block.timestamp,
            status: AccountStatus.Active
        });
    }

    function suspendAcct(address _inactive) public{
        require(stored[msg.sender].status == AccountStatus.Active, "Account is inactive");

        stored[_inactive].status = AccountStatus.Inactive;

    }
    function getProfile(address _user) public view returns(string memory, uint256, address, uint256, AccountStatus){
        User memory u = stored[_user];
        return (
            u.username,
            u.age,
            u.wallet,
            u.creationTime,
            u.status
        );
    }
}