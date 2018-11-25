var KKToken = artifacts.require("./KKToken.sol");

module.exports = function(deployer) {
  deployer.deploy(KKToken);
};
