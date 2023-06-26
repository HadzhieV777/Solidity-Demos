//  SPDX-License-Identifier: MIT
pragma solidity 0.8.18; 

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;


    function fund() public payable{
        require(msg.value.getConversionRate() >= 1e18, "Didn't send enough!"); // 1e18 == 1 * 10 ** 18 == 1000000000000000000 -> 1 eth
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public {
        // 1. Reset the balance of the mapping
        /* starting index, ending index, step amount */
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // 2. Reset the array
        // 3. Actually withdraw the funds

    }
}
