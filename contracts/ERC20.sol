// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, ERC20Burnable, Ownable {

    event MintToken(address to, uint amount);
    event BurnToken(address  from, uint amount);
    event TransferToken(address  from, address to, uint amount);
    
    constructor(uint initialSupply) ERC20("MyToken", "MTK")Ownable(msg.sender){}

    function mint(address to, uint amount) public onlyOwner {
        _mint(to, amount);
        emit MintToken(to, amount);
    }

    function Burn(uint256 amount) public {
        _burn(msg.sender, amount);
        emit BurnToken(msg.sender, amount);
    }

    function transferto(address to, uint256 amount) public returns (bool) {
        _transfer(msg.sender, to, amount);
        emit TransferToken(msg.sender, to, amount);
        return true;
    }

}