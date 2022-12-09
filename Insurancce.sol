// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Insurance{


      address  public insurer;
      address  public user;
      address public owner;
      bool insurerDeposited;
      bool userDeposited;

      constructor(address _insurer, address _user){
        owner = msg.sender;
         insurer = _insurer;
          user = _user;
      }


        modifier onlyOwner{
        require(msg.sender == owner, "Sender is not owner");
        _;
    }
     // receive() external payable{}

    //  fallback() external payable {}

      function insurerDeposit() external payable{

         require(!insurerDeposited, "Transaction already happened");
         

          require(msg.sender == insurer);
          require(msg.value == 10000, "Invalid Value "); // Assume 1wei = 1Rs
           insurerDeposited = true;
      }

      function userDeposit() external payable{

          require(!userDeposited, "Transaction already happened");
          
              require(msg.sender == user);
          require(msg.value == 500, "Invalid Value ");
          userDeposited = true;
      }

      function clainInsurenace(bool flightDelayed ) external payable onlyOwner{

          require(address(this).balance == 10500, "Not enough balance");

        if(flightDelayed){
            payable(user).transfer(10500);
        }
        else{
            payable(insurer).transfer(10500);
        }
          

      }

    


}