
pragma solidity ^0.4.15;

import "./Spot.sol";
import "./SpotEvents.sol";
import "eth-random/contracts/Random.sol";

contract SpotLibrary is SpotEvents {

    address public owner;

    mapping(address => Spot[]) public spots;

    Random api;

    function addSpot(
        string _description,
        uint256 _lat,
        uint256 _lng,
        uint256 _alt)
        public
        returns(bool)
    {
        Spot newSpot = new Spot(_description, _lat, _lng, _alt);
        Spot[] storage userSpots = spots[msg.sender];
        userSpots.push(newSpot);        
        spots[msg.sender] = userSpots;
        Spots(msg.sender, _description, newSpot);
        return true;
    }

    function getRandomSpot()
        public
        returns(Spot)
    {
        Spot[] userSpots = spots[msg.sender];
        assert(userSpots.length != 0);
        uint256 range = userSpots.length;
        uint256 spotIndex = api.random(range);
        return userSpots[spotIndex];
    }

}
