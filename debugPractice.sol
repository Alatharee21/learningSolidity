// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Debug{
    uint256 public total;
    uint256 public count;

    function mult1(uint256 x) public pure returns(uint256){
        return x * 2;
    }

    function mult(uint256 x) public pure returns(uint256 result){
        result = x * 2;//This is correct because result is already described as the uint256 return value
    }

    /*function mult2(uint256 x) public pure returns(uint256){
        result = x * 2;//This is wrong because i declared returns value but never return anything
    }*/

    function add(uint256 value) public{
        uint256 total = value;//This does not update the state variable because total seem to be redeclared
    }

    function addc(uint256 value) public{
        total = value;//This updates the state variable because total is directly equal to value
    }

    function View() public pure returns(uint256){
        return count;//This throws error because the visibility is set to pure but the return value attempted to read a state variable
    }

    function ViewR() public view returns(uint256){
        return count;//This works fine as we are viewing the state variable
    }

    function ViewE() public view returns(uint256){
        return count += 1;//This does not work fine because i attempted to modify the state variable and :View visibility does not allow modification:
    }

    function ViewER() public returns(uint256){
        return count += 1;
    }
}