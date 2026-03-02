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

    function withdraw(WalletId depositor, WithdrawAmount amt) public payable{
        require(WithdrawAmount.unwrap(amt) != 0, DepositSomething());

        (bool success, ) = msg.sender.call{value: WithdrawAmount.unwrap(amt)}("");
        require(success, "Transfer failed");
        
        user[WalletId(msg.sender)] -= DepositAmount(WithdrawAmount(amt));
    }
}