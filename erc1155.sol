// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC1155MOHAN is ERC1155, ERC1155Burnable, Ownable {

    uint256 FEES = 0.1 ether;
      uint256 MAX_RANGE = 100;
    constructor() ERC1155("https://MohanNFTmarktplace.com/") {}

    function mint(uint256 id, uint256 amount)
        public
        payable
    {
        require(id != 0, "Token does not exist");
         require(id <= MAX_RANGE, "Token out of range");
         require(msg.value >= FEES * amount, "Not enough ethers");
        _mint(msg.sender, id, amount, "");
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
    {
        _mintBatch(to, ids, amounts, data);
    }
}
