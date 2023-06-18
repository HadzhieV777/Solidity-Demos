//  SPDX-License-Identifier: MIT
pragma solidity 0.8.18; 

import "./SimpleStorage.sol";
/*
  Smart contracts are composable, because they can 
   easily interact with each other
*/

contract StorageFactory { 
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
      SimpleStorage simpleStorage = new SimpleStorage();
      simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address
       // ABI -> Application Binary Interface
       simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        // SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        // return simpleStorage.retrieve();
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}
