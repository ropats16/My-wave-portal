// SPDX-License-Identifier: UNLICENSED
//Fancy comment for License

pragma solidity ^0.8.0;
//indicates version of solidity used in contract
//this must match version in hardhat config file

import "hardhat/console.sol";
//utility to run console log to debug smart contract

contract WavePortal {
//contract is ike a class
//we name it WavePortal

    uint256 totalWaves;
    //uint256 is unsigned integer with upto 256 bits
    //int may use as many of fewer bits
    //we name it totalWaves
    //totalWaves is a state variable and is stored permannently in contract storage

    //struct WaveData {
        //uint id;
        //uint256 senderAddress;
        //string waveMessage;
        //uint8 userWaveTally;
    //}

    constructor() {
    //constructor() runs the first time we initialise the contract

        console.log("Yo yo, I am a contract and I am smart");
    }

    //mapping(uint => WaveData) public waveTable;

    function wave() public {
    //we create function called wave
    //public tag lets anyone use this function
        totalWaves += 1;
        //totalWaves has default value of 0
        //Everytime function is called, totalWaves increases by 1
        console.log("%s has waved!", msg.sender);
        //%s must be analogous to fstring
        //%s must be used for string data types
        //%s fills in the waver's (person who calls this function) address
        //waveTable[address] = WaveData(totalWaves, msg.sender, userWaveTally += 1);
    }

    function getTotalWaves() public view returns (uint256) {
        //function getTotalWaves can be called by anyone
        //view tag means we can only view data in this function
        //we cannot modify any data in view tagged function
        //returns uint256
        console.log("We have %d total waves!", totalWaves);
        //%d is another example of fstring
        //%d might be used for integers
        return totalWaves;
        //we specify what to return
    }

}