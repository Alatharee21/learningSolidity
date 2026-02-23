// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

library SafeMath{
    function add(uint256 x, uint256 y) internal pure returns(uint256){
       return x + y;
    }
    function sub(uint256 x, uint256 y) internal pure returns(uint256){
       return x - y;
    }
    function mult(uint256 x, uint256 y) internal pure returns(uint256){
       return x * y;
    }
    function div(uint256 x, uint256 y) internal pure returns(uint256){
       return x / y;
    }
    function mod(uint256 x, uint256 y) internal pure returns(uint256){
       return x % y;
    }
}

contract Calculator{
    function Addition(uint256 x, uint256 y) public pure returns(uint256){
        return SafeMath.add(x,y);
    }
    function Subtraction(uint256 x, uint256 y) public pure returns(uint256){
        return SafeMath.sub(x,y);
    }
    function Multiplication(uint256 x, uint256 y) public pure returns(uint256){
        return SafeMath.mult(x,y);
    }
    function Divide(uint256 x, uint256 y) public pure returns(uint256){
        return SafeMath.div(x,y);
    }
    function Reminder(uint256 x, uint256 y) public pure returns(uint256){
        return SafeMath.mod(x,y);
    }
}