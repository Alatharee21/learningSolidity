// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//Value types and Reference types

contract VRtypes{
    uint256[] public numbers;

    struct User{
        uint256 balance;
    }

    User[] public users;

    function changeMem(uint256[] memory _numb, User[] memory uzer) public {
        for(uint256 i = 0; i < _numb.length; i++){
            numbers.push(_numb[i]);
        }
        for(uint256 i = 0; i < uzer.length; i++){
            users.push(uzer[i]);
        }
        
    }
    function changestor(uint256 numb1,uint256 numb2,uint256 numb3) public {
        numbers.push(numb1);
        numbers.push(numb2);
        numbers.push(numb3);
    }

    function changeCall(uint256[] calldata _numb, User[] calldata uzer) external {
        for(uint256 i = 0; i < _numb.length; i++){
            numbers.push(_numb[i]);
        }
        for(uint256 i = 0; i < uzer.length; i++){
            users.push(uzer[i]);
        }
        
    }
}