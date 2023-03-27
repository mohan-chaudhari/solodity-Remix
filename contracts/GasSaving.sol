// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// start ? gas
// use calldata
// state vars in memory
// short circuit
// loop increments
// cache array length
// load array elements to memory

contract GasSavings{

    uint public total;

    function sumIfEvenAndLessThan99(uint[] calldata nums) external { // use calldata for lower gas
        uint _total = total;
        uint len = nums.length;
        for(uint i = 0; i< len; ++i){
            // bool isEven = nums[i] % 2 == 0;
            // bool isLessThan99 = nums[i] < 99;
            uint num = nums.length;

            if(num % 2 == 0 && num < 99){
                _total += nums[i];
            }
        }
        total = _total;
    }

}