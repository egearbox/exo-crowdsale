// SPDX-Licence-Identifier: GPL-3.0
import @openzeppelin/contract/access/Owner.sol
pragma solidity 0.8.18;
contract Person {
    struct Person { // Structure de données et un com ici aussi
      string name;
      uint age;  
  }
  Person[] public persons;
  

address private Owner;
constructor(address: _Owner) internal {
    Owner = _Owner;
}
function getOwner() public view returns (address) {
    return Owner;
}
}
