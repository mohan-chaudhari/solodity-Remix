// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

error delegatecallFailed();

contract MultiDelegateCall{

    function multiDelegateCall(bytes[] calldata data) external payable returns(bytes[] memory results){

        results = new bytes[](data.length);
        for(uint i=0; i<data.length; i++){
          (bool ok, bytes memory res)=  address(this).delegatecall(data[i]);

          if(!ok){
              revert delegatecallFailed();
          }
          results[i]= res;
        }
    }

}

contract MultiDelegateCallTest is MultiDelegateCall{
    event Log(address caller, string func, uint i);

    function fun1(uint x, uint y) external {
        emit Log(msg.sender, "fun1", x+y);
    }

    function fun2() external returns (uint){
        emit Log(msg.sender, "fun2", 2);
        return 123;
    } 

    function getFun1Data(uint x, uint y) external pure returns (bytes memory){
        return abi.encodeWithSelector(MultiDelegateCallTest.fun1.selector, x, y);
    }
    function getFun2Data() external pure returns (bytes memory){
        return abi.encodeWithSelector(MultiDelegateCallTest.fun2.selector);
    }

}
