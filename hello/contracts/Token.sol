pragma solidity ^0.4.22;


contract Token {
  // Amount of Token
  uint256 INITIAL_SUPPLY =1000;
  //
  mapping (address => uint256) balances;

  function Token() public {
    balances[msg.sender] = INITIAL_SUPPLY;
  }

  //transfer token for a specified address

  function transfer(address _to,uint256 _amount) public {
    require(balances[msg.sender] > _amount);
    balances[_to]+= _amount;
    balances[msg.sender]-= _amount;
  }

  //Get balance of the specified address
  function getBalance(address _owner) public returns (uint256) {
    return balances[_owner];
  }

}
