// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

//  SPDX-License-Identifier: MIT
pragma solidity 0.8.18; 

// https://eth-converter.com/ -> Etherium Unit Converter
// https://data.chain.link/ -> Decentralized Data Feeds

/*
      Transactions - Fields
   * Nonce: tx count for the account
   * Gas Price: price per unit of gas (in wei)
   * Gas Limit: max gas that this tx can use
   * To: address that the tx is sent to
   * Value: amount of wei to send
   * Data: what to send to the To address
   * v,r,s: components of tx signature
*/

/*
      Transactions - Value Transfer
   * Nonce: tx count for the account
   * Gas Price: price per unit of gas (in wei)
   * Gas Limit: 21000
   * To: address that the tx is sent to
   * Value: amount of wei to send
   * Data: empty
   * v,r,s: components of tx signature
*/

contract FundMe {

    uint256 public minimumUsd = 50;

    function fund() public payable{
        // Want to be able to set a minimum fund amount in USD
        // 1. How do we send ETH to this contract?
        require(msg.value >= 1e18, "Didn't send enough!"); // 1e18 == 1 * 10 ** 18 == 1000000000000000000 -> 1 eth
    }

    // function withdraw(){}
}
