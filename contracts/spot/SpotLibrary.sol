
pragma solidity ^0.4.15;

import "./Spot.sol";
import "./SpotEvents.sol";

contract SpotLibrary is SpotEvents {

    address public owner;

    mapping(address => Spot[]) public spots;

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

}
