// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/*library MathLib {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
}

contract Calculator {

    function compute(uint256 a, uint256 b) public pure returns (uint256) {
        return MathLib.add(a, b);
    }
}*/
struct Wallet{
        uint256 balance;
    }

library WalletLib{

    function deposit(Wallet storage self, uint256 amount) internal {
        self.balance += amount;
    }
    function withdraw(Wallet storage self, uint256 amt) internal {
        self.balance -= amt;
    }
}

contract Wallit {
    
    using WalletLib for Wallet;

    Wallet public whaleWalet;

     function deposit(uint256 amount) public  {
        whaleWalet.deposit(amount);
    }

    function withdraw(uint256 amount) public  {
        whaleWalet.withdraw(amount);
    }
}
/*Create a struct Wallet with balance.

Create WalletLib with:

Use 

Test deposit and withdraw.

Observe storage behavior carefully.*/