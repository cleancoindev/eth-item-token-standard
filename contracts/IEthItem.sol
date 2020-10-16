// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0;

import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";
import "./IERC1155Views.sol";
import "./IERC20NFTWrapper.sol";
import "./IBaseTokenData.sol";

/**
 * @title EthItem - An improved ERC1155 token with ERC20 trading capabilities.
 * @dev In the EthItem standard, there is no a centralized storage where to save every objectId info.
 * In fact every NFT data is saved in a specific ERC20 token that can also work as a standalone one, and let transfer parts of an atomic object.
 * The ERC20 represents a unique Token Id, and its supply represents the entire supply of that Token Id.
 * You can instantiate a EthItem as a brand-new one, or as a wrapper for pre-existent classic ERC1155 NFT.
 * In the first case, you can introduce some particular permissions to mint new tokens.
 * In the second case, you need to send your NFTs to the Wrapped EthItem (using the classic safeTransferFrom or safeBatchTransferFrom methods)
 * and it will create a brand new ERC20 Token or mint new supply (in the case some tokens with the same id were transferred before yours).
 */
interface IEthItem is IERC1155, IERC1155Views, IBaseTokenData {
    /**
     * @dev Constructor
     * When you create a EthItem, you can specify if you want to create a brand new one, passing the classic data like name, symbol, amd URI,
     * or wrap a pre-existent ERC1155 NFT, passing its contract address.
     * You can use just one of the two modes at the same time.
     * In both cases, a ERC20 token address is mandatory. It will be used as a model to be cloned for every minted NFT.
     * @param erc20NFTWrapperModel the address of the ERC20 pre-deployed model. It will not be used in the procedure, but just cloned as a brand-new one every time a new NFT is minted.
     * @param name the name of the brand new EthItem to be created. If you are wrapping a pre-existing ERC1155 NFT, this must be blank.
     * @param symbol the symbol of the brand new EthItem to be created. If you are wrapping a pre-existing ERC1155 NFT, this must be blank.
     */
    function init(
        address erc20NFTWrapperModel,
        string calldata name,
        string calldata symbol
    ) external;

    function toERC20WrapperAmount(uint256 objectId, uint256 ethItemAmount)
        external
        view
        returns (uint256 erc20WrapperAmount);

    function toEthItemAmount(uint256 objectId, uint256 erc20WrapperAmount)
        external
        view
        returns (uint256 ethItemAmount);

    /**
     * @dev GET the erc20NFTWrapperModel
     */
    function erc20NFTWrapperModel() external view returns (address);

    /**
     * @dev GET the IERC20NFTWrapper of the corresponding objectId
     */
    function asERC20(uint256 objectId) external view returns (IERC20NFTWrapper);

    function emitTransferSingleEvent(
        address sender,
        address from,
        address to,
        uint256 objectId,
        uint256 amount
    ) external;

    /**
     * @dev Mint
     * If the EthItem does not wrap a pre-existent NFT, this call is used to mint new NFTs, according to the permission rules provided by the Token creator.
     * @param amount The amount of tokens to be created. It must be greater than 1 unity.
     * @param partialUri The Uri to locate this new token's metadata.
     */
    function mint(uint256 amount, string calldata partialUri) external returns (uint256, address);

    /**
     * @dev Burn
     * You can choose to burn your NFTs.
     * In case this Token wraps a pre-existent ERC1155 NFT, you will receive the wrapped NFTs.
     * @param objectId Id of the object to burn
     * @param amount Amount of the object to burn to burn
     */
    function burn(uint256 objectId, uint256 amount) external;

    /**
     * @dev Burn Batch
     * Same as burn, but for multiple NFTs at the same time
     * @param objectIds Array of ids of the objects to burn
     * @param amounts Array of amounts of the objects to burn
     */
    function burnBatch(uint256[] calldata objectIds, uint256[] calldata amounts) external;

    event Mint(uint256 objectId, address tokenAddress, uint256 amount);
}
