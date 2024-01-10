// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {DeployNft} from "../script/DeployNft.s.sol";
import {NFT} from "../src/NFT.sol";

contract NftTest is Test {
    NFT nft;

    address alice = makeAddr("alice");
    address bob = makeAddr("bob");

    function setUp() external {
        DeployNft deployScript = new DeployNft();
        nft = deployScript.run();

        vm.prank(alice);
        nft.safeMint("ipfs://Qmc9JxfqaccjBxjY44aCugErfRDvmCzF8JvpnDibMgoses");
    }

    function testNftName() external {
        assertEq(nft.name(), "Doggie");
        assert(keccak256(bytes(nft.name())) == keccak256(bytes("Doggie")));
        assert(keccak256(abi.encodePacked(nft.name())) == keccak256(abi.encodePacked("Doggie")));
    }

    function testNftMint() external {
        string memory tokenUri = "ipfs://QmTYu72UhgFPKrJReY1VS3SxBXgf8fxCmvHo8kVUXGdLAf";
        vm.prank(bob);
        nft.safeMint(tokenUri);

        assertEq(nft.tokenURI(1), tokenUri);
        assertEq(nft.ownerOf(1), bob);
    }

    function testNftTransfer() external {
        assertEq(nft.balanceOf(alice), 1);
        assertEq(nft.balanceOf(bob), 0);

        vm.prank(alice);
        nft.safeTransferFrom(alice, bob, 0);

        assertEq(nft.balanceOf(alice), 0);
        assertEq(nft.balanceOf(bob), 1);
    }
}
