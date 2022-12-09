// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract A{
    function callingSet(address addr) public{
       (bool success,) = addr.call(abi.encodeWithSignature("set(uint256)", 123));
       require(success, "call failed.");
    }
}

contract B{
    uint public b;
    function set(uint _b) external {
        b=_b;
    }
}