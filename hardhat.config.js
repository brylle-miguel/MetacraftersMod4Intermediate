require("@nomicfoundation/hardhat-toolbox");
const FORK_FUJI = true
const FORK_MAINNET = false
let forkingData = undefined;

if (FORK_MAINNET) {
  forkingData = {
    url: 'https://api.avax.network/ext/bc/C/rpcc',
  }
}
if (FORK_FUJI) {
  forkingData = {
    url: 'https://api.avax-test.network/ext/bc/C/rpc',
  }
}


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.20",
  networks: {
    hardhat: {
      gasPrice: 225000000000,
      chainId: !forkingData ? 43112 : undefined, //Only specify a chainId if we are not forking
      forking: forkingData
    },
    fuji: {
      url: 'https://api.avax-test.network/ext/bc/C/rpc',
      gasPrice: 225000000000,
      chainId: 43113,
      accounts: [
         "a95273eb1aaaec926b73e154e96c755c915f3b13687115ca536efee7a7705386"
      ]
    },
    mainnet: {
      url: 'https://api.avax.network/ext/bc/C/rpc',
      gasPrice: 225000000000,
      chainId: 43114,
      accounts: [
         "a95273eb1aaaec926b73e154e96c755c915f3b13687115ca536efee7a7705386"
      ]
    }
  },  
  etherscan: {
    apiKey: "GXAPPDY4ZHNPQ17VGD8U98ISDD45RC2HWM",
  },
};


