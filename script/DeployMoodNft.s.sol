// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {MoodNFT} from "../src/MoodNFT.sol";

/** 
 Deploy to Anvil (anvil chain started in a different terminal): 
 forge script script/DeployMoodNft.s.sol \
 --rpc-url http://127.0.0.1:8545 \
 --broadcast \
 --private-key=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
 @dev use --interactive for private key with real money

 forge script script/DeployMoodNft.s.sol \
 --rpc-url $RPC_URL \
 --broadcast \
 --private-key=$PRIVATE_KEY \
 --verify --etherscan-api-key $ETHERSCAN_API_KEY
*/
contract DeployNft is Script {
    string private sadSvgUri = "data:application/json;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIiB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCI+CiAgICA8IS0tIEhhcHB5IEVtb2ppIC0tPgogICAgPGNpcmNsZSBjeD0iNTAiIGN5PSI1MCIgcj0iNDAiIHN0cm9rZT0iYmxhY2siIHN0cm9rZS13aWR0aD0iMyIgZmlsbD0ieWVsbG93Ii8+CiAgICA8Y2lyY2xlIGN4PSIzNSIgY3k9IjQwIiByPSI1IiBmaWxsPSJibGFjayIvPgogICAgPGNpcmNsZSBjeD0iNjUiIGN5PSI0MCIgcj0iNSIgZmlsbD0iYmxhY2siLz4KICAgIDxwYXRoIGQ9Ik0zNSA3MCBRNTAgNTAgNjUgNzAiIGZpbGw9InRyYW5zcGFyZW50IiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjMiLz4KPC9zdmc+";
    string private happySvgUri = "data:application/json;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIiB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCI+CiAgICAgICAgPCEtLSBIYXBweSBFbW9qaSAtLT4KICAgICAgICA8Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MCIgc3Ryb2tlPSJibGFjayIgc3Ryb2tlLXdpZHRoPSIzIiBmaWxsPSJ5ZWxsb3ciLz4KICAgICAgICA8Y2lyY2xlIGN4PSIzNSIgY3k9IjQwIiByPSI1IiBmaWxsPSJibGFjayIvPgogICAgICAgIDxjaXJjbGUgY3g9IjY1IiBjeT0iNDAiIHI9IjUiIGZpbGw9ImJsYWNrIi8+CiAgICAgICAgPHBhdGggZD0iTTM1IDYwIFE1MCA4MCA2NSA2MCIgZmlsbD0idHJhbnNwYXJlbnQiIHN0cm9rZT0iYmxhY2siIHN0cm9rZS13aWR0aD0iMyIvPgogICAgPC9zdmc+";

    function run() external returns (MoodNFT nft) {
        vm.startBroadcast();
        nft = new MoodNFT(sadSvgUri, happySvgUri);
        vm.stopBroadcast();
    }
}
