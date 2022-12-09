// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract verifySign{

    function verify(address _signer, string memory _msg, bytes memory _sig) external pure returns(bool){

        bytes32 msgHash = keccak256(abi.encodePacked(_msg));

        bytes32 ethSignMsgHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message \n32", msgHash));


         (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
       return ecrecover(ethSignMsgHash, v, r, s) == _signer; 

       // return recover(ethSignMsgHash, _sig) == _signer;
    }

    // function recover(bytes32 _ethSignMsgHash, bytes memory _sig) public pure returns(address){
    //     (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
    //    return ecrecover(_ethSignMsgHash, v, r, s); 
    // }

    function _split(bytes memory _sig) internal pure returns (bytes32 r, bytes32 s, uint8 v){
        require(_sig.length == 65, "invalid sugnarture");

        assembly {
            r := mload(add(_sig, 32))
            s := mload(add(_sig, 64))
            v := byte(0, mload(add(_sig, 96)))
        }
    }
}