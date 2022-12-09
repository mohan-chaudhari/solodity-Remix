// SPDX-License-Identifier: MIT

pragma solidity  ^0.8;

error Unathorized(address caller);

contract VendingMachine{

address payable owner = payable(msg.sender);

function withdraw() public{
    if(msg.sender != owner)
    revert Unathorized(msg.sender);
    owner.transfer(address(this).balance);
}


}