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
}
