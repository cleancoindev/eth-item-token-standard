// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./IBaseTokenData.sol";

interface IERC20Data is IBaseTokenData {
    function decimals() external view returns (uint256);
}