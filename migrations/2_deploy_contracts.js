const SpotLibrary = artifacts.require("./spot/SpotLibrary.sol");
const Spot2Eat = artifacts.require("./Spot2Eat.sol"); 

module.exports = function(deployer) {
  deployer.deploy(SpotLibrary).then(() => {
    return deployer.deploy(Spot2Eat, SpotLibrary.address);
  });

};
