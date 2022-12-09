// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract A{

    function foo() public pure virtual returns(string memory){
        return "foo";
    }

      function bar() public pure virtual returns(string memory){
        return "bar";
    }
}

contract B is A{
    function foo() public pure override returns(string memory){
        return "foo";
    }

      function bar() public pure override returns(string memory){
        return "bar";
    }
}

