// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract BaseAccess{
    address owner;

    constructor(){
        owner = msg.sender;
    }

    error notOwner();

    modifier onlyOwner(){
        require(owner == msg.sender, notOwner());
        _;
    }
}

library SavingsLib{
    struct Account{
       uint256 increase;
       uint256 decrease;
    }

    function deposit(Account storage self, uint256 amount) internal {
        self.increase += amount;
    }

    function withdraw(Account storage self, uint256 amount) internal {
        self.decrease -= amount;
    }
}

contract Savings is BaseAccess{
    using SavingsLib for SavingsLib.Account;

    SavingsLib.Account private account;

    function deposit(uint256 amount) public payable {
        account.deposit(amount);
    }

    function withdaw(uint256 amount) public payable onlyOwner {
        account.withdraw(amount);
    }
}