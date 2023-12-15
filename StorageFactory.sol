// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18 <0.9.0;
import { SimpleStorage, SimpleStorage2 } from "SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listOfContracts;

    function createSimpleStorageContract() public  {
        SimpleStorage newSimpleStorage = new SimpleStorage();
        listOfContracts.push(newSimpleStorage);
    }

    function deleteSimpleStorageContract(uint _index) public {
        require(_index < listOfContracts.length, "Index does not extist");

        // Move the last element into the place to delete
        listOfContracts[_index] = listOfContracts[listOfContracts.length - 1];
        // Remove the last element
        listOfContracts.pop();
    }

    function retrieveNumberOfIndex() public view returns(uint) {
        return listOfContracts.length;
    }

    function storeUsingTheOtherContractFunction(uint _simpleStorageIndex, uint _newFavouriteNumber) public  {
        SimpleStorage mySimpleStorage = listOfContracts[_simpleStorageIndex];
        mySimpleStorage.changeMyFavouriteNumber(_newFavouriteNumber);
    }

    function retrieveMyFavouriteNumberFromOtherContract(uint _index) public view returns(uint) {
        return listOfContracts[_index].retreiveMyFavouriteNumber();
    }
}