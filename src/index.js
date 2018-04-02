const Web3 = require('web3')

const createAccounts = async () => {
  const web3 = new Web3(`ws://${process.env.GETH}:8546`)

  const maxAccounts = 10

  const accounts = await web3.eth.getAccounts()

  for (let i = accounts.length; i < maxAccounts; i++) {
    const newAccount = await web3.eth.personal.newAccount('')
    console.log(`Created account: ${newAccount}`)
    await web3.eth.sendTransaction({
      from: accounts[0],
      to: newAccount,
      value: web3.utils.toWei('100000'),
    })
    console.log(`Funded account: ${newAccount}`)
    await web3.eth.personal.unlockAccount(newAccount, '', 0)
    console.log(`Unlocked account: ${newAccount}`)
  }

  console.log('accounts setup complete')
}

const init = async () => {
  try {
    await createAccounts()
    process.exit()
  } catch(e) {
    console.log('geth:', process.eng.GETH)
    console.error(e)
  }
}
/*
let interval 
interval = setInterval(async () => {
  try {
    await init()
  }
  catch (e) {}
}, 2000)
*/
init()

