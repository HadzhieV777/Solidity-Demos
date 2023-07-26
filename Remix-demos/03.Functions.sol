//  SPDX-License-Identifier: MIT
pragma solidity 0.8.18; 

contract SimpleStorage {
    // This gets initialized to 0
    uint256 public favoriteNumber;

    /*
      ! Every smart contract has address- like wallets
      
      ! Any time we change something on-chain, including
        making new contract, it happens in a transaction
    
      * Visibility *
       - public: visible externally and internally
       - private: only visible in the current contract
       - external: only visible externally (only for functions)
       - internal: only visible internally

      ! The more you do the more gas you spend
      
      ! When "view", "pure" are called we won't spend any gas for this function, they disallows
        modifications

      ! We spend gas only on-chain modifications

      ! If a gas calling function calls a view/pure function- only then
        will it cost gas
    */

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        favoriteNumber = favoriteNumber + 1; // Gass example
    }

    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
}
