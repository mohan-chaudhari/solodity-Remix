// SPDX-License-Identifier: MIT

pragma solidity  ^0.8;

contract Struct{
    struct Car{
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        Car memory toyota = Car("toyota", 1990, msg.sender);

        Car memory tata = Car({year: 2022, model: "safari", owner: msg.sender});
        Car memory kia;
        kia.model = "Sonet";
        kia.year = 2021;
        kia.owner = msg.sender;

        cars.push(kia);
        cars.push(toyota);
        cars.push(tata);

        Car storage _car = cars[1];
        _car.year = 2222;
    }


}