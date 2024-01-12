pragma solidity ^0.8.20;

import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GitKudos is ERC721URIStorage, Ownable {
    uint256 private _nextTokenId = 1;

    constructor(address _owner) ERC721("GitKudos", "GITKUDOS") Ownable() {
		transferOwnership(_owner);
	}

	function batchMintKudos(address[] memory recipients, string[] memory tokenURIs) public onlyOwner {
		require(recipients.length == tokenURIs.length, "GitKudos: recipients and tokenURIs length mismatch");

		for (uint256 i = 0; i < recipients.length; i++) {
			mintKudos(recipients[i], tokenURIs[i]);
		}
	}

    function mintKudos(address player, string memory tokenURI)
        public
        returns (uint256)
    {
        uint256 tokenId = _nextTokenId++;
        _mint(player, tokenId);
        _setTokenURI(tokenId, tokenURI);

        return tokenId;
    }
}