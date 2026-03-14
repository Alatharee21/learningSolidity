// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RBACExample {

    mapping(bytes32 => mapping(address => bool)) private roles;

    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant MEME_MAKER = keccak256("MEME_MAKER");

    uint256 public totalSupply;

    constructor() {
        roles[ADMIN_ROLE][msg.sender] = true;
    }

    modifier onlyRole(bytes32 role) {
        require(roles[role][msg.sender], "Access denied");
        _;
    }

    function grantRole(bytes32 role, address account)
        public
        onlyRole(ADMIN_ROLE)
    {
        roles[role][account] = true;
    }

    function revokeRole(bytes32 role, address account)
        public
        onlyRole(ADMIN_ROLE)
    {
        roles[role][account] = false;
    }

    function mint(uint amount)
        public
        onlyRole(MINTER_ROLE)
    {
        totalSupply += amount;
    }
}
