// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ERC721Basics{

    string public name = "firtsNFT";
    string public symbol = "fNFT";


    mapping(uint256 => address) private owners;
    mapping(address => uint256) private balances;

    uint256 public nextTokenId;

    //Core functions
    function ownerOf(uint256 tokenId) public view returns(address){
        return owners[tokenId];
    }

    function balanceOf(address owner) public view returns(uint256){
        return balances[owner];
    }

    function mintNFT() public{
        uint256 tokenId = nextTokenId;

        nextTokenId++;

        owners[tokenId] = msg.sender;

        balances[msg.sender]++;

        emit Transfer(address(0), msg.sender, tokenId);

    }

    function batchMint(uint256 quantity) public {
        for(uint256 i = 0; i < quantity; i++){
            uint256 tokenId = nextTokenId;

        nextTokenId++;

        owners[tokenId] = msg.sender;

        balances[msg.sender]++;

        emit Transfer(address(0), msg.sender, tokenId);
        }
    }

    function transferFrom(address from, address to, uint256 tokenId) public returns(bool){
        
        balances[from] -= tokenId;
        balances[to] += tokenId;

        emit Transfer(from, to, tokenId);

        return true;
    }

    function approve(address spender, uint256 tokenId) public{}

    //Two important events
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approveal(address indexed owner, address indexed approved, uint256 indexed tokenId);

    }