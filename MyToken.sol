// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor() ERC20("MyToken", "MTK") Ownable(msg.sender) {}

    // Minting function restricted to contract owner with validation
    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Cannot mint to the zero address");
        require(amount > 0, "Mint amount should be greater than zero");
        _mint(to, amount);
    }

    // Burning function open to any user with validation
    function burn(uint256 amount) public {
        require(amount > 0, "Burn amount should be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to burn");
        _burn(msg.sender, amount);
    }

    // Transfer function open to any user with validation
    function transfer(address receiver, uint256 amount) public override returns (bool) {
        require(receiver != address(0), "Cannot transfer to the zero address");
        require(amount > 0, "Transfer amount should be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to transfer");
        _transfer(msg.sender, receiver, amount);
        return true;
    }
}
