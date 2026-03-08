// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//Here is a minimal ERC-20 Interface (interface IERC20)
contract ERC20Standard{
    //Core ERC20 functions
    function totalSupply() public view returns(uint256){}
    function balanceOf(address account) public view returns (uint256){}
    function transfer(address to, uint256 amount) public returns (bool){}
    function approve(address spender, uint256 amount) public returns (bool){}
    function allowance(address owner, address spender) public view returns (uint256){}
    function transferFrom( address from, address to, uint256 amount) public returns (bool){}//This function powers:decentralized exchanges, staking contracts, lending protocols
    //ERC20 Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    //Optional ERC-20 Metadata Functions
    /*name();
    symbol();
    decimals();*/

    //Internally, a token usually stores
    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowances;
}