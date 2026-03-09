// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract RasheedToken{
    //state variable
    string public name;
    string public symbol;
    uint256 public decimals;

    //state*private
    uint256 private _totalSupply;

    //mappings
    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowances;

    //Constructor - to be declared before deployment
    constructor(string memory _name, string memory _symbol, uint256 _decimals, uint256 initialSupply){
        name = _name;
        symbol = _symbol;
        decimals = _decimals;

        balances[msg.sender] = initialSupply;
        //_totalSupply = 5000000;
    }

    increaseAllowance(address spender, uint256 addedValue);
    decreaseAllowance(address spender, uint256 subtractedValue);

    //events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    //errors
    error InsufficientBalance();
    error InsufficientFund();
    error InvalidAddress();
    error AllowanceExceeded();

    //functions
    function totalSupply() public view returns(uint256){
        return _totalSupply;
    }

    function balanceOf(address account) public view returns(uint256){
        return balances[account];
    }

    function transfer(address to, uint256 amount) public returns (bool){
    require(balances[msg.sender] >= amount, InsufficientBalance());
    require(to != address(0), InvalidAddress());


    balances[msg.sender] -= amount;
    balances[to] += amount;

    emit Transfer(msg.sender, to, amount);

    return true;
    }

    function approve(address spender, uint256 amount) public returns(bool){
        allowances[msg.sender][spender] = amount;

        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function allowance(address owner, address spender) public view returns (uint256){
    return allowances[owner][spender];
    }

    function transferFrom( address from, address to, uint256 amount) public returns (bool){
        require(balances[from] >= amount, InsufficientFund());
        require(allowances[from][msg.sender] >= amount, AllowanceExceeded());

        balances[from] -= amount;
        balances[to] += amount;

        allowances[from][msg.sender] -= amount;

        emit Transfer(from, to, amount);

        return true;
    }
}