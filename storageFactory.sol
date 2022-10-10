//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./simpleStorage.sol";
contract storageFactory{
   simplestorage[] public simplestorageArray;
   function createSimpleStorageContract() public{
       simplestorage simplest =new simplestorage();
       simplestorageArray.push(simplest);
   }
   function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
       simplestorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
      
   }
   function sfget(uint256 _simpleStorageIndex) public view returns(uint256) {
      return simplestorageArray[_simpleStorageIndex].retrive();
      
   }
}
