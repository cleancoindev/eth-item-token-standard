# Contract IEthItem

* **Path:** IERC20NFTWrapper.sol
* **Version:** 1
* **Title:** ERC20NFTWrapper Interface

---

- [Description](#description)
- [Methods](#methods)
  - [init(uint256, memory, memory, uint256)](#inituint256-memory-memory-uint256)
    - [Params](#params)
  - [mainWrapper()](#mainwrapper)
  - [objectId()](#objectid)
  - [mint(address, uint256)](#mintaddress-uint256)
    - [Params](#params-1)
  - [burn(address, uint256)](#burnaddress-uint256)
    - [Params](#params-2)

## Description

This ERC20 contract contains the information on the ownership of all the shards of this ERC1155 `objectId`.

There is a IERC20NFTWrapper for each `objectId` contained in the main ERC1155.

The ERC1155 contains the mapping of `objectId->address` which in turns contain the mapping `objectId->amount`.

## Methods

### init(uint256, memory, memory, uint256)

#### Params

- `objectId`: Id of the object to wrap
- `name`: Name of the token
- `symbol`: Ticker symbol of the token
- `decimals`: Decimals amount of the token

### mainWrapper()

GET the ERC1155 address that owns this token.

### objectId()

GET the `objectId` that this token represents in the ERC1155 collection.

### mint(address, uint256)

Mint ERC20 and send them to the address.

**Note:** only the `mainWrapper` is allowed to mint

#### Params

- `owner`: Address of the owner of the minted ERC20.
- `amount`: Amount to mint

### burn(address, uint256)

Burn the ERC20 of the owner.

**Note:** only the `mainWrapper` is allowed to burn

#### Params

- `owner`: Address of the owner of the burnt ERC20
- `amount`: Amount of token to burn
