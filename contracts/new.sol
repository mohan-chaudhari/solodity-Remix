// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Account{

    address owner;

    constructor(address _owner) payable{
        owner = _owner;
    }

}

contract AccountFactory{

    Account[] public accounts;

    function create_Contract()external payable{
        Account account = new Account{value:123}(msg.sender);
        accounts.push(account);

    }

    
}