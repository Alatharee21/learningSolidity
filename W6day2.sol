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
        uint256 len = _numb.length;
        uint256 lenz = uzer.length;
        for(uint256 i = 0; i < len; i++){
            numbers.push(_numb[i]);
        }
        for(uint256 i = 0; i < lenz; i++){
            users.push(uzer[i]);
        }
        
    }
    function changestor(uint256 numb1,uint256 numb2,uint256 numb3) public {
        numbers.push(numb1);
        numbers.push(numb2);
        numbers.push(numb3);
    }

    function changeCall(uint256[] calldata _numb, User[] calldata uzer) external {
        uint256 len = _numb.length;
        uint256 lenz = uzer.length;

        for(uint256 i = 0; i < len; i++){
            numbers.push(_numb[i]);
        }
        for(uint256 i = 0; i < lenz; i++){
            users.push(uzer[i]);
        }
        
    }
}