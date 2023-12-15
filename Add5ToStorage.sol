// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18 <0.9.0;

import { SimpleStorage } from "./SimpleStorage.sol";

contract Add5ToStorage is SimpleStorage {
    function changeMyFavouriteNumber(uint _myFavouriteNumber) public override {
        myFavouriteNumber = _myFavouriteNumber + 5;
    }
}