// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract FinanceLedger{
    type amounts is uint256;
    mapping(address => amounts) public ledger;


function add(amounts  amt)public{
    uint256 theAmount = amounts.unwrap(amt);

    uint256 current = amounts.unwrap(ledger[msg.sender]);
    ledger[msg.sender] = amounts.wrap(current + theAmount);
}

function update(amounts  amt)public{
    uint256 theNewAmount = amounts.unwrap(amt);
    ledger[msg.sender] = amounts.wrap(theNewAmount);
}

function retrieve()public view returns(uint256){
    return amounts.unwrap(ledger[msg.sender]);
}

}