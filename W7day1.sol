// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ERC20Standard{
    function totalSupply() public view returns(uint256){}
    function balanceOf(address account) public view returns (uint256){}
    function transfer(address to, uint256 amount) public returns (bool){}
}