// SPDX-License-Identifier: MIT

pragma solidity  ^0.8;

contract safeMath{
    function testUnderFlow() public pure returns(uint){
        uint i = 0;
        i--;
        return i;
    }

     function testUnderFlowCheck() public pure returns(uint){
        uint i = 0;
       unchecked{ i--; }
        return i;
    }
}