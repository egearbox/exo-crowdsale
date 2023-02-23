//SPDX-Licence-Identifier: MIT
Pragma Solidity 0.8.18;

contract Bank {
    mapping(address => uint) balance;
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }
    
    function withdraw(uint amount) public {
        require(balance[msg.sender] >= amount, "Insufficient funds");
        balance[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
    
    function getBalance() public view returns(uint) {
        return balance[msg.sender];
    }
    
    function transfer(address recipient, uint amount) public {
        require(balance[msg.sender] >= amount, "Insufficient funds");
        require(msg.sender != recipient, "You can't transfer to yourself");
        
        uint previousSenderBalance = balance[msg.sender];
        
        _transfer(msg.sender, recipient, amount);
        
        assert(balance[msg.sender] == previousSenderBalance - amount);
    }
    
    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }
}