pragma solidity ^0.4.15;

import "./spot/Spot.sol";
import "./spot/SpotEvents.sol";

contract Spot2Eat is SpotEvents {

    address public owner;

    mapping(address => Spot[]) public spots;

    address public spotLibrary;

    function Spot2Eat(address _spotLibrary) {
        owner = msg.sender;
        spotLibrary = _spotLibrary;
    }

    function () payable {
        require(spotLibrary.delegatecall(msg.data));
    }

}