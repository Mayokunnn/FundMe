//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//Get funds from users
//Withdraw funds
//Set a minimum funding value in USD
contract FundMe{
    uint256 public myValue = 1;

    function fund() public payable{
        //Allow users to send funds
        //Set a minimum funding value
        myValue = myValue + 2;
        require(msg.value > 1e18, "Didn't send enough ETH"	);

        //What is a revert?
        //Undo any actions that have been done, and send remaining gas back
    }

    // function withdraw() public {

    // }

}