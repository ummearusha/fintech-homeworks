import subprocess
import json
import web3
from bit import Key, PrivateKey, PrivateKeyTestnet
from web3 import Account,Web3
from constants import *


def derive_wallets(coin):
  command = './derive -g --mnemonic="slice insect festival subway tragic smile mad mom ignore pride announce coral" --cols=path,address,privkey,pubkey --format=json --numdrive=1 --coin=' + coin
  #coins[COINTYPE][INDEX]['privkey']
  p = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
  output, err = p.communicate()
  p_status = p.wait()
  keys = json.loads(output)
  return keys

coins = {
    ETH : derive_wallets(ETH),
    BTC : derive_wallets(BTC),
    BTCTEST : derive_wallets(BTCTEST)
}

print(json.dumps(coins[BTCTEST], indent=2))

def priv_key_to_account(coin,priv_key):
    if (coin == ETH):
        return Account.privateKeyToAccount(priv_key)
    if (coin == BTCTEST):
        return PrivateKeyTestnet(priv_key)
    return "Invalid Coin"

def create_tx(coin, account,to, amount):
    #if (coin == ETH):
    #    return Account.privateKeyToAccount(to, from, value, gas, gasPrice, nonce, chainID)
    if (coin == ETH):
            return dict(
               to=to,
               value=amount,
               gas=2000000,
               gasPrice=123456,
               nonce=0,
               chainId=111 
           )
    if (coin == BTCTEST):
        return PrivateKeyTestnet.prepare_transaction(account.address, [(to, amount, BTCTEST)])
    return "Invalid Coin"

def send_tx(coin, account, to, amount):
    raw_tx = create_tx(coin,account,to,amount)
    if coin == ETH:
        tx = Account.signTransaction(raw_tx, '0x9953305bdca593d1008b3508f080a55f54d610e315676736da271823c19b3147')
        Web3().eth.sendRawTransaction(tx.rawTransaction)
                
print("##### Attempting BTC")
#send_tx(BTCTEST, priv_key_to_account(BTCTEST, coins[BTCTEST][0]['privkey']), '12fnz3Uua4heSFzXdTFJRHhE9oFnS4pQbh' , 1)
print("##### Attempting ETH")
send_tx(ETH, priv_key_to_account(ETH, coins[ETH][0]['privkey']), '0xC91D9355b4C86a987A33e700C99f171924e5e5E0' , 1)