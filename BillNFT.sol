// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract BillNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // Lưu giá trị hóa đơn (Ví dụ: 1000 USDT)
    mapping(uint256 => uint256) public invoiceValue;

    constructor() ERC721("BillFlow Invoice", "BFI") {}

    function mintInvoice(address recipient, string memory tokenURI, uint256 value)
        public
        returns (uint256)
    {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);
        
        invoiceValue[newItemId] = value; // Lưu giá trị tiền của hóa đơn

        return newItemId;
    }
}
