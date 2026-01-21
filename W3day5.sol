// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract registration{
    //used custom error as argument to return
    
    error NotAdmin(address attempter);
    error ActiveUser(address reg);
    error InvalidAmount();


    mapping(address => uint256) public balance;
    mapping(address => bool) public isRegistered;
    uint256 private id = 0;
    string private username;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

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
        require(!isRegistered[msg.sender], ActiveUser(msg.sender));
        if(bytes(_username).length == 0){
            revert("Enter a username");
        }

        isRegistered[msg.sender] = true;
        username = _username;
        uint256 uid = id++;
        emit Register(msg.sender, uid);
    }

    modifier OnlyAdmin(){
        require(msg.sender == admin, NotAdmin(msg.sender));
        _;
    }

    function ChangeRole(address _user, Role _roles) external OnlyAdmin {
        roles[_user] = _roles;
        emit Roole(_user, _roles);
    }

    function IncreaseBalance(address _user)public payable {
        require(msg.value > 0, InvalidAmount());
        balance[_user] += msg.value;
        emit Balance(_user, msg.value);
    }
}
