// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract NormalMapping{
    //Normal mapping
    mapping(address => uint256) public balance;

    function deposit(/*address _addr*/)public payable{
        balance[msg.sender] += msg.value;
    }
}

contract NestedMapping{
    //mapping(keyType => mapping(key => Value)) public allowances;

    struct DepositInfo {
        uint256 amount;
        uint256 timestamp;
    }

    mapping(address => mapping(uint256 => DepositInfo)) public deposits;

    function deposit(uint256 id) public payable {
        require(msg.value > 0, "Send ETH");

        deposits[msg.sender][id].amount += msg.value;
        deposits[msg.sender][id].timestamp = block.timestamp;
    }

    function getDeposit(address user, uint256 id) public view returns (uint256, uint256) {
        DepositInfo memory info = deposits[user][id];
        return (info.amount, info.timestamp);
    }
}

contract UserItemOwnership{
    struct Own {
        bool own; 
    }
    mapping(address => mapping(uint256 => Own)) public NFT;

    function mint(uint256 _id)public payable returns(bool){
        require(msg.value > 0, "Not enough holding");
        return NFT[msg.sender][_id].own = true;
    }
}
contract RoleUserPermission{
    struct Role{
        bool admin;
        bool moderator;
        bool member;
    }

    enum Permission{
        notGrantor,
        manage,
        Grantor
    }

    Permission permissions;

    mapping(address => mapping(Permission => Role)) public User;

    function cpermission(Permission _permission) public{
        if(_permission == Permission.notGrantor){
        User[msg.sender][_permission].member = true;
        }
        else if (_permission == Permission.Grantor){
            User[msg.sender][_permission].admin = true;
        }
        else{
            User[msg.sender][_permission].moderator = true;
        }
    }
}