// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract RasheedToken{
    string public name;
    string public symbol;
    uint256 public decimals;

    uint256 private _totalSupply;

    mapping(address => uint256) public balances;

    constructor(string memory _name, string memory _symbol, uint256 _decimals, uint256 initialSupply){
        name = _name;
        symbol = _symbol;
        decimals = _decimals;

        balances[msg.sender] = initialSupply;
        //_totalSupply = 5000000;
    }

    function totalSupply() public view returns(uint256){
        return _totalSupply;
    }

    function balanceOf(address account) public view returns(uint256){
        return balances[account];
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
    error InsufficientBalance();
    error InvalidAddress();

    function transfer(address to, uint256 amount) public returns (bool){
    require(balances[msg.sender] >= amount, InsufficientBalance());
    require(to != address(0), InvalidAddress());


    balances[msg.sender] -= amount;
    balances[to] += amount;

    emit Transfer(msg.sender, to, amount);

    return true;
}
}