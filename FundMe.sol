//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

//Get funds from users
//Withdraw funds
//Set a minimum funding value in USD
contract FundMe{
    uint256 public minimumUsd = 5e18;

    function fund() public payable{
        //Allow users to send funds
        //Set a minimum funding value
        require(getConversionRate(msg.value) > minimumUsd, "Didn't send enough ETH"	);

        //What is a revert?
        //Undo any actions that have been done, and send remaining gas back
    }

    function getLatestPrice() public view returns (uint256) {
        //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); 
       (
            ,
            int answer,
            ,
            ,
        ) = priceFeed.latestRoundData();

        return uint256(answer * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getLatestPrice();
        uint256 ethAmountInUsd = ( ethAmount * ethPrice) / 1e18;
        return ethAmountInUsd;
    }

    function decimals() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); 
        return uint256(priceFeed.decimals());
    }
 
    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    // function withdraw() public {}

}