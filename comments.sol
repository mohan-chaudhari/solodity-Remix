
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/// @title A simulator for trees
/// @author Larry A. Gardner
/// @notice You can use this contract for only the most basic simulation
/// @dev All function calls are currently implemented without side effects
/// @custom:experimental This is an experimental contract.
contract Test {
    ///array of owner addresses
    address[] public owners;

    ///Mapping from ownerAddress => bool
    mapping(address => bool) public isOwner;

    ///Required number of confirmation before transaction execution
    uint public requiredNumber;

    ///@param to address for the operation
    ///@param value value for the operation
    ///@param data data for the operation
    ///@param performed boolean variable if this operation has been executed or not
    //@param totNum number of current confirmation
    struct Operation {
        address to;
        uint value;
        bytes data;
        bool performed;
        uint totNum;
    }

    ///a mpping from uint => address => bool
    ///if the current operation has been signed by the address or not
    mapping(uint => mapping(address => bool)) public isPerformed;

    ///All the operations
    Operation[] public Operations;

    ///@notice Only owner modifer which checks if the current caller is owner or not
    modifier onlyOwner() {
        require(isOwner[msg.sender], "not owner");
        _;
    }

    /**
     * @dev constructor called on deploying the contract
     * @param _owners all the owners addresses
     * @param _requiredNumber required number of confirmation
     */
    constructor(address[] memory _owners, uint _requiredNumber) {
        require(_owners.length > 0, "owners required");
        require(
            _requiredNumber > 0 && _requiredNumber <= _owners.length,
            "invalid number of required confirmations"
        );

        for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i];

            require(owner != address(0), "invalid owner");
            require(!isOwner[owner], "owner not unique");

            isOwner[owner] = true;
            owners.push(owner);
        }

        requiredNumber = _requiredNumber;
    }

    /**
     * @dev recieve function to recieve native token
     */
    receive() external payable {}

    /**
     * @dev add new operation.Can only be called by the owners
     * @param _to address of operation
     * @param _value value of the operation
     * @param _data data of the operation
     */
    function abc(
        address _to,
        uint _value,
        bytes memory _data
    ) public onlyOwner {
        uint txIndex = Operations.length;

        Operations.push(
            Operation({
                to: _to,
                value: _value,
                data: _data,
                performed: false,
                totNum: 0
            })
        );
    }

    /**
     * @dev can only be called by the owners
     * update idPerformed for the caller
     * @param _txIndex the operation for which caller is signing
     */
    function mno(uint _txIndex) public onlyOwner {
        Operation storage operation = Operations[_txIndex];
        operation.totNum += 1;
        isPerformed[_txIndex][msg.sender] = true;
    }

    /**
     * @dev called by the owners
     * to execute any particular operation from the operations array
     * checks requirenumber of confirmation
     * @param _txIndex operations that need to be executed
     */
    function xyz(uint _txIndex) public onlyOwner {
        Operation storage operation = Operations[_txIndex];

        require(operation.totNum >= requiredNumber, "revert");

        operation.performed = true;

        (bool success, ) = operation.to.call{value: operation.value}(
            operation.data
        );
        require(success, "revert");
    }
}