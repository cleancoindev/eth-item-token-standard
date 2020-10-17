# Contract IEthItem

* **Path:** IEthItem.sol
* **Version:** 1
* **Title:** EthItem Interface - An improved ERC1155 token with ERC20 trading capabilities

---

- [Description](#description)
- [Methods](#methods)
  - [init(address,string,string)](#initaddressstringstring)
    - [Params](#params)
  - [mint(uint256,string)](#mintuint256string)
    - [Params](#params-1)
  - [burn(uint256,uint256)](#burnuint256uint256)
    - [Params](#params-2)
  - [burnBatch(uint256[],uint256[])](#burnbatchuint256uint256)
    - [Params](#params-3)
  - [erc20NFTWrapperModel()](#erc20nftwrappermodel)
  - [asERC20(uint256)](#aserc20uint256)
    - [Params](#params-4)

## Description

In the EthItem standard, there is no a centralized storage where to save every objectId info.
In fact every NFT data is saved in a specific ERC20 token that can also work as a standalone one, and let transfer parts of an atomic object.
The ERC20 represents a unique Token Id, and its supply represents the entire supply of that Token Id.
You can instantiate a EthItem as a brand-new one, or as a wrapper for pre-existent classic ERC1155 NFT.
In the first case, you can introduce some particular permissions to mint new tokens.
In the second case, you need to send your NFTs to the Wrapped EthItem (using the classic safeTransferFrom or safeBatchTransferFrom methods) and it will create a brand new ERC20 Token or mint new supply (in the case some tokens with the same id were transferred before yours).

## Methods

### init(address,string,string)

Constructor When you create a EthItem, you can specify if you want to create a brand new one, passing the classic data like name, symbol, amd URI, or wrap a pre-existent ERC1155 NFT, passing its contract address. You can use just one of the two modes at the same time. In both cases, a ERC20 token address is mandatory. It will be used as a model to be cloned for every minted NFT.

#### Params

- `erc20NFTWrapperModel`: the address of the ERC20 pre-deployed model. It will not be used in the procedure, but just cloned as a brand-new one every time a new NFT is minted.
- `name`: the name of the brand new EthItem to be created. If you are wrapping a pre-existing ERC1155 NFT, this must be blank.
- `symbol`: the symbol of the brand new EthItem to be created. If you are wrapping a pre-existing ERC1155 NFT, this must be blank.

### mint(uint256,string)

Mint If the EthItem does not wrap a pre-existent NFT, this call is used to mint new NFTs, according to the permission rules provided by the Token creator.

#### Params

- `amount`: The amount of tokens to be created. It must be greater than 1 unity.
- `partialUri`: The Uri to locate this new token's metadata.

### burn(uint256,uint256)

Burn You can choose to burn your NFTs. In case this Token wraps a pre-existent ERC1155 NFT, you will receive the wrapped NFTs.

#### Params

- `amount`: Amount of the object to burn to burn
- `objectId`: Id of the object to burn

### burnBatch(uint256[],uint256[])

Burn Batch Same as burn, but for multiple NFTs at the same time

#### Params

- `amounts`: Array of amounts of the objects to burn
- `objectIds`: Array of ids of the objects to burn

### erc20NFTWrapperModel()

GET the `erc20NFTWrapperModel`

### asERC20(uint256)

GET the IERC20NFTWrapper of the corresponding objectId

#### Params

- `objectId`: objectId of which to get an ERC20 representation
