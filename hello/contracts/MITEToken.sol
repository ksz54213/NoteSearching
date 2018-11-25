pragma solidity ^0.4.22;
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract MITEToken is StandardToken{
  string public  name ="MCUITEToken";
  string public symbol="MIT";
  uint8 public decimals=2;
  uint256 public INITIAL_SUPPLY=6666;
  uint256 public _totalSupply=totalSupply();

  function MITEToken() public {
    _totalSupply = INITIAL_SUPPLY;
    balances[msg.sender]= INITIAL_SUPPLY;
  }
}
