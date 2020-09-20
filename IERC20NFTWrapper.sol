// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./IERC20Data.sol";

interface IERC20NFTWrapper is IERC20, IERC20Data {

    function init(uint256 objectId, string memory name, string memory symbol, uint256 decimals) external;

    function mainWrapper() external view returns (address);

    function objectId() external view returns (uint256);

    function mint(address owner, uint256 amount) external;

    function burn(address owner, uint256 amount) external;
}