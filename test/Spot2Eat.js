const should = require('chai')
    .use(require('chai-as-promised'))
    .should()
const expect = require('chai').expect;

// --- Handled contracts
const Spot2Eat = artifacts.require("./Spot2Eat.sol");
const SpotLibrary = artifacts.require("./spot/SpotLibrary.sol");
// --- Test variables
let protocol = null;
let spotAddress = null;
// agents
let company = null;
let user = null;


contract('Spot2Eat', accounts => {

    before( async () => {
        company = accounts[0];
        user = accounts[1];
        const library = await SpotLibrary.new({ from: company });
        protocol = await Spot2Eat.new(library.address, { from: company});
    })
   
    describe('Manage Spots', () => {
        it("should create a spot", async () => {
            const {logs} = await SpotLibrary.at(protocol.address).addSpot(
                'Serjao',
                -199359521,
                -439333486,
                0,
                {from: user }
            );
            const event = logs.find(e => e.event === 'Spots')
            const args = event.args;
            expect(args).to.include.all.keys([
                '_owner',
                '_description',
                '_spotAddress'
            ]);
            assert.equal(args._owner, user, "The current user must be the spot's owner");
            spotAddress = args._spotAddress;
        })
         
    })
    
})

