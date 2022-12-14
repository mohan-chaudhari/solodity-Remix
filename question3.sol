// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
 
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
// // import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

 
contract Test is ERC20{

    address public owner;
    address payable public treasuryAddress;

     constructor() ERC20("Question3", "RI") {
           owner = msg.sender;
     }

   AggregatorV3Interface constant priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
 
      modifier onlyOwner{
        require(msg.sender == owner, "Sender is not owner");
        _;
    }

function setTreasuryAddress(address _treasryAddress) external{
    treasuryAddress= payable(_treasryAddress);
}

 function mint(address to) public payable {

    
    uint balaceToTransfer = msg.value*5/100;

     payable(treasuryAddress).transfer(balaceToTransfer);
     balaceToTransfer = msg.value - balaceToTransfer;

     uint priceConverted = getLatestPrice();

      priceConverted = (priceConverted * balaceToTransfer)/10**8;

        _mint(to, priceConverted);
    }


   function getLatestPrice() public view returns (uint256) {
       (, int256 etherPrice, , , ) = priceFeed.latestRoundData();
       return uint256(etherPrice);
   }

}
