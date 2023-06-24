//  SPDX-License-Identifier: MIT
pragma solidity 0.8.18; 

// https://eth-converter.com/ -> Etherium Unit Converter
// https://data.chain.link/ -> Decentralized Data Feeds

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 50 * 1e18;

    function fund() public payable{
        // Want to be able to set a minimum fund amount in USD
        // 1. How do we send ETH to this contract?
        require(getConversionRate(msg.value) >= 1e18, "Didn't send enough!"); // 1e18 == 1 * 10 ** 18 == 1000000000000000000 -> 1 eth
        //  18 decimals
    }

    function getPrice() public view returns(uint256){
       // ABI
       // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
       AggregatorV3Interface priceFeed =  AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
       (,int price,,,) = priceFeed.latestRoundData();
       // ETH in terms of USD
      //  1720.00000000
      return uint256(price * 1e10); // 1**10 = 10000000000
    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed =  AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        // Always multiple before you divide
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    // function withdraw(){}
}
