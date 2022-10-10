//SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
library PriceConverter{
    function getPrice() internal view returns(uint256){
        //ABI
        //Address  0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        // 0xA39434A63A52E749F02807ae27335515BA4b07F7
        
        AggregatorV3Interface pricefeed=AggregatorV3Interface(0xA39434A63A52E749F02807ae27335515BA4b07F7);
        (,int256 price,,,)=pricefeed.latestRoundData();
        return uint256(price *1e10);
    
   }
    function getVersion() internal view returns (uint256){
            AggregatorV3Interface pricefeed=AggregatorV3Interface(0xA39434A63A52E749F02807ae27335515BA4b07F7);
            return pricefeed.version();
    }
    function getconversionRate(uint256 ethAmount) internal view returns (uint256){
        uint256 ethPrice=getPrice();
        uint256 ethAmountInUsd =(ethPrice*ethAmount)/1e18;
        return ethAmountInUsd;
    }
}