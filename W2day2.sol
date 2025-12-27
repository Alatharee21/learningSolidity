// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract PureView{
    uint256 internal age;

    function IncreaseAge() public{
        age++;
    }

    function ViewAge() public view returns (uint256){
        return age;
    }

    function AnoAge(uint256 a, uint256 ge)public pure returns(uint256){
        //return a + ge * 2;
        return (a + ge) * 2;
    }
}