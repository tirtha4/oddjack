pragma solidity ^0.4.17;

contract oddJack{

    uint nonce=0;

    string choice;

    event userStatus(address user, uint generatedNumber);
  

    function() public payable{

        }

    function getContractBalance()  public view returns(uint){
     return address(this).balance;
    }

    // User calls the function to start game
    function startGame() payable public{

        if(msg.value<0.01 ether){
           revert();
        }

        // Generates a random number hashing block number and a nonce value
        uint  randomNumber = uint(keccak256(blockhash(block.number),nonce))%100;
         nonce++;

        if(randomNumber%2==0){

            msg.sender.transfer(msg.value*2);

            // To Check user status of the contract
         emit userStatus(msg.sender,randomNumber);
        }
         else{
          emit  userStatus(msg.sender,randomNumber);
         }
    }

}
