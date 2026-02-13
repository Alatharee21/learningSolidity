// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

abstract contract Abstract{
    function Calculate(uint256 x) public virtual returns(uint256);
}

contract Implement is Abstract{
    function Calculate(uint256 x) public pure override returns(uint256){
        return x * 2;
    }
}

abstract contract Calculator{
    function Operate(uint256 a, uint256 b) public virtual returns(uint256);
}

contract AddCalculator is Calculator{
    function Operate(uint256 a, uint256 b) public pure override returns(uint256){
        return a + b;
    }
}
contract MultiplyCalculator is Calculator{
    function Operate(uint256 a, uint256 b) public pure override returns(uint256){
        return a * b;
    }
}