var MyToken= artifacts.require("MyToken");

module.exports = function(deployer) {
  deployer.deploy(MyToken,100,0.00000001,"ITEToken","ITET@");
};
