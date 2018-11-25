pragma solidity ^0.4.23;
import "Interface.sol";
contract KKToken is Interface{


// dictionary

//----------------
  address public owner;


  function KKToken()public {
    owner = msg.sender;
    balances[owner]=totalSupply;
    /* initial work is alomost done in Interface*/
  }

  modifier onlyOwner() {
    require(msg.sender==owner);
    _;
  }

  // Set the price of tokens Only owner can do this
  function setPrice(uint256 price)public onlyOwner {
    buyPrice = price;
  }

// buy tokens
  function buy()public payable{
    uint amount;
    amount=msg.value/(buyPrice*uint256(decimals));
    require(balances[owner]>=amount);
    balances[msg.sender]+=amount;
    balances[owner]-=amount;
    Transfer(owner,msg.sender,amount); // make transfer log;
  }

  // make tokens return to Ether
  function withdraw(uint amount)public onlyOwner{
    owner.transfer(amount* weiToEther);
  }

  //del the contract
  function delContract()public onlyOwner {
    selfdestruct(owner); // give owner the Ether in contract
  }

}
