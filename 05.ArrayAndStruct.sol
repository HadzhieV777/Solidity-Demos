//  SPDX-License-Identifier: MIT
pragma solidity 0.8.18; 

contract SimpleStorage {
    uint256 favoriteNumber;
    People public person = People({
         favoriteNumber: 2, 
         name: "Pesho"
    });

    /*
       Arrays & Structs
        * Struct is like Object: there is kvp
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

    function addPerson (string memory _name, uint256 _favoriteNumber) public {
      People memory newPerson = People(_favoriteNumber, _name);
      people.push(newPerson);
    }
}
