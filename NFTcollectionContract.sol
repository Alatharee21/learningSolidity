// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract NFTcollectionContract{

    uint256 public nextTokenId;

    address private _owner;
    string private Name = "EnthuNFT";
    string private Symbol = "ETU";

    mapping(uint256 => address) private owners;
    mapping(uint256 => string) private tokenURIs;
    mapping(address => uint256) private balances;

    constructor(){
        _owner = msg.sender;
    }

    error dontHavePermission();
    modifier onlyOwner(){
        require(msg.sender == _owner, dontHavePermission());
        _;
    }



    event Transfer(address indexed from, address indexed to, uint256 tokenId);

    function name() external view returns (string memory){ return Name; }

    function symbol() external view returns (string memory){ return Symbol; }

    function tokenURI(uint256 tokenId) external view returns (string memory){
        return tokenURIs[tokenId];
    }

    function mintNFT(string memory uri) public onlyOwner{

        uint256 tokenId = nextTokenId;

        nextTokenId++;

        owners[tokenId] = msg.sender;

        balances[msg.sender]++;

        tokenURIs[tokenId] = uri;

        emit Transfer(address(0), msg.sender, tokenId);

    }


}