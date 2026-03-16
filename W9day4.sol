// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/*contract Vault is ReentrancyGuard {

    function withdraw(uint amount) public nonReentrant {
        ...
    }
}*/
contract ReentGuard{
bool private locked;

modifier noReentrant() {

    require(!locked, "Reentrant call");

    locked = true;

    _;

    locked = false;
}

mapping(address => uint256) private balances;

    function deposit() public payable {
        require(msg.value > 0, "Deposit something chat");//Check

        balances[msg.sender] += msg.value;//Effect
    }

    function withdraw(uint256 amount) public payable noReentrant {
        require(balances[msg.sender] >= amount, "Insufficient fund");//Check

        balances[msg.sender] -= amount;//Effect
        //balances[msg.sender] -= amount;//uses msg.value instead of the amount parameter in the effect and interaction steps. This will cause incorrect balance updates and potential fund loss.

        (bool success,) = payable(msg.sender).call{value: amount}("");//Interaction
        require(success, "Transaction failed");
    }
}

