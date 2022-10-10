//SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;
contract SafeMathTester{
    uint8 public bignum=255;
    function add() public{
        unchecked {bignum+=1;}
    }
}