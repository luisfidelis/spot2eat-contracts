pragma solidity ^0.4.15;

import "./spot/Spot.sol";

contract Spot2Eat {

    address public owner;

    mapping(address => Spot[]) public spots;

    event Spots(address _owner, string _description);

    function Spot2Eat() {
        owner = msg.sender;
    }

    function addSpot(string _description) {
        Spot newSpot = new Spot(_description);
        Spot[] userSpots = spots[msg.sender];
        userSpots.push(newSpot);        
        spots[msg.sender] = userSpots;
        Spots(msg.sender, _description);
    }
}