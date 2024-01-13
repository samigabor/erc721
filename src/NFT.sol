// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * forge test 
 * forge test --fork-url $RPC_URL 
 */
contract NFT is ERC721 {
    uint256 public s_tokenCounter;

    mapping(uint256 => string) public s_tokenIdToUri;

    constructor() ERC721("Doggie", "DOG") {
        s_tokenCounter = 0;
    }

    function safeMint(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }
}
