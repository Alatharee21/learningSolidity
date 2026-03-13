// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MultiOwner{
    mapping (uint256 => mapping (address => uint256)) private balances;

    //core functions
    function balanceOf(address account, uint256 id) public view returns(uint256){
        return balances[id][account];
    }

    function balanceofBatch(address[] memory accounts, uint256[] memory ids) public view returns(uint256[] memory){
        //return balances[ids[]][accounts[]];
    }

    function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes memory data) public view {}

    //ERC1155 events
    event TransferSingle(address operator, address indexed from, address indexed to, uint256 id, uint256 value);
    event TransferBatch(address operator, address indexed from, address indexed to, uint256[] id, uint256[] value);

    function mintSingle(address to, uint256 id, uint256 amount) public {
        balances[id][to] += amount;

        emit TransferSingle(msg.sender, address(0), to, id, amount);

    }
}