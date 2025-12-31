// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ConditionLoopExample {

    uint256[] public numbers;//array declaration
    uint256 public sum;

    function addNumber(uint256 value) public returns(string memory say) {
        if (value > 0) {
            numbers.push(value);
        }
        else{
            say = "Invalid Value";//This however cost gas , best omitted the else statement.
        }
    }

    function calculateSum() public {
        uint total = 0;

        for (uint i = 0; i < numbers.length; i++) {
            total += numbers[i];
        }

        sum = total;
    }
}

//Run out of gas running this
/*contract ForLoop{
    function Deposit() public payable {

        for(uint256 i=0; i<=address(this).balance; i++){
            require(i >= 0, "Insufficient fund");
        }
    }
}*/

/*contract IfElse{

    //This function here continues to return A even if the value input is >=70 because 70 is greater than 50 and it is read first.
    function orderR(uint256 _x) public pure returns (string memory){
        

    if(_x >= 50){
        return "A";
    }
    else if(_x >= 70){
        return "B";
    }
    else{
        return "F";
    }
    }

    //This one print as expected since we checked the bigger one first.
    function orderRe(uint256 _x) public pure returns (string memory){
        

    if(_x >= 70){
        return "A";
    }
    else if(_x >= 50){
        return "B";
    }
    else{
        return "F";
    }
    }
}*/