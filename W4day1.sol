// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EthGas{
    address payable public recipient = payable(msg.sender);//must be marke payable for an address to be able to receive eth
    error EthSendFailed();


    //transfer-Now discouraged
    /*function Transfer(uint256 amount) public payable {
    payable(msg.sender).transfer(amount);
    }*/

    //send-Adds complexity without solving gas issues in Transfer
    /*function Success(uint256 amount) public payable{
        bool success = payable(msg.sender).send(amount);
        require(success, EthSendFailed());
    }*/

    //call-Recommended
    function CAll(uint256 Amount) public payable {
    (bool success, ) = payable(msg.sender).call{value:Amount}("");
    require(success, EthSendFailed());
    }

    function GetBalance() public view returns(uint256) {
       return address(this).balance;
    }

    receive() external payable{}
    fallback() external payable{}

}

/*Write a withdraw function using call
Add require checks
Update state before sending ETH
Test sending ETH to a contract with receive function*/
contract WithdrawalFunc{
    error InsufficientBalance();
    mapping(address => uint256) public balances;

    function Deposit(uint256 amount)public payable {
        balances[msg.sender] += amount;
    }

    function Withdraw(uint256 amount) public payable {
        require(amount <= msg.value, InsufficientBalance());

        balances[msg.sender] -= amount;

        (bool approved, ) = payable (msg.sender).call{value: amount}("");
        require(approved, InsufficientBalance());
    }
}