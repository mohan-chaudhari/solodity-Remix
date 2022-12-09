// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract mappingsExample{

    mapping(address => uint) public balances;

    mapping(address => mapping(address => bool)) public friend;

    function test() public{
        
        balances[msg.sender] = 321;

        friend[msg.sender][address(this)] = true;

    }


}