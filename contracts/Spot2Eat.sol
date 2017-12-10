pragma solidity ^0.4.15;

import "./spot/Spot.sol";
import "./spot/SpotEvents.sol";
import "eth-random/contracts/Random.sol";

contract Spot2Eat is SpotEvents {

    address public owner;

    mapping(address => Spot[]) public spots;

    address public spotLibrary;

    Random api;

    function Spot2Eat(address _spotLibrary, address _randomLibrary) {
        owner = msg.sender;
        spotLibrary = _spotLibrary;
        api = Random(_randomLibrary);
    }

    function () payable {
        require(spotLibrary.delegatecall(msg.data));
    }

}