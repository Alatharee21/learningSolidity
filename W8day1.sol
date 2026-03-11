// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ERC721Basics{
    mapping(uint256 => address) private owners;

    //Core functions
    function ownerOf(uint256 tokenId) public view returns(address){
        return owners[tokenId];
    }

    function balanceOf(address owner) public view returns(uint256){}

    function transferFrom(address from, address to, uint256 tokenId) public{}
    function approve(address spender, uint256 tokenId) public{}

    //Two important events
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approveal(address indexed owner, address indexed approved, uint256 indexed tokenId);
}