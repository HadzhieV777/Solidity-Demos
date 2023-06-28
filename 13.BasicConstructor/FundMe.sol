//  SPDX-License-Identifier: MIT
pragma solidity 0.8.18; 

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public owner;
    constructor(){
        owner = msg.sender; //whoever deployed this contract
        
    }

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
        funders = new address[](0);

        // 3. Withdraw the funds
        /*     transfer
          msg.sender = address
          payable(msg.sender) = payable address 
        */
        payable(msg.sender).transfer(address(this).balance);
        
        /* send */
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send failed!");
        
        /* call */
       (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
       require(callSuccess, "Call failed!");
    }
}
