// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//import "./PriceConverter.sol";

contract FundMe{
    address[] public funders;
    mapping(address => uint256) public addresstoAmountFunded;

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    error MustBeOwner();
    error Transactionfailed();

    modifier onlyOwner(){
        require(msg.sender == owner, MustBeOwner());
        _;
    }

    function fund() public payable{
        funders.push(msg.sender);
        addresstoAmountFunded[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public onlyOwner{
        addresstoAmountFunded[msg.sender] -= amount;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, Transactionfailed());
    }

    receive() external payable { fund(); }
    fallback() external payable { fund(); }
}