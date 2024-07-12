# MyToken (MTK) - ERC20 Token

## Overview
MyToken (MTK) is an ERC20 token smart contract built using the OpenZeppelin library. It includes functionalities for minting tokens, burning tokens, and ownership management. Additionally, it utilizes the ERC20 Permit extension to enable gasless transactions via permit signatures.

## Features
- **Minting**: Only the contract owner can mint new tokens.
- **Burning**: Any token holder can burn their tokens to reduce the total supply.
- **Ownership**: Includes ownership management via the `Ownable` contract.

## Smart Contract Code
To run this program you can use remic
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract MyToken is ERC20, ERC20Burnable, Ownable, ERC20Permit {
    constructor(address initialOwner)
        ERC20("Token", "MTK")
        Ownable(initialOwner)
        ERC20Permit("MyToken")
    {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
