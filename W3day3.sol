// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Modi{

address public owner;

constructor() {
    owner = msg.sender;
}

modifier onlyOwner(){
    require(msg.sender == owner, "Not owner");
    _;
}

}
//This contract does not work right... I tried
contract ProfileModifier {

    enum Role{
        notAdmin,
        Admin
    }

    enum Status{
        Paused,
        notPaused
    }

    //No actual balance tracking as enums are static; no dynamic updates.
    enum Balance{
        lessThanZero,
        equalToZero,
        greaterThanZero
    }

    address public deployer;
    mapping(address => Role) public roles;
    mapping(address => Status) public status;
    mapping(address => Balance) public balance;
    bool public canDelete;

    constructor (){
        deployer = msg.sender;
    }

    modifier onlyAdmin(){
        if(roles[msg.sender] == Role.notAdmin){
            revert("Not an Admin");
        }
        _;
    }
    modifier notPaused(){
        require(status[msg.sender] == Status.notPaused, "Transfer paused");
        _;
    }
    modifier minimumBalance(){
        require(balance[msg.sender] == Balance.greaterThanZero, "Insufficient fund");
        _;
    }

    //Admin functions
    function setAdmin(address _addr, bool _canDelete) public onlyAdmin payable minimumBalance{
        roles[msg.sender] = Role.Admin;
        roles[_addr] = Role.Admin;
        canDelete = !_canDelete;
    }

    function sackAdmin(address _addr) public onlyAdmin{
        roles[_addr] = Role.notAdmin;
    }

    //Transfer
    function transfer(address payable to, uint256 amount)public payable notPaused{
        require(address(this).balance >= amount, "Insifficient contract balance");
        (bool success, ) = to.call{value: amount}("");
        require(success, "Transfer failed");
    }

    //Withdraw
    function withdraw(uint256 amount) public payable notPaused minimumBalance {
        require(address(this).balance >= amount, "Insifficient contract balance");
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdrawal failed");
    }
}