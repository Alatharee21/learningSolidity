// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Parent{
    function SayHello() public pure returns(string memory){
        return "Hello World";
    }
    function SayBye() public pure virtual returns(string memory){
        return "Bye World";
    }
    function SayYes() public pure virtual returns(string memory){
        return "Yes";
    }
}

contract Child is Parent{
    function SayBye() public pure override returns(string memory){
        return "Bye 2World";
    }
    /*function SayYes() public pure override returns(string memory){
        return "Not a No";
    }*/
    function SayYes() public pure override returns(string memory){
        return super.SayYes();
    }
}