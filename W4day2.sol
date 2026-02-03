// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SafeRec{
    receive() external payable {}
    fallback() external payable {}
}

contract Cons{
    address public  owner;
    constructor() {
        owner = msg.sender;
    }
}