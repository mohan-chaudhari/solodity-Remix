// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract sendEther{
    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
    }

    receive() external payable{}

    function withdraw() external {
        require(msg.sender == owner, "only owner can withdraww");
        payable(msg.sender).transfer(address(this).balance);
    }
}