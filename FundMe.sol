// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18 <0.9.0;

import { PriceConverter } from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint;
    uint public minimunInDollars = 5e18;

    address[] funders;
    mapping(address funder => uint amountFunded) public addressToAmoutFunded;

    function fund() public payable {
        uint ethValue = msg.value;
        require(msg.value.getConversionRate() >= 1e18, "You didn't send anough ETH"); // 1e18 = 1 ETH = 1000000000000000000 
        
        address funder = msg.sender;

        funders.push(funder);
        addressToAmoutFunded[funder] = addressToAmoutFunded[funder] + ethValue;
    }

   
}