// Raffle

// enter the lottery
// pick a rsndom winner(verifiably random)
// winner to be selected every minutes--->> completely automated
// Chinlinnoracle --> randomness, Automated execution (chainlibkk keepers)

// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

error Raffle__NotEnoughEntered();


contract Raffle {
    // State Variables
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle()public payable {
        // reqiure (msg.value > i_entranceFee, "Not enough ETH")
        if (msg.value < i_entranceFee){revert Raffle__NotEnoughEntered();}
        s_players.push(payable(msg.sender));
    }

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayer(uint256 index) public view returns(address) {
        return s_players[index];
    }

}
