// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract fundMe {

    uint256 public minimum = 1 * 1e17; // 0.1 ether

    address[] public funders;

    mapping(address=>uint256) public addressToAmountFunded;

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function fund() public payable{
        require(msg.value >= minimum, "Didnt send enough amount");
        funders.push(msg.sender);

        addressToAmountFunded[msg.sender] +=msg.value;
    }

    function withdraw()  public onlyOwner {

        require(msg.sender == owner, "Sender is not owner");

        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call failed...");
    }

    modifier onlyOwner{
        require(msg.sender == owner, "Sender is not owner");
        _;
    }

}