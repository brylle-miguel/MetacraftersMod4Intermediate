// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

     constructor() ERC20("Degen", "DGN") Ownable() {}

    // Events
    event TokensRedeemed(address indexed from, uint256 amount);
    event TokensBurned(address indexed from, uint256 amount);


    // Function to allow the owner to mint new tokens and distribute them as rewards.
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to allow players to transfer tokens to others.
    function transfer(address to, uint256 amount) public override returns (bool) {
        return super.transfer(to, amount);
    }

    // Function to allow players to redeem tokens for items in the in-game store.
    function redeem(uint256 amount) public returns (bool) {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens");
        _burn(msg.sender, amount);

        // Emit event
        emit TokensRedeemed(msg.sender, amount);
        return true;
    }

    // Function to check the token balance of a player.
    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    // Function to allow anyone to burn their own tokens that are no longer needed.
    function burn(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens to burn");
        
        // Burn the tokens
        _burn(msg.sender, amount);

        // Emit event
        emit TokensBurned(msg.sender, amount);
    }
}