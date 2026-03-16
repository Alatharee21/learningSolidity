// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SecureUV{
    /*Implement proxy pattern (Transparent/UUPS).


Test security by attempting common attacks.
*/
address private owner;
mapping(address => uint256) private balances;
bool initialized;
bool private locked;

modifier initializer(){
    require(!initialized, "Already initialized");
    _;
}

function initialize(address _owner) public initializer{
    owner = _owner;

    initialized = true;
}

modifier noReentrant() {

    require(!locked, "Reentrant call");

    locked = true;

    _;

    locked = false;
}

    function deposit() public payable {
        require(msg.value > 0, "Deposit something chat");

        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public payable noReentrant {
        require(balances[msg.sender] >= amount, "Insufficient fund");

        (bool success,) = payable(msg.sender).call{value: amount}("");
        require(success, "Transaction failed");
    }
}