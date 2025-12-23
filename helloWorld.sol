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

/*contract variables{
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

    function loopCheck(uint256 allocation) public pure returns(string memory){
        for(uint256 allocation; allocation < 256; allocation++){
            return "We made it this far";
        }
    }
}*/

/*contract Loop {
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
}*/

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

/*contract IfElse {
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

contract MyMapping{
    mapping (string => uint256) public disMapping;
    mapping (address => uint256) public alloMapping;
    mapping (address => bool) public hasClaimed;

    function getMap(string memory _name) public view returns(uint256) {
        return disMapping[_name];
    }

    function setMap(string memory _name, uint256 _value) public {
        disMapping[_name] = _value;
    }

    function setAllo(address _address, uint256 _allocazion) public {
        alloMapping[_address] = _allocazion;
    }

    function checkClaim(address _address) public view returns (bool){
        return alloMapping[_address] != 0;
    }
}*/

/*contract MyArray{
    uint256[] public num1;
    uint256[3] public num2;
    string [] public names;
    uint256[][] public num3 = [ [1,2,3], [4,5,6], [7,8,9]];

    function getName(uint256 index) public view returns(string memory) {
        return names[index];
    }

    function pushNum(uint256 i) public {
        num1.push(i);
    }

    function pushName(string memory i) public {
        names.push(i);
    }

    function getArr() public view returns(uint256[] memory){
        return num1;
    }

    function getArr2D() public view returns(uint256[][] memory){
        return num3;
    }

    function remLast() public {
        num1.pop();
    }

    function theLength() public view returns(uint256){
        return num1.length;
    }

    function remove(uint256 index) public {
        delete num1[index];
    }

    function removeShifting(uint256 _index) public {
        //require(_index < num1.length, "index out of bounds");

        for (uint256 i = _index; i < num1.length - 1; i++) {
            num1[i] = num1[i + 1];
        }
        num1.pop();
    }

    function removeReplace(uint256 index) public {
        // Move the last element into the place to delete
        num1[index] = num1[num1.length - 1];
        // Remove the last element
        num1.pop();
    }
}*/

/*contract stats{

    enum Status{
        waiting,
        alerted,
        accepted,
        rejected,
        declined
    }

    Status public status = Status.alerted;


    function getStats() public view returns(Status){
        return status;
    }

    function set(Status _status) public {
    status = _status;
    }

    function wait() public {
    status = Status.waiting;
    }

    function alert() public {
    status = Status.alerted;
    }

    function accept() public {
    status = Status.accepted;
    }

    function reject() public {
    status = Status.rejected;
    }

    function cancel() public {
    status = Status.declined;
    }


}*/

enum AirdropState{
 Checked,
 Unclaimed,
 Claimed,
 Vesting 
}

contract claiming{
    AirdropState public states;

    //Not a good function
    function claimor() public {

    if(msg.sender == 0x01eca328b460e687795d714749f5692eb097118c){
        states = AirdropState.Checked;
    }
    else if(msg.sender == 0x52908400098527886E0F7030069857D2E4169EE7){
        states = AirdropState.Claimed;
    }
    else if(msg.sender == 0x8617E340B3D01FA5F11F306F4090FD50E238070D){
        states = AirdropState.Unclaimed;
    }
    else if(msg.sender == 0xde709f2102306220921060314715629080e2fb77){
        states = AirdropState.Vesting;
    }
    else if(msg.sender == 0x27b1fdb04752bbc536007a920d24acb045561c26){
        states = AirdropState.Unclaimed;
    }
    else if(msg.sender == 0x5aAeb6053F3E94C9b9A09f33669435E7Ef1BeAed){
        states = AirdropState.Claimed;
    }
    }

    /*mapping(address => AirdropState) public ctates;

    ctates[msg.sender] = AirdropState.Claimed;*/
}