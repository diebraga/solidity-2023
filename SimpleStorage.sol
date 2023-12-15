// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18 <0.9.0;

contract SimpleStorage {
    uint myFavouriteNumber;

    struct Person {
        string name;
        uint favouriteNumber;
    }

    Person[] public friendsList;

    mapping(string => uint) nameToFavouriteNumber;

    function addPersonToArray(string memory _name, uint _favouriteNumber) public {
        friendsList.push(Person(_name, _favouriteNumber));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

    function retrieveFavouriteNumberByName(string memory _name) public view returns (uint) {
        return nameToFavouriteNumber[_name];
    }

    function retreiveMyFavouriteNumber() public view returns (uint) {
        return myFavouriteNumber;
    }

    function increaseMyFavouriteNumber(uint _increment) public {
        myFavouriteNumber += _increment;
    }

    function resetMyFavouriteNumber() public {
        myFavouriteNumber = 0;
    }

    function changeMyFavouriteNumber(uint _myFavouriteNumber) public {
        myFavouriteNumber = _myFavouriteNumber;
    }
}

contract SimpleStorage2 {}

contract SimpleStorage3 {}

contract SimpleStorage4 {}