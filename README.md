# Metacrafters-Create-and-Mint-Token-Project

This Solidity program demonstrates a custom ERC20 token contract with minting, burning, and transferring functionalities. It serves as an example for creating and managing ERC20 tokens on the Ethereum blockchain, including ownership control and basic validations.

## Description

The `MyToken` contract extends OpenZeppelin's `ERC20` and `Ownable` contracts. It allows the contract owner to mint new tokens, and enables any user to burn their tokens or transfer tokens to others. The contract includes validations to ensure correct and secure operations.

## Functions

### Mint

- **Function**: `mint(address to, uint256 amount)`
- **Visibility**: `public`
- **Modifier**: `onlyOwner`
- **Description**: Allows the contract owner to mint new tokens.
- **Parameters**:
  - `to`: Address to receive the minted tokens.
  - `amount`: Number of tokens to mint.
- **Requirements**:
  - `to` must not be the zero address.
  - `amount` must be greater than zero.

### Burn

- **Function**: `burn(uint256 amount)`
- **Visibility**: `public`
- **Description**: Allows any user to burn (destroy) their own tokens.
- **Parameters**:
  - `amount`: Number of tokens to burn.
- **Requirements**:
  - `amount` must be greater than zero.
  - The sender must have a sufficient balance of tokens.

### Transfer

- **Function**: `transfer(address receiver, uint256 amount)`
- **Visibility**: `public`
- **Override**: `ERC20`
- **Description**: Allows any user to transfer their tokens to another address.
- **Parameters**:
  - `receiver`: Address to receive the tokens.
  - `amount`: Number of tokens to transfer.
- **Requirements**:
  - `receiver` must not be the zero address.
  - `amount` must be greater than zero.
  - The sender must have a sufficient balance of tokens.

## Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. Follow these steps:

1. Go to the [Remix IDE website](https://remix.ethereum.org).
2. Create a new file by clicking on the "+" icon in the left-hand sidebar.
3. Save the file with a `.sol` extension (e.g., `MyToken.sol`).
4. Copy and paste the provided code into the file.

```solidity
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
```

5. Click on the "Solidity Compiler" tab in the left-hand sidebar.
6. Set the "Compiler" option to "0.8.0" (or another compatible version).
7. Click on the "Compile MyToken.sol" button.

### Deploying and Interacting

1. After compiling, deploy the contract by clicking on the "Deploy & Run Transactions" tab.
2. Select the MyToken contract from the dropdown menu and click "Deploy."
3. Once deployed, interact with the contract by calling functions like mint, burn, and transfer. Enter parameters and click "transact" to execute.

## Authors

Adrian Oraya

## License

This project is licensed under the MIT License.
