// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {NFT} from "../src/NFT.sol";

/** 
 Deploy to Anvil (anvil chain started in a different terminal): 
 forge script script/DeployNft.s.sol \
 --rpc-url http://127.0.0.1:8545 \
 --broadcast \
 --private-key=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
 @dev use --interactive for private key with real money

 forge script script/DeployNft.s.sol \
 --rpc-url $RPC_URL \
 --broadcast \
 --private-key=$PRIVATE_KEY \
 --verify --etherscan-api-key $ETHERSCAN_API_KEY
*/
contract DeployNft is Script {
    function run() external returns (NFT nft) {
        vm.startBroadcast();
        nft = new NFT();
        vm.stopBroadcast();
    }
}
