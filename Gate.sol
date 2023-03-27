// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Gate is ERC20("GATE TOKEN","GATE") {

    address public owner;
   
    bool public open;

    function verify(bytes4 sig,uint256 blocktimestamp) external {
        require(msg.sig == sig);
        require(block.timestamp == blocktimestamp);
        owner = msg.sender;
    }

    function mint(address receiver, uint amount) external {
        require(receiver != address(1));
        require(msg.sender == owner);
        _mint(receiver,amount);
    }

    function change() external {

        require(balanceOf(address(this)) == 10e18);

        require(balanceOf(tx.origin) == 10e18);

        require(balanceOf(address(1)) == 10e18);

        open = true;

    }
}