var Fundiction= artifacts.require("Fundiction");

module.exports = function(deployer) {
  deployer.deploy(Fundiction,1800,200000);
};
