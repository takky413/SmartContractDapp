var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = 'your metamask mnemonic';
var accessToken = 'your infura accessToken';
const gas = 4000000;
const gasPrice = 1000000000 * 1; //1000000000 * 60
module.exports = {
  networks: {
    goerli: { //rinkeby 変更
      provider: function () {
        return new HDWalletProvider(
          mnemonic,
          accessToken
        );
        },
        network_id: 5,
        gas: gas,
        gasPrice: gasPrice,
        skipDryRun: true
      }
    },
    compilers: {
      solc: {
        version: "0.8.20",
      }
    }
};
