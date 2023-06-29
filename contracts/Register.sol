// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Register {

    struct Data {
        string name;
        uint256 age;
        string hobby;
    }

    address[] public users;

    mapping(address => Data) accounts;

    function registerAccount(string memory _name, uint256 _age, string memory _hobby) public returns (bool) {

        if (!isUserExists(msg.sender)){
            users.push(msg.sender);
        }
        accounts[msg.sender].name = _name;
        accounts[msg.sender].age = _age;
        accounts[msg.sender].hobby = _hobby;
        return true;
    }

    function isUserExists(address user) public view returns (bool) {
        for (uint256 i = 0; i < users.length; i++) {
            if (users[i] == user) { 
                return true;
            }
        }
        return false;
    }

    function viewAccount(address user) public view returns (string memory, uint256, string memory) {
        string memory _name = accounts[user].name;
        uint256  _age = accounts[user].age;
        string memory _hobby = accounts[user].hobby;

        return (_name, _age, _hobby);
    }
}