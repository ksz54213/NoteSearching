pragma solidity ^0.4.22;

contract Fundiction {

  struct Investor {
    address addr;
    uint amount;
  }

  address public owner;
  uint public numInvestors; //投資者數量
  uint public deadline;
  string public status; //活動狀態
  bool public ended; // 活動是否結束
  uint public goalAmount; // 目標
  uint public totalAmount; // 投資總額

  mapping (uint => Investor) public investor;

  modifier  onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  //construtor
  function Fundiction(uint _duration,uint _goalAmount) public{
    owner = msg.sender;
    deadline = now + _duration;
    goalAmount = _goalAmount;
    status="Funding";
    ended =false;
    numInvestors=0;
    totalAmount=0;
  }

  //投資
  function fund() payable public {
    require(!ended);
    Investor inv = investor[numInvestors++];
    inv.addr = msg.sender;
    inv.amount=msg.value;
    totalAmount += inv.amount;
  }

  //檢查 目標是否完成
  function CheckGoalReached()public onlyOwner {
    require(!ended);
    //截止時間還沒到就中斷
    require(now>=deadline);

    if(totalAmount >= goalAmount){
      status="Campign Successed";
      ended=true;
      //把合約的Ether發給Owner
      if(!owner.send(this.balance)){
        throw;
      }
    }else{
      uint i =0;
      status="Campaign Failed";
      ended=true;
      //把Ether 退給投資者們
      while(i<numInvestors){
        if(! investor[i].addr.send(investor[i].amount)){
          throw;
        }
        i++;
      }
    }
  }

  //銷毀合約
  function kill() public onlyOwner {
    selfdestruct(owner);
  }

}
