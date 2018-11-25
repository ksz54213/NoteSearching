var hello = artifacts.require("hello");

module.exports = function(deployer) {
  deployer.deploy(hello); //Contract name not data name
};
