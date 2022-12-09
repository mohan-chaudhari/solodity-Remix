// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract A{
    string a;
    constructor(string memory _a){
        a= _a;
    }
}

contract B{
    string b;
    constructor(string memory _b){
        b= _b;
    }
}

contract C is A("abc"), B("xyz"){
  
}

contract D is A, B{

    constructor (string memory _a, string memory _b) A(_a) B(_b){

    }       
}