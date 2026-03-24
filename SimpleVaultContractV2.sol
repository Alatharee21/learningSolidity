// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//Gas optimization
contract SimpleVaultContractV2{
    receive() external payable { }
    fallback() external payable { }

    enum Role {Member, Admin}

    address public immutable owner;
    mapping(address => uint256) public balance;
    mapping(address => Role) public roles;


    error InvalidAmount(uint balance, uint amount);
    error TransactionFailed();
    error NotAnAdmin();
    error Fraudster(address attempter);

    constructor(){
        owner = msg.sender;
    }

    modifier OnlyOwner(){
        if(msg.sender != owner){
            revert Fraudster(msg.sender);
        }
        _;
    }

    function Deposit() public payable{
        if(msg.value <= 0){
            revert InvalidAmount(address(this).balance, msg.value);
        }

        balance[msg.sender] += msg.value;

    }

    function setRole(address user, Role _role) public OnlyOwner{
        roles[user] = _role; 
    }

    function Withdraw(uint256 amount) public payable OnlyOwner{
        if(amount <= 0){
            revert InvalidAmount(address(this).balance, amount);
        }

        if(roles[msg.sender] != Role.Admin){
            revert NotAnAdmin();
        }

        balance[msg.sender] -= amount;

        (bool success, ) = payable(msg.sender).call{value: amount}("");
        if(!success){
            revert TransactionFailed();
        }
    }

}