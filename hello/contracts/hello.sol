pragma solidity ^0.4.22;
contract Hello{
    string public msg1;
    string private msg2;
    
    address public owner;
    uint8 public counter;
    //constructor
    function Hello(string _msg1){
        msg1 = _msg1 ;
        
        // msg.sender 此合約的地址 msg.value 呼叫函式所需Ether (Wei)
        owner= msg.sender;
        
        counter=0;
    }
    
    //msg2 setter
    function setMsg2(string _msg2) public{
        if(owner != msg.sender){
            throw;
        }else{
            msg2=_msg2;
        }
    }
    //msg2 getter
    function getMsg2() public returns(string){
        return msg2;
    }
    
    function setCounter() public {
        for(uint8 i=0;i<counter;i++){
            i++;
        }
    }
    // modifier 可以再函是被呼叫前執行檢查機制 一定要以 _; 結尾
    modifier check{
        require(msg.sender == owner);
        _;
    }
    
    function someFunc() check{
        //執行 someFunc前會先跑check
    }
    // payable 需要接收ether的函數都要這個屬性
    //會將函數當作Transaction進行呼叫
    function someFunc1() payable{
        //    
    } 
    // selfdestruct/suicide 用來銷毀合約
    // 剩下的ether會傳送到指定地點
    /*
        event :某個事件發生時 以Log形式監視並記錄
        ex.
            event MessageLog(string msg);
            MessageLog("Hello");
        修飾詞:
            public 
            private
            external 只能從外部存取
            internal 可從自己或子合約存取
    */
}