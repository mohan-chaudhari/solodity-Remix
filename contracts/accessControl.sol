// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract AccessControl {

    event GrantRole(bytes32 indexed role, address indexed account);
     event RevokeRole(bytes32 indexed role, address indexed account);

    mapping(bytes32=> mapping(address=>bool)) public roles;

    bytes32 private constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
      bytes32 private constant USER = keccak256(abi.encodePacked("USER"));

    constructor(){
        _grantRoles(ADMIN, msg.sender);
    }

    modifier onlyRole(bytes32 _role) {
        require(roles[_role][msg.sender], "Unathorized");
        _;
    }
      function _grantRoles(bytes32 _role, address _account) internal {
          roles[_role][_account] = true;
          emit GrantRole(_role, _account);
      }


       function grantRoles(bytes32 _role, address _account) external onlyRole(ADMIN){
          _grantRoles(_role, _account);
      }

         function revokeRoles(bytes32 _role, address _account) external onlyRole(ADMIN){
           roles[_role][_account] = false;
          emit RevokeRole(_role, _account);
      }

}