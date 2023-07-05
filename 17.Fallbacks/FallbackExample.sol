//  SPDX-License-Identifier: MIT
pragma solidity 0.8.18; 

contract FallbackExample {
    uint256 public result;

    /*
        A contract can have at most one fallback function, declared using either
        fallback() external [payable] or fallback(bytes calldata input) external
        [payable] returns (bytes memory output) (both without the function keyword)

        The fallback function is executed on a call to the contract if none of the 
        other functions match the given function signature, or if no data was supplied at all
        and there is no receive Ether function. 

        The fallback function always receives data, but in order to also receive Ether it must 
        be marked payable.
    */

    // We dont add special function keyword for receive, because solidity knows
    receive() external payable {
        result = 1;
    }

    fallback() external payable {
        result = 2;
    }
}

    /*
       ** RECEIVER OR FALLBACK WILL BE CALLED ** 
        Explainer from: https://solidity-by-example.org/fallback/

        Ether is sent to the contract
               is msg.data empty?
                   /         \
                YES           NO
               /                \
            reveive()?         fallback()
           /         \
          YES         NO
         /               \
     reveive()?       fallback()
    */
