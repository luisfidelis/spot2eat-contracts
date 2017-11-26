pragma solidity ^0.4.15;

import "./spot/Spot.sol";

contract Spot2Eat {

    address public owner;

    mapping(address => Spot[]) public spots;

    function Spot2Eat() {
        owner = msg.sender;
    }
}