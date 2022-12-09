// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract A{
    function callingSet(B addr, uint x) public{
        addr.set{value: 123}(x);
    }
}

contract B{
    uint public b;
    function set(uint _b) external payable{
        b=_b;
    }
}