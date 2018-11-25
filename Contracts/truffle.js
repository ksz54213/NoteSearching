/*
 * NB: since truffle-hdwallet-provider 0.0.5 you must wrap HDWallet providers in a
 * function when declaring them. Failure to do so will cause commands to hang. ex:
 * ```
 * mainnet: {
 *     provider: function() {
 *       return new HDWalletProvider(mnemonic, 'https://mainnet.infura.io/<infura-key>')
 *     },
 *     network_id: '1',
 *     gas: 4500000,
 *     gasPrice: 10000000000,
 *   },
 */

 module.exports = {
   // See <http://truffleframework.com/docs/advanced/configuration>
   // to customize your Truffle configuration!
/*   rpc:{
       host:"127.0.0.1",
       port:8545,
       network_id:"*",
   },*/

   networks:{
     development:{
       host:"127.0.0.1",
       port:8545,
       network_id:"*",
       gas:200000000,
       gasPrice:10000000000,
       from : "a0906c16bcf86b57b8bda48c2343a0715e341acf"
     }
   }
 };
