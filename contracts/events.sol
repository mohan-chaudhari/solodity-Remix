// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract events{
    event created(string msg, uint val);
    event indexedLog(address indexed sender, uint val);//only upto 3 indexes permitted

    function emitEvent() external {
        emit created("1st vevent", 1234);
        emit indexedLog(msg.sender, 987);
    }
}