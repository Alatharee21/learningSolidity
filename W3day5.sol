// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ValidationExample {

    uint256 public balance;

    function deposit() public payable {
        require(msg.value > 0, "Must send ETH");
        balance += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(amount > 0, "Invalid amount");
        require(balance >= amount, "Insufficient balance");

        balance -= amount;

        assert(balance >= 0);
        payable(msg.sender).call{value: amount};
    }

    function riskyOperation(uint256 value) public pure returns (uint256) {
        if (value > 100) {
            revert("Value too large");
        }
        return value * 2;
    }
}
