// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Vulnerability{
    uint8 public balance = 255;
    uint8 public balance2 = 0;
    
    function increase() public {
    balance += 1;//This will overflow=0
    }
    function increased() public {
    balance -= 1;//This will underflow=0
    }

}