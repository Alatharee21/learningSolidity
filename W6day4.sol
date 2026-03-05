// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

type WalletId is address;
type DepositAmount is uint256;
type WithdrawAmount is uint256;

contract UserDefine{
    mapping(WalletId => DepositAmount) public user;

    error DepositSomething();

    function deposit(WalletId depositor) public payable {
        require(msg.value > 0, DepositSomething());

        DepositAmount current = user[depositor];

        uint256 updated = DepositAmount.unwrap(current) + msg.value;

        user[depositor] = DepositAmount.wrap(updated);
    }

    function withdraw(WalletId depositor, WithdrawAmount amt) public {
    uint256 withdrawValue = WithdrawAmount.unwrap(amt);
    require(withdrawValue > 0, DepositSomething());

    DepositAmount current = user[depositor];
    uint256 currentValue = DepositAmount.unwrap(current);

    require(currentValue >= withdrawValue, "Insufficient balance");

    uint256 updated = currentValue - withdrawValue;
    user[depositor] = DepositAmount.wrap(updated);

    (bool success, ) = msg.sender.call{value: withdrawValue}("");
    require(success, "Transfer failed");
}
}