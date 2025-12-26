// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract UserRegistryWithState {

    enum UserState {
        Unregistered,
        Registered,
        Suspended
    }

    struct User {
        string name;
        uint age;
        UserState state;
    }

    mapping(address => User) private users;

    function register(string memory _name, uint _age) public {
        require(users[msg.sender].state == UserState.Unregistered, "Already registered");

        users[msg.sender] = User({
            name: _name,
            age: _age,
            state: UserState.Registered
        });
    }

    function suspendUser(address _user) public {
        require(users[_user].state == UserState.Registered, "User not active");

        users[_user].state = UserState.Suspended;
    }

    function getUserState(address _user) public view returns (UserState) {
        return users[_user].state;
    }
}
