// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract sendEther{
    constructor() payable{}

    receive() external payable {}

    function send_Transfer(address payable _to) external payable{
        _to.transfer(123);
    }

      function send_send(address payable _to) external payable{
        bool success = _to.send(123);
        require(success, "failed");
    }

      function send_Call(address payable _to) external payable{
       (bool success,) = _to.call{value: 123}("");
       require(success, "failed");
    }
}

contract Receing_contract{
    receive() external payable{}
}