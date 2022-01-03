const main = async () => {
    const [owner, randomPerson] = await hre.ethers.getSigners();
    //we get the address of owner of contract and another random person
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    //compiles our contract
    //generates files necessary to work with our contract in the artifacts directory
    const waveContract = await waveContractFactory.deploy();
    //hardhat creates a new local Ethereum network, but just for this contract
    //this network is destroyed after script completes
    //it's like refreshing server to begin with a clean slate everytime
    //helps with debugging
    await waveContract.deployed();
    //waits till our contract is deployed to our local blockchain
    //constructor() runs when we deploy
    
    console.log("Contract deployed to:", waveContract.address);
    //returns address of deployed contract
    //helps us find contract on blockchain
    //real blockchain has milions of contracts
    console.log("Contract deployed by:", owner.address);
    //we see the address of the owner

    let waveCount;
    waveCount = await waveContract.getTotalWaves();
    //we let waveCount get the total waves

    let waveTxn = await waveContract.wave();
    await waveTxn.wait();
    //we let an address wave (use the wave function in WavePortal.sol)
    //in this case we are waving at ourselves

    waveCount = await waveContract.getTotalWaves();
    //we get the updated waveCount

    waveTxn = await waveContract.connect(randomPerson).wave();
    //we connect random person to our wave contract and let them wave
    await waveTxn.wait();

    waveCount = await waveContract.getTotalWaves();
  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();