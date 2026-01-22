// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/*Mini Project: Admin-Controlled Registry
Store user details in a mapping with nested structs.


Use modifiers for admin-only updates.


Emit events on user addition or update.


Include custom error handling for invalid operations.*/

contract AdminControlledRegistry{

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    enum RequestType{
        NewRegistration,
        UpdateExistingRecord,
        AccessRequest
    }

    enum Gender{
        Male,
        Female
    }

    struct UserInformation {
        string fullName;
        uint256 YOB;
        Gender gender;
        string emailAddress;
    }

    struct RegistrationDetails {
        RequestType typeRequest;
        string purpose;
        uint256 idN;
    }
    struct User{
        UserInformation userInformation;
        RegistrationDetails regDetails;
    }

    enum Role {
        none,
        admin,
        member
    }


    mapping(address => User) public users;
    mapping(address => Role) public roles;
    mapping(address => Gender) public genders;

    error notAnAdmin();

    modifier AdminOnly(){
        require(msg.sender == owner, notAnAdmin());
        _;
    }

    event DataSubmitted(string _fullName, uint256 YOB, Gender gender, string emailAddress);

    function submitData(string memory _fullName, Gender _gender, uint256 _YOB, string memory _email) public {
        users[msg.sender].userInformation = UserInformation({
        fullName: _fullName,
        YOB: _YOB,
        gender: _gender,
        emailAddress: _email
        });

        emit DataSubmitted(_fullName, _YOB, _gender, _email);
    }

}