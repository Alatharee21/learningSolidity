// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//Create events for:
//User registration

contract Base{

    enum Role  {
        none,
        admin,
        member
    }

    mapping(address => Role) public roles;
    event Register(address indexed user, uint256 indexed uid);
    event Roole(address indexed user, Role roles);
    event Balance(address indexed user, uint256 amount);

    address public admin;

    constructor() {
        admin = msg.sender;
    }

    modifier OnlyAdmin(){
        require(msg.sender == admin, "Not an admin");
        _;
    }
}



contract Registration is Base{

    mapping(address => uint256) public balance;
    mapping(address => bool) public isRegistered;
    uint256 private id = 0;
    string private username;

    function RegisterNow(string memory _username) external {
        require(!isRegistered[msg.sender], "Account already exist");

        isRegistered[msg.sender] = true;
        username = _username;
        uint256 uid = id++;
        emit Register(msg.sender, uid);
    }


    function ChangeRole(address _user, Role _roles) external OnlyAdmin {
        roles[_user] = _roles;
        emit Roole(_user, _roles);
    }

    function IncreaseBalance(address _user)public payable {
        require(msg.value > 0, "Deposit something you piss of shite");
        balance[_user] += msg.value;
        emit Balance(_user, msg.value);
    }
}
