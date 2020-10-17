# Contract IERC1155Views

* **Path:** IERC1155Views.sol
* **Version:** 1
* **Title:** IERC1155Views - An optional utility interface to improve the ERC-1155 Standard.

---

- [Description](#description)
- [Methods](#methods)
  - [totalSupply(uint256)](#totalsupplyuint256)
    - [Params](#params)
  - [name(uint256)](#nameuint256)
    - [Params](#params-1)
  - [symbol(uint256)](#symboluint256)
    - [Params](#params-2)
  - [decimals(uint256)](#decimalsuint256)
    - [Params](#params-3)
  - [uri(uint256)](#uriuint256)
  - [Params](#params-4)

## Description

This interface introduces some additional capabilities for ERC-1155 Tokens.

## Methods

### totalSupply(uint256)

Returns the total supply of the given token id.

#### Params

- `objectId`: the id of the token whose availability you want to know

### name(uint256)

Returns the name of the given token id.

#### Params

- `objectId`: the id of the token whose name you want to know

### symbol(uint256)

Returns the symbol of the given token id.

#### Params

- `objectId`: the id of the token whose symbol you want to know

### decimals(uint256)

Returns the decimals of the given token id.

#### Params

- `objectId`: the id of the token whose decimals you want to know

### uri(uint256)

Returns the uri of the given token id.

### Params

- `objectId`: the id of the token whose uri you want to know
