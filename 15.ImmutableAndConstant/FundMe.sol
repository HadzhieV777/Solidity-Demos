//  SPDX-License-Identifier: MIT
pragma solidity 0.8.18; 

import "./PriceConverter.sol";

// constant, immutable

// 	989,494 gas
contract FundMe {
    using PriceConverter for uint256;

    // Const is much cheaper to read from
    uint256 public constant MINIMUM_USD = 50 * 1e18;

    /*
        21,415 gas - constant
        23,515 gas - non-constant
        21,415 * 141000000000 = $9.058545
        23,515 * 141000000000 = $9.946845
    */

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    /*
        21,508 gas - immutable
        23,644 gas - non-immutable
    */

    /*
        Immutable and constant saving gas because instead of storing them in 
        storage slot we save them diretcly into the byte code of the contract
    */

    constructor(){
        i_owner = msg.sender; 
        
    }

    function fund() public payable{
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough!"); 
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner{
       
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
     
        funders = new address[](0);
   
        payable(msg.sender).transfer(address(this).balance);
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send failed!");
        
       (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
       require(callSuccess, "Call failed!");
    }

    modifier onlyOwner {
        require(msg.sender == i_owner, "Sender is not owner!");
        _; 
    }
}
