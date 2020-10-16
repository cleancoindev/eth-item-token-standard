// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./IERC20Data.sol";

/**
 * @title ERC20NFTWrapper Interface
 * @dev This ERC20 contract contains the information on the ownership of all the shards of this ERC1155 objectId.
 * There is a IERC20NFTWrapper for each objectId contained in the main ERC1155.
 * The ERC1155 contains the mapping of objectId->address which in turns contain the mapping objectId->amount
 */
interface IERC20NFTWrapper is IERC20, IERC20Data {
    /**
     * @dev Contract Initializer
     * @param objectId Id of the object to wrap
     * @param name Name of the token
     * @param symbol Ticker symbol of the token
     * @param decimals Decimals amount of the token
     */
    function init(
        uint256 objectId,
        string memory name,
        string memory symbol,
        uint256 decimals
    ) external;

    /**
     * @dev GET the ERC1155 address that owns this token
     */
    function mainWrapper() external view returns (address);

    /**
     * @dev GET the objectId that this token represents in the ERC1155 collection
     */
    function objectId() external view returns (uint256);

    /**
     * @dev Mint ERC20 and send them to the address.
     * Note: only the mainWrapper is allowed to mint
     * @param owner Address of the owner of the minted ERC20.
     * @param amount Amount to mint
     */
    function mint(address owner, uint256 amount) external;

    /**
     * @dev Burn the ERC20 of the owner.
     * Note: only the mainWrapper is allowed to burn
     * @param owner Address of the owner of the burnt ERC20
     * @param amount Amount of token to burn
     */
    function burn(address owner, uint256 amount) external;
}
