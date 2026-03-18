// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract FallReceive{
    event Received(address sender, uint256 amount);
    
    receive() external payable {
        emit Received(msg.sender, msg.value);
     }
    event Fellback(address sender, uint256 amount, bytes data);
    
    fallback() external payable {
        emit Fellback(msg.sender, msg.value, msg.data);
     }
 
}