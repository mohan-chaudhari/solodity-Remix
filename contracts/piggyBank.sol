// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Piggybank{

    address public owner = msg.sender;
    event Deposit(uint);
    event Withdraw(uint);
    receive() external payable{
    emit Deposit(msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner, 'not owner');
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }


    
}