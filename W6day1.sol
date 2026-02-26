// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//3 main data location: storage, memory and calldata

contract DemoStorage{
    //permanent blockchain state until changed which cost gas
    //This lives in storage
    uint256 public Total;

    function increaseT() public {
        Total += 1;
    }
    
}
contract DemoMemory{
    //Temporary working space, created wen runs, destroyed wen func done
    //Used for LocalV, func return data, temp array and struct

    function calculate(uint256 a, uint256 b) public pure returns(uint256){
        uint256 result = a * b;
        return result;//lives in memory
    }

}
contract DemoCalldata{
    //Read only input data and used for external parameters and immutable
    function process(uint256[] calldata numbers) external {}

}

contract Practice{
    uint256[] public scores;

    function addScores(uint256[] memory _scores) public {
        
        for (uint256 i=0; i<_scores.length; i++){
        scores.push(_scores[i]);
        }
    }
}