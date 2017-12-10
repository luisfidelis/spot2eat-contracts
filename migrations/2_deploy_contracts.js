const SpotLibrary = artifacts.require("./spot/SpotLibrary.sol");
const Spot2Eat = artifacts.require("./Spot2Eat.sol"); 

module.exports = function(deployer) {
  deployer.deploy(SpotLibrary).then(() => {
    // --- Ropsten api address
    const randomApi = "0x1637140C895e01d14be5a7A42Ec2c5BB22893713";
    // ---
    return deployer.deploy(Spot2Eat, SpotLibrary.address, randomApi );
  });

};
