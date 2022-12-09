// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

library Math{ 
    //can not declare state vars in library

    function max(uint x, uint y)internal pure returns(uint) {

        return x>y?x:y;
    }

    }
contract Library{

    function findMax(uint x, uint y) external pure returns(uint){
        return Math.max(x, y);
    }
}

library Index{

   function  findarrayIndex(uint[] storage arr, uint num) internal view returns(uint i){
       for(i = 0; i< arr.length; i++){
           if(arr[i] == num){
               return i;
           }
       }

   }
}