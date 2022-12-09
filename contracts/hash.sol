// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Hash{
 
    function hash(string memory str, uint i) external pure returns(bytes32){

        return keccak256(abi.encodePacked(str,i));

    }
}