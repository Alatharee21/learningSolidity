// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract RasheedToken{
    //state variable
    string public name;
    string public symbol;
    uint256 public decimals;
    address public owner;

    //state*private
    uint256 private _totalSupply;

    //mappings
    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowances;

    //Constructor - to be declared before deployment
    constructor(uint256 initialSupply){
        name = "Rasheed";
        symbol = "Rash";
        decimals = 18;
        owner = msg.sender;

        balances[msg.sender] = initialSupply;
        //_totalSupply = 5000000;
    }

    //modifiers
    modifier onlyAdmin(){
        require(msg.sender == owner, notAdmin());
        _;
    }

    //events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    //errors
    error InsufficientBalance();
    error InsufficientFund();
    error InvalidAddress();
    error AllowanceExceeded();
    error notAdmin();

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

    function allowance(address ownerr, address spender) public view returns (uint256){
    return allowances[ownerr][spender];
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

    function increaseAllowance(address spender, uint256 addedValue) public returns(bool){}
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns(bool){}

    function mint(address to, uint256 amount) public onlyAdmin {

    _totalSupply += amount;

    balances[to] += amount;

    emit Transfer(address(0), to, amount);
}

    function burn(address to, uint256 amount) public onlyAdmin {
        require(balances[msg.sender] >= amount, "insufficient fund");

    _totalSupply -= amount;

    balances[to] -= amount;

    emit Transfer(to, address(0), amount);
}
}