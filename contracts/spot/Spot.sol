pragma solidity ^0.4.15;

contract Spot {

    address public owner;
    string public description;

    function Spot(string _description) {
        owner = msg.sender;
        description = _description;
    }
}