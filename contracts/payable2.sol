// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract PayableEg{
    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
    }
    
    function deposit() external payable {

    }

    function getbanalance() external view returns(uint){
        return address(this).balance;
    }
}