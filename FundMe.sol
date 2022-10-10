//SPDX-License-Identifier: MIT;


pragma solidity ^0.8.7;
import "./PriceConverter.sol";

error NotOwner();
contract FundMe{
    uint256 public constant MINIMUM_USD =50*1e18;
    using PriceConverter for uint256;
    address[] public funders;
    mapping(address => uint256)public addressToAmountFunded;

    address public immutable i_owner;

    constructor(){
        i_owner =msg.sender;
    }
    // 901,747
    // 882,212
    function fund() public payable
    {  
         require(msg.value.getconversionRate() >= MINIMUM_USD,"please send min. 0.5 ether");
            funders.push(msg.sender);
            addressToAmountFunded[msg.sender]=msg.value;

    }

    function withdraw() public onlyOwner{
       // require(msg.sender ==owner,"sender is not owmer")
            for(uint256 funderIndex=0;funderIndex < funders.length; funderIndex++)
            {
                    address funder =funders[funderIndex];
                    addressToAmountFunded[funder]=0;
            }
            // reset the array
            funders =new address[](0);
            // transfer 
            payable(msg.sender).transfer(address(this).balance); //if 2300 or more gas is used then it will through an error so wee usee send;
            //and revert the transcation;

            //send
            bool sendSuccess =payable(msg.sender).send(address(this).balance);
            require(sendSuccess,"Send Failed");


            //call
            (bool callSuccess, )=payable(msg.sender).call{value: address(this).balance}("");
            require(callSuccess, "Call failed");

    }
    modifier onlyOwner {
        //require(msg.sender == i_owner,"sender is not owner");
        if(msg.sender !=i_owner) {revert NotOwner();}
        _;
    }
 
    
}