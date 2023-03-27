// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Selector{
    function getSelector(string calldata _func) external pure returns(bytes4){
        return bytes4(keccak256(bytes(_func)));
    }
}