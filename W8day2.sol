// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract W8NFT{

    uint256 public nextTokenId;

    mapping(uint256 => address) private owners;
    mapping(uint256 => string) private tokenURIs;
    mapping(address => uint256) private balances;

    event Transfer(address indexed from, address indexed to, uint256 tokenId);

    function name() external view returns (string memory){}

    function symbol() external view returns (string memory){}

    function tokenURI(uint256 tokenId) external view returns (string memory){
        return tokenURIs[tokenId];
    }

    function mintNFT(string memory uri) public{

        uint256 tokenId = nextTokenId;

        nextTokenId++;

        owners[tokenId] = msg.sender;

        balances[msg.sender]++;

        tokenURIs[tokenId] = uri;

        emit Transfer(address(0), msg.sender, tokenId);

    }

    function bacthMintNFT(string[] memory uri) public{

        uint256 uris = uri.length;

        for(uint256 i = 0; i < uris; i++){

        uint256 tokenId = nextTokenId;

        nextTokenId++;

        owners[tokenId] = msg.sender;

        balances[msg.sender]++;

        tokenURIs[tokenId] = uri[i];

        emit Transfer(address(0), msg.sender, tokenId);
        }

    }


}