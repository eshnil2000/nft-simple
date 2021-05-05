//modified this repo so dont require OpenZeppelin from https://github.com/eshnil2000/nft-mix/blob/main/contracts/SimpleCollectible.sol
pragma solidity 0.6.6;
contract SimpleCollectible  {
    // Mapping owner address to token count
    mapping (address => uint256) public _balances;
    // Mapping from token ID to owner address
    mapping (uint256 => address) public _owners;
    // Token name
    string public _name;

    // Token symbol
    string public _symbol;
    
  // Optional mapping for token URIs
    mapping (uint256 => string) public _tokenURIs;
  uint256 public tokenCounter;
  constructor (string memory name_, string memory symbol_) public {
        _name = name_;
        _symbol = symbol_;
    tokenCounter = 0;
  }
  function createCollectible(string memory tokenURI) public returns (uint256) {
    uint256 newItemId = tokenCounter;
    _safeMint(msg.sender, newItemId);
    _setTokenURI(newItemId, tokenURI);
    tokenCounter = tokenCounter + 1;
    return newItemId;
  }
  function _safeMint(address to, uint256 tokenId) internal virtual {
        //_safeMintx(to, tokenId, "");
         _mint(to, tokenId);
    }
    

    function _mint(address to, uint256 tokenId) internal virtual {
        //require(to != address(0), "ERC721: mint to the zero address");
        //require(!_exists(tokenId), "ERC721: token already minted");

        //_beforeTokenTransfer(address(0), to, tokenId);

        _balances[to] += 1;
        _owners[tokenId] = to;

        //emit Transfer(address(0), to, tokenId);
    }

  function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        //require(_exists(tokenId), "ERC721URIStorage: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }
}
