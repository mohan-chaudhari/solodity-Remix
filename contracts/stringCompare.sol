// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract compareString{
    function compareStr(string memory _str1, string memory _str2)external pure returns(string memory){
        if(keccak256(bytes(_str1)) == keccak256(bytes(_str2))){
            return "matched";
        }else {
            return "not matched";
        }
    }

    function compareStrByABI(string memory _str1, string memory _str2)external pure returns(string memory){
        if(keccak256(abi.encodePacked(_str1)) == keccak256(abi.encodePacked(_str2))){
            return "matched";
        }else {
            return "not matched";
        }
    }
}