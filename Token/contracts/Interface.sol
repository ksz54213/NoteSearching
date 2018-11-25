pragma solidity ^0.4.23;

contract Interface {
  string public constant name="KKToken";
  string public constant symbol ="KKT@";
  uint8 public constant decimals=18; // 小數點後幾位
  uint256 public constant totalSupply=100;
  uint256 public buyPrice = 1; // how much Ether is  a token

  mapping (address => uint256) public balances;
  mapping (address => mapping (address => uint256))public allowed;

  uint256 constant private MAX_UINT256 = 2**256 -1;
  uint constant public weiToEther = 10**18;



  function balanceOf(address tokenOwner)public view returns (uint256 balance) {
    return balances[tokenOwner];  // see Interface line:12
  }


  // the amount of tokens of tokenOwner that spender can use
  function allowance(address tokenOwner,address spender)public constant
    returns (uint remaining){ // see Interface line:15
      return allowed[tokenOwner][spender];
    }

// transfer own token to other
  function transfer( address _to, uint256 tokens) public returns (bool success){
    require(balances[msg.sender] >= tokens);  // see Interface line:19
    balances[msg.sender]-=tokens;
    balances[_to]+=tokens;
    Transfer(msg.sender,_to,tokens); //trig the event
    return true;
  }

// allow spender using the tokens of tokenowner
function approve(address spender,uint tokens) public returns (bool success){
    allowed[msg.sender][spender]+=tokens; // see Interface line:22
    Approval(msg.sender,spender,tokens);  // trig the event
    return true;
}

// trnasfer tokens of _form to  _to
function transferFrom(address _from , address _to ,uint tokens)public
  returns(bool success){ // see Interface line:25
    // the amount of tokens that sender can use from _from


    require(balances[_from]>=uint256(tokens) && allowance(_from,_to) >= uint256(tokens));

    balances[_to]+=tokens;
    balances[_from]-=tokens;
    if(allowance(_from,_to) < MAX_UINT256){
      allowed[_from][msg.sender]-=tokens;
    }
    Transfer(_from,_to,tokens);  //trig the event
    return true;
  }

// when trigging  "transfer function" , trigging this function
  event Transfer(address indexed from, address indexed to ,uint tokens);

// when trigging "approve function" , trigging this function
  event Approval(address indexed tokenOwner , address indexed spender,
    uint tokens);


}
