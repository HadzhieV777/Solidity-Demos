//  SPDX-License-Identifier: MIT
pragma solidity 0.8.18; 

import "./SimpleStorage.sol";

// Inheritance
contract ExtraStorage is SimpleStorage{
    //  override
    //  keywords for overriding: virtual(for parent), override(for child)
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}
