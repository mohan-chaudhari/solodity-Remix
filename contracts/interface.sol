// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

interface ICounter{
    function count() external view returns(uint);
    function inc() external;
}
contract A{
    function callingSet(ICounter addr) public{
        addr.inc();
    }
}
