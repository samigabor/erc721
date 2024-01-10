// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {NFT} from "../src/NFT.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

/** 
 Deploy to Anvil (anvil chain started in a different terminal): 
 forge script script/Interactions.s.sol \
 --rpc-url http://127.0.0.1:8545 \
 --broadcast \
 --private-key=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
 @dev use --interactive for private key with real money

 forge script script/Interactions.s.sol \
 --rpc-url $RPC_URL \
 --broadcast \
 --private-key=$PRIVATE_KEY
*/
contract MintNft is Script {
    string public constant uri = "ipfs://Qmc9JxfqaccjBxjY44aCugErfRDvmCzF8JvpnDibMgoses";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("NFT", block.chainid);
        mintNftOnContract(mostRecentlyDeployed, uri);
    }

    function mintNftOnContract(address contractAddress, string memory tokenUri) public {
        vm.startBroadcast();
        NFT nft = NFT(contractAddress);
        nft.safeMint(tokenUri);
    }
}