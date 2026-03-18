// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Aay{

     uint256 public x;

     function setX(uint256 _x) external {
        x = _x;
     }

    }

contract Bee{
    address public aAddress;

    constructor(address _aAddress){
        aAddress = _aAddress;
    }
    
    function callA(uint256 _x) external payable {
        (bool success,) = aAddress.call{value: msg.value}(
            abi.encodeWithSignature("setX(uint256)", _x));
        require(success);
    } 
}

contract Cee{
    address public aAddress;
    uint256 public x;

    constructor(address _aAddress){
        aAddress = _aAddress;
    }
    
    function callA(uint256 _x) external payable {
        (bool success,) = aAddress.delegatecall(
            abi.encodeWithSignature("setX(uint256)", _x));
        require(success);
    } 
}