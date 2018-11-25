pragma solidity ^0.4.22;
import "ERC20Interface.sol";

contract MyToken is ERC20Interface {
  mapping (address => uint256) public balances;
  mapping (address => mapping (address => uint256) )public  allowed;
  string public name;
  string public symbol;
  address owner;
  uint256 public decimal=2;
  uint256 constant private MAX_uint256 = 2**256 - 1;
  uint256 constant private weiToEther = 10 ** 18;
  uint256 public Token_price; // 1 ether = ? tokens
// constructor
  function MyToken(
    uint256 _initialSupply,
    uint256 _buyPrice,
    string _tokenname,
    string _tokenSymbol
    ) public {
      totalSupply = _initialSupply * (10**decimal); //token總量
      balances[msg.sender] = totalSupply;
      name = _tokenname;
      symbol = _tokenSymbol;
      owner = msg.sender;
      Token_price = _buyPrice;
  }
// only owner
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
  // get balance
  function balanceof(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
  }
  //
  function transfer(address to, uint256 tokens) public returns (bool success){
    require(balances[msg.sender] >= tokens);
    balances[msg.sender]-=tokens;
    balances[to]+=tokens;
    Transfer(msg.sender,to,tokens);
    return true;
  }

  // msg.sender 用 _form 的信卡消費
  function transferFrom(address from, address to, uint256 tokens) public returns (bool success){
     uint256 allowance  = allowed[from][msg.sender];
     require(balances[from]>=tokens && allowance>=tokens);
     balances[to]+=tokens;
     balances[from]-=tokens;
     if(allowance< MAX_uint256){
       allowed[from][msg.sender]-=tokens;
     }
     Transfer(from, to, tokens);
     return true;
  }
// msg.sender 的tokens 和 spendere 共有
  function approve(address spender, uint256 tokens) public returns (bool success){
    allowed[msg.sender][spender] = tokens;
    Approval(msg.sender, spender, tokens);
    return true;
  }

  function allowance(address tokenOwner, address spender)
  public constant returns (uint256 remaining){
    return allowed[tokenOwner][spender];
  }
  // setting price of tokens
  function  setPrice(uint256 _price) public onlyOwner{
    Token_price = _price;
  }
  // buy tokens
  function buy() public payable{
    uint256 amount;
    // buy how many _tokens
    amount = (msg.value / weiToEther); // wei -> ether
    require(balances[owner]>=amount); //if tokens enough
    balances[msg.sender]+=amount;
    balances[owner]-=amount;
    Transfer(owner,msg.sender, amount);
  }
  // 把合約轉出Ether給部屬者
  function withDraw(uint256 amount)public onlyOwner {
    owner.transfer(amount*weiToEther);
  }
  // Delete contract
  function deleteContract()public onlyOwner {
    selfdestruct(owner); //剩餘的Ether都給owner
  }
}
