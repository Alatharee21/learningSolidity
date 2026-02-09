// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract WithdrawalPattern{
    receive() external payable { }
    fallback() external payable { }

    address public owner;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
    }

    
    error InsufficientFund();
    error WithdrawalFail();

    function Push() public{
        //Dangerous, fund can stuck, reentrancy attack as control temp leaves the contract
    }

    function Pull(uint256 amount) public payable{
        require(msg.value > 0, InsufficientFund());

        balances[msg.sender] -= msg.value;

        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, WithdrawalFail());
    }
}