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

contract ProfileModifier {

    enum Role{
        notAdmin,
        Admin
    }

    address public deployer;
    mapping(address => Role) public roles;
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
        require(msg.value > 0, "Transfer paused");
        _;
    }
    modifier minimumBalance(){
        require(msg.value > 0, "Insufficient fund");
        _;
    }

    //Admin functions
    function setAdmin(address _addr) public onlyAdmin payable minimumBalance{
        roles[_addr] = Role.Admin;
    }

    function sackAdmin(address _addr) public onlyAdmin{
        roles[_addr] = Role.notAdmin;
    }

    function admin() public onlyAdmin{
        canDelete = true;
    }

    //Transfer
    function transfer(uint256 amount)public payable notPaused returns(uint256){
       return amount -= msg.value;
    }

    //Withdraw
    function withdraw(uint256 amount) public payable minimumBalance {
        amount -=msg.value;
    }
}