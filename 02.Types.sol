//  SPDX-License-Identifier: MIT
pragma solidity 0.8.18; 

contract SimpleStorage {
    /* 
       - low level types: boolean, uint, int, address, bytes
    */  
    bool hasFavoriteNumber = true;
    uint256 favoriteNumber = 5; // We ca specify how many bits
    string favoriteNumberInText = "Five"; // Bites objects for text
    int256 favoriteInt = -5;
    address myAddress = 0x4726F2de977860BE48377ADa3d1Db811fF38d1e3;
    bytes32 favoriteBytes = "cat"; // Will be converted

}
