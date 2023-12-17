// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// GET FUNDS FROM USERS
// WITHDRAW FUNDS
// SET MINIMUN FUND VALUE IN USD

// we want users to spend minimun of 5$
contract FundMe {
    uint public minimunInDollars = 5e18;

    address[] funders;
    mapping(address funder => uint amountFunded) public addressToAmoutFunded;

    function fund() public payable {
        uint ethValue = msg.value;

        require(getConversionRate(ethValue) >= 1e18, "You didn't send anough ETH"); // 1e18 = 1 ETH = 1000000000000000000 
        
        address funder = msg.sender;

        funders.push(funder);
        addressToAmoutFunded[funder] = addressToAmoutFunded[funder] + ethValue;
    }

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (
            /* uint80 roundID */,
            int answer,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();    

        return uint(answer * 1e10);
    }

    function getConversionRate(uint ethAmount) public view returns (uint){
        uint ethPrice = getPrice();
        uint ethAmountInUsd = (ethAmount * ethPrice) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() public view returns (uint){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}