// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {NFT} from "../src/NFT.sol";

/** 
 Deploy to Anvil (anvil chain started in a different terminal): 
 forge script script/Interactions.s.sol \
 --rpc-url http://127.0.0.1:8545 \
 --broadcast \
 --private-key=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
 @dev use --interactive for private key with real money
*/
contract MintNft is Script {
    address public mostRecentlyDeployed = 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512;
    string public constant uri = "ipfs://Qmc9JxfqaccjBxjY44aCugErfRDvmCzF8JvpnDibMgoses";

    function run() external {
        mintNftOnContract(mostRecentlyDeployed, uri);
    }

    function mintNftOnContract(address contractAddress, string memory tokenUri) public {
        vm.startBroadcast();
        NFT nft = NFT(contractAddress);
        nft.safeMint(tokenUri);
    }
}