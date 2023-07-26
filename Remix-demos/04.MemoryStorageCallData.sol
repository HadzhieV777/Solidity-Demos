//  SPDX-License-Identifier: MIT
pragma solidity 0.8.18; 

contract SimpleStorage {
    uint256 favoriteNumber;
    People public person = People({
         favoriteNumber: 2, 
         name: "Pesho"
    });

    /*
       Memory, Storage, Calldata
      
      ! EVM can access and store information in six places:
       * Stack
       * Memory
       * Storage
       * Calldata
       * Code
       * Logs

      ! Structs, Mappings and Arrays -> need to be given memory/calldata keyword if add them
          as function params
    */

    // Struct 
    struct People {
      uint256 favoriteNumber;
      string name;
    }

    // Array 
    // - Dynamic array
    People[] public people;

    // Fixed size array 
    // People[3] public people;


    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // calldata, memory, storage 
    function addPerson (string memory _name, uint256 _favoriteNumber) public {
      people.push(People(_favoriteNumber, _name));
    }
}
