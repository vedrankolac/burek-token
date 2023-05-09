// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.3/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.8.3/access/Ownable.sol";

contract Burek is ERC20, Ownable {
    uint256 public maxTransferLimit;

    constructor() ERC20("Burek", "BUREK") {
        uint256 totalSupply = 21000000 * 10 ** decimals();
        _mint(msg.sender, 21000000 * 10 ** decimals());
        maxTransferLimit = totalSupply / 10; // Set max transfer limit to 10% of total supply
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(amount <= maxTransferLimit, "Transfer amount exceeds the maximum transfer limit");
        return super.transfer(recipient, amount);
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        require(amount <= maxTransferLimit, "Transfer amount exceeds the maximum transfer limit");
        return super.transferFrom(sender, recipient, amount);
    }
}