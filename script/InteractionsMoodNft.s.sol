// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {MoodNFT} from "../src/MoodNFT.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {console} from "forge-std/console.sol";

/** 
 Deploy to Anvil (anvil chain started in a different terminal): 
 forge script script/InteractionsMoodNft.s.sol \
 --rpc-url http://127.0.0.1:8545 \
 --broadcast \
 --private-key=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

 cast send 0x5fbdb2315678afecb367f032d93f642f64180aa3 "mintNft()" --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --rpc-url http://127.0.0.1:8545
 cast send 0x5fbdb2315678afecb367f032d93f642f64180aa3 "flipMood(uint256)" 0 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --rpc-url http://127.0.0.1:8545
 @dev use --interactive for private key with real money

 forge script script/InteractionsMoodNft.s.sol \
 --rpc-url $RPC_URL \
 --broadcast \
 --private-key=$PRIVATE_KEY
*/
contract MintMoodNft is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNFT", block.chainid);
        console.log("Most recently deployed contract address:", mostRecentlyDeployed);
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        MoodNFT nft = MoodNFT(contractAddress);
        console.log("Minting NFT to msg.sender:", msg.sender);
        uint nftTokenCounter = nft.getTokenCounter();
        console.log("NFT token counter:", nftTokenCounter);
        nft.mintNft();
        console.log("Minted NFT. Owner is ", nft.ownerOf(nftTokenCounter));
    }
}