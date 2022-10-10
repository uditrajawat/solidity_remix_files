//SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;
import "./simpleStorage.sol";
contract extraStorage is simplestorage{
                    function store(uint256 _favint) public override{
                            favint=_favint+5;
                    }
}