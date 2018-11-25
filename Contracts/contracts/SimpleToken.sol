pragma solidity ^0.4.22;

contract SimpleToken {

  string public name="ITEToken";
  uint256 public decimal =2;
  string public symbol="ITET";
  uint256 public SUPPLY =1000;
  mapping (address => uint256) balance;
  function SimpleToken() public {
    balance[msg.sender]=SUPPLY;
  }

  function transfer(address _to ,uint256 _amount) public{
      require(balance[msg.sender] > _amount);
      balance[msg.sender] -= _amount;
      balance[_to]+=_amount;
  }

  function Balanceof(address _owner) public constant returns (uint256) {
    return (balance[_owner]);
  }
}
