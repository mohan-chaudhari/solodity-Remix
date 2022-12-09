// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract destruct{

    function kill() external {
        selfdestruct(payable(msg.sender)); // cansend ether to another contract forcefully
    }
}