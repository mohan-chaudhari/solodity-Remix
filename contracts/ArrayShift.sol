// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract ArrayShift{
    uint[] arr = [1,2,3,4];

    function removeElementFromArray(uint _index) external{

            for(uint i = _index; i< arr.length - 1; i++){
                arr[i] = arr[i+1];
            }
            arr.pop();
            assert(arr[2] == 4);
            assert(arr.length == 3);
    }

}