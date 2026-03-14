// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MultiOwner{
    mapping (uint256 => mapping (address => uint256)) private balances;
    address public owner;

    event ownerState(address old, address newOwner);
    constructor(){
        owner = msg.sender;
    }

    function transferOwnership(address newOwner) public onlyOwner{
        owner = newOwner;

        emit ownerState(msg.sender, newOwner);
    }

    function renounceOwnership() public onlyOwner{
        owner = address(0);

        emit ownerState(msg.sender, address(0));
    }

    error exploiter();

    modifier onlyOwner(){
        require(msg.sender == owner, exploiter());
        _;
    }

    //core functions
    function balanceOf(address account, uint256 id) public view returns(uint256){
        return balances[id][account];
    }

    function balanceofBatch(address[] memory accounts, uint256[] memory ids) public view returns(uint256[] memory){
        //return balances[ids[]][accounts[]];
    }

    function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes memory data) public view onlyOwner{}

    //ERC1155 events
    event TransferSingle(address operator, address indexed from, address indexed to, uint256 id, uint256 value);
    event TransferBatch(address operator, address indexed from, address indexed to, uint256[] id, uint256[] value);

    function mintSingle(address to, uint256 id, uint256 amount) public onlyOwner {
        balances[id][to] += amount;

        emit TransferSingle(msg.sender, address(0), to, id, amount);

    }

    function mintBatch(address to, uint256[] memory id, uint256[] memory amount) public onlyOwner {
        uint256 ids = id.length;

        for(uint256 i = 0; i < ids; i++){
        balances[id[i]][to] += amount[i];

        emit TransferBatch(msg.sender, address(0), to, id, amount);
        }
    }
}