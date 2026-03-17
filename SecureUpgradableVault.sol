// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SecureUV{

//Storage

address private owner;
mapping(address => uint256) private balances;

bool private initialized;
bool private locked;

//UUPS storage slot forimplementation
address private implementation;

//Modifiers
modifier initializer(){
    require(!initialized, "Already initialized");
    _;
}

modifier onlyOwner(){
    require(msg.sender == owner, "Fraudster");
    _;
}

modifier noReentrant() {
    require(!locked, "Reentrant call");
    locked = true;
    _;
    locked = false;
}

//Initializer
function initialize(address _owner) public initializer{
    owner = _owner;

    initialized = true;
}

//Core logic
    function deposit() public payable {
        require(msg.value > 0, "Deposit something chat");

        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public payable noReentrant onlyOwner {
        require(balances[msg.sender] >= amount, "Insufficient fund");

        balances[msg.sender] -= amount;

        (bool success,) = payable(msg.sender).call{value: amount}("");
        require(success, "Transaction failed");
    }

    //UUPS upgrade function
    function upgradeTo(address newImplementation) external onlyOwner {
        require(newImplementation != address(0), "Invalid address");

        implementation = newImplementation;
    }

    function getImplementation() public view returns (address) {
        return implementation;
    }
}