// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {MoodNFT} from "../src/MoodNFT.sol";

contract MoodNftTest is Test {
    string private sadSvgUri = "data:application/json;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIiB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCI+CiAgICA8IS0tIEhhcHB5IEVtb2ppIC0tPgogICAgPGNpcmNsZSBjeD0iNTAiIGN5PSI1MCIgcj0iNDAiIHN0cm9rZT0iYmxhY2siIHN0cm9rZS13aWR0aD0iMyIgZmlsbD0ieWVsbG93Ii8+CiAgICA8Y2lyY2xlIGN4PSIzNSIgY3k9IjQwIiByPSI1IiBmaWxsPSJibGFjayIvPgogICAgPGNpcmNsZSBjeD0iNjUiIGN5PSI0MCIgcj0iNSIgZmlsbD0iYmxhY2siLz4KICAgIDxwYXRoIGQ9Ik0zNSA3MCBRNTAgNTAgNjUgNzAiIGZpbGw9InRyYW5zcGFyZW50IiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjMiLz4KPC9zdmc+";
    string private happySvgUri = "data:application/json;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIiB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCI+CiAgICAgICAgPCEtLSBIYXBweSBFbW9qaSAtLT4KICAgICAgICA8Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MCIgc3Ryb2tlPSJibGFjayIgc3Ryb2tlLXdpZHRoPSIzIiBmaWxsPSJ5ZWxsb3ciLz4KICAgICAgICA8Y2lyY2xlIGN4PSIzNSIgY3k9IjQwIiByPSI1IiBmaWxsPSJibGFjayIvPgogICAgICAgIDxjaXJjbGUgY3g9IjY1IiBjeT0iNDAiIHI9IjUiIGZpbGw9ImJsYWNrIi8+CiAgICAgICAgPHBhdGggZD0iTTM1IDYwIFE1MCA4MCA2NSA2MCIgZmlsbD0idHJhbnNwYXJlbnQiIHN0cm9rZT0iYmxhY2siIHN0cm9rZS13aWR0aD0iMyIvPgogICAgPC9zdmc+";

    address private user = makeAddr("user");

    MoodNFT nft;

    function setUp() external {
        nft = new MoodNFT(sadSvgUri, happySvgUri);
    }

    function testMintMoodNft() external {
        vm.prank(user);
        nft.mintNft();
        assertEq(nft.balanceOf(user), 1);

        string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMDAiIGhlaWdodD0iNTAiPgogIDx0ZXh0IHg9IjUwJSIgeT0iNTAlIiBkb21pbmFudC1iYXNlbGluZT0ibWlkZGxlIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iMTYiIGZpbGw9Im9yYW5nZSI+CiAgICBGdW4gRnVuIEZvdW5kcnkKICA8L3RleHQ+Cjwvc3ZnPg==";
        
    }
}
