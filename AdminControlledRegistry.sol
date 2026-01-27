// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

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

    enum SubmissionStatus {
    Pending,
    Accepted,
    Rejected
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
    mapping(address => SubmissionStatus) public submissionStatus;

    error notAnAdmin();
    error submissionNotPending();

    modifier AdminOnly(){
        require(msg.sender == owner, notAnAdmin());
        _;
    }

    event DataSubmitted(string _fullName, uint256 YOB, Gender gender, string emailAddress);
    event DetailsAdded(RequestType _fullName, string purpose, uint256 iDn);
    event SubmissionAccepted(address indexed user, Role newRole);
    event SubmissionRejected(address indexed user, string reason);
    //event SubmissionsPending(address indexed user, string review);

    function submitData(string memory _fullName, Gender _gender, uint256 _YOB, string memory _email) public {
        require(submissionStatus[msg.sender] == SubmissionStatus.Pending, submissionNotPending());
        users[msg.sender].userInformation = UserInformation({
        fullName: _fullName,
        YOB: _YOB,
        gender: _gender,
        emailAddress: _email
        });
        submissionStatus[msg.sender] = SubmissionStatus.Pending;

        emit DataSubmitted(_fullName, _YOB, _gender, _email);
    }

    function AddDetails(RequestType _requestType, string memory _purpose, uint256 _Idn)public{
        require(submissionStatus[msg.sender] == SubmissionStatus.Pending, submissionNotPending());
        users[msg.sender].regDetails = RegistrationDetails({
            typeRequest: _requestType,
            purpose: _purpose,
            idN: _Idn
        });
        submissionStatus[msg.sender] = SubmissionStatus.Pending;

        emit DetailsAdded(_requestType, _purpose, _Idn);

    }

function processSubmission( address user, bool accept, string memory reason) external AdminOnly {
    //require(submissionStatus[user] == SubmissionStatus.Pending, submissionNotPending());

    if (accept) {
        submissionStatus[user] = SubmissionStatus.Accepted;
        roles[user] = Role.member;

        emit SubmissionAccepted(user, Role.member);

    } else {
        submissionStatus[user] = SubmissionStatus.Rejected;

        emit SubmissionRejected(user, reason);
    }
}

}