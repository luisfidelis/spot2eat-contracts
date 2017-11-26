pragma solidity ^0.4.15;

contract Spot {

    address public owner;
    string public description;

    uint256 public latitude;
    uint256 public longitude;
    uint256 public altitude; 

    function Spot(
        string _description,
        uint256 _lat,
        uint256 _lng,
        uint256 _alt)
    {
        owner = msg.sender;
        description = _description;
        latitude = _lat;
        longitude = _lng;
        altitude = _alt;
    }


}