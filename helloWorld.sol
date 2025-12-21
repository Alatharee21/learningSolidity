// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

/*contract HelloWorld{
    //string public greet = "Hello mfck! LFG";
}*/

/*contract counter{
    uint256 public count;

    function value() public view returns(uint256){
        return count;
    }

    function inc() public{
        count +=1;
    }

    function dec() public {
        count -=1;
    }
}*/

/*contract dataType{
    bool public boo = true;
    string public Sring = "this is a string";
    uint256 public no1 = 45;

    uint256 public maxUint = type(uint256).max;
    uint256 public minUint = type(uint256).min;

    int256 public no2 = -45;
    address public addrr;
    bytes1 public a = 0xb5;
}*/

contract variables{
    //State Variables(Declared outside the function)
    string public Sring = "this is a string";
    uint256 public no1 = 45;
    uint256 public constant MY_UNIT = 1999;
    address public constant MY_ADDRESS = 0x01eca328b460e687795d714749f5692eb097118c;

    uint256 public immutable myLORE;
    address public immutable myADDRESS;
    address public immutable claimAddress;
    uint256 public immutable allocation;

    constructor(uint256 _myLORE, address _claimAddress){
        myLORE = _myLORE;
        claimAddress = _claimAddress;
        allocation = myLORE * 15; //Airdrop allocation
        myADDRESS = 0x01eca328b460e687795d714749f5692eb097118c;
    }

    function check(uint256) public view returns(string memory){
        if(allocation < 15){
            return "Damn! You are not eligible";
        }
        else{
            return "Congratulations! You are eligible.";
        }
    }

    function localVariables() public pure returns(uint256, string memory){
        uint256 i = 45;
        string memory lvar = "Local variables are declared inside function";
        return (i, lvar);
    }

    /*function loopCheck(uint256 allocation) public pure returns(string memory){
        for(uint256 allocation; allocation < 256; allocation++){
            return "We made it this far";
        }
    }*/
}

contract Loop {
    function loop() public pure {
        // for loop
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                break;
            }
        }

        // while loop
        uint256 j;
        while (j < 10) {
            j++;
        }
    }
}

/*contract SimpleStorage {
    // State variable to store a number
    uint256 public num;
    // You need to send a transaction to write to a state variable.
    function set(uint256 _num) public {
        num = 56;
    }

    // You can read from a state variable without sending a transaction.
    /*function get() public view returns (uint256) {
        return num;
    }
}*/

contract IfElse {
    function foo(uint256 x) public pure returns (uint256) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function ternary(uint256 _x) public pure returns (uint256) {
        return _x < 10 ? 1 : 2;
    }
}

contract myMapping{
    mapping (string name => uint256) public disMapping;

    function getMap(string memory _name) public view returns(uint256) {
        return disMapping[_name];
    }
}