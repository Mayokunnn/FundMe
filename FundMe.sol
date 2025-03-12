//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//Get funds from users
//Withdraw funds
//Set a minimum funding value in USD

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable{
        //Allow users to send funds
        //Set a minimum funding value
        require(msg.value.getConversionRate() > minimumUsd, "Didn't send enough ETH"	);
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;

        //What is a revert?
        //Undo any actions that have been done, and send remaining gas back
    }
   

    function withdraw() public {
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);
    }

}