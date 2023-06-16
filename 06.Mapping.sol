//  SPDX-License-Identifier: MIT
pragma solidity 0.8.18; 

contract SimpleStorage {
    uint256 favoriteNumber;

    mapping(string => uint256) public nameToFavoriteNumber;

    People public person = People({
         favoriteNumber: 2, 
         name: "Pesho"
    });

    /*
       Basic Mappings
     
    */

    struct People {
      uint256 favoriteNumber;
      string name;
    }

    People[] public people;

   
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function addPerson (string memory _name, uint256 _favoriteNumber) public {
      people.push(People(_favoriteNumber, _name));
      nameToFavoriteNumber[_name] = _favoriteNumber; // Add to mapping
    }
}
