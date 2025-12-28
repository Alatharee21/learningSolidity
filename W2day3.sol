// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EthReceiver{
    address public owner = msg.sender;

    //No data received
    receive() external payable { }

    //Data is received
    fallback() external payable { }

    function Deposit() public payable{
        require(msg.value > 0, "Motherfucker didn't send shit!");
    }

    function getBalanace() public view{
        address(this).balance;
    }
}