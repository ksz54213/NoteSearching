pragma solidity ^0.4.13;

contract ERC20Basic {
    uint256 public totalSupply;
    function balanceOf(address who) public view returns(uint256);
    function transfer(address to ,int256 value) public returns (bool);
    event Transfer(address indexed form,address indexed to,uint256 value);    
}

contract BasicToken is ERC20Basic {
    using SafeMath for uint256;
    mapping (address=>uint256) balances;
     /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  //轉帳
  function transfer(address _to,uint256 _value)public returns(bool){
      require(_to != address(0));
      require(_vlaue <= balances[msg.sender]);
      
      balances[msg.sender] =balance[msg.sender].sub(_vlaue);
      balance[_to]= balance[_to].add(_value);
      Transfer(msg.sender,_to,_value);
      return true;
  }
  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256 balance){
      return balance[_owner]; 
  }
}

contract ERC20 is ERC20Basic {
    function allowance(address owner,address spender) public view returns (uint256);
    function transferFrom(address from,address to,uint256 value) public returns (bool);
    function approve(address sender,uint256 value) public returns(bool);
    event Approval(address indexed owner,address indexed sender,uint256 value);
}

contract Ownable {
    address public owner;
    event OwnershipTransferred(address indexed previousOwner,address indexed newOwner);
    /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */modifier onloyOwner(){
       require(msg.sender==owner);
       _;
   }
   
}


