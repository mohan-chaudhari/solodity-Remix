// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ImmutableEg{
    address public immutable owner;

    constructor(){
        owner = msg.sender;
    }
}