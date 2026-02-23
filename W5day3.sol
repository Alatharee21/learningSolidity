// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IExample{
    function DoSomething(uint256 x) external returns (uint256);
}

interface ICalculator {
    function operate(uint256 a, uint256 b) external returns (uint256);
}
interface Ibank{
    function Deposit() external payable;
    function Withdraw(uint256 amount) external payable returns(uint256);
    function BalanceOf(address user) external returns(uint256);
}

contract AddCalculator is ICalculator {

    function operate(uint a, uint b)
        external
        pure
        override
        returns (uint)
    {
        return a + b;
    }
}

contract CheckBank is Ibank{
    mapping(address => uint256) public balances;
    function Deposit() external payable override{
        require(msg.value > 0, "Deposit correct Amount");
        balances[msg.sender] += msg.value;
    }

    function Withdraw(uint256 amount) external payable returns(uint256){
        require(balances[msg.sender] >= amount, "Insufficient");
        balances[msg.sender] -= amount;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Failed");

        return amount;
    }

    function BalanceOf(address user) external view returns(uint256){
        return balances[user];
    }
}