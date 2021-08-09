pragma solidity >=0.7.0 <0.9.0;


contract ether_pay {
    address  Dev = msg.sender; // I am the Developer :)
    address sender;     // he's going to send some ETH
    address payable reciver;   // She's going to catch some ETH
    uint dev_fee = 0.000002222 ether;  // The Fee is MY wage

    
    modifier onlysender( address account){   // only HE can do it
        require(tx.origin ==  account, "access Denied");
        _;
    }
 

    function deposite(address  _sender ,  address payable _reciver , uint amount ) payable onlysender(_sender) public returns(bool succes ){
        _sender = sender; _reciver = reciver;
       require( amount >= sender.balance , "insufficient Currency!"); // check if he has enough ETH

        reciver.transfer(amount); // there her ETH
        
        payable(Dev).transfer(dev_fee); // it's MY catch
        
        return true;

    }

}
