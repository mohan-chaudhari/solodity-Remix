// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


contract Test{

    function  fun1() external view returns (uint, uint){
        return (1, block.timestamp);
    }

    
    function  fun2() external view returns (uint, uint){
        return (2, block.timestamp);
    }

    function getData1() external pure returns (bytes memory){
        //abi.encodeWithSignature("fun1()");
        return abi.encodeWithSelector(this.fun1.selector);

    }
     function getData2() external pure returns (bytes memory){
        //abi.encodeWithSignature("fun2()");
        return abi.encodeWithSelector(this.fun2.selector);

    }
}

contract MultiCall{

    function multiCall(address[] calldata targets, bytes[] calldata data) external view returns(bytes[] memory)
    {
         require(targets.length == data.length, "target length != data length");
        bytes[] memory results = new bytes[](data.length);

        for(uint i; i<targets.length; i++){
           (bool success, bytes memory result) =  targets[i].staticcall(data[i]);
            require(success, "call failed");
           results[i] = result;
        }
        return results;  
    }
}