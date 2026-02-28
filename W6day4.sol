// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

type WalletId is uint256;
type DepositAmount is uint256;

contract UserDefine{
    mapping(WalletId => DepositAmount) public user;

    error DepositSomething();

    function deposit(WalletId deposi) public payable {
        require(msg.value > 0, DepositSomething());

        DepositAmount now = user[deposi];

        uint256 updated = DepositAmount.unwrap(now) + msg.value;

        user[deposi] = DepositAmount.wrap(updated);
    }
}