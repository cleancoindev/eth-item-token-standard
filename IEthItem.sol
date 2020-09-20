// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";
import "./IERC1155Views.sol";
import "./IERC20NFTWrapper.sol";
import "./IBaseTokenData.sol";

interface IEthItem is IERC1155, IERC1155Views, IBaseTokenData {

    function init(
        address eRC20NFTWrapperModel,
        string calldata name,
        string calldata symbol
    ) external;

    function toERC20WrapperAmount(uint256 objectId, uint256 ethItemAmount) external view returns (uint256 erc20WrapperAmount);

    function toEthItemAmount(uint256 objectId, uint256 erc20WrapperAmount) external view returns (uint256 ethItemAmount);

    function erc20NFTWrapperModel() external view returns (address);

    function asERC20(uint256 objectId) external view returns (IERC20NFTWrapper);

    function emitTransferSingleEvent(address sender, address from, address to, uint256 objectId, uint256 amount) external;

    function mint(uint256 amount, string calldata partialUri)
        external
        returns (uint256, address);

    function burn(
        uint256 objectId,
        uint256 amount
    ) external;

    function burnBatch(
        uint256[] calldata objectIds,
        uint256[] calldata amounts
    ) external;

    event Mint(uint256 objectId, address tokenAddress, uint256 amount);
}