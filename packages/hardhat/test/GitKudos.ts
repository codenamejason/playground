import { expect } from "chai";
import { ethers } from "hardhat";
import { GitKudos } from "../typechain-types";

describe("GitKudos", function () {
  // We define a fixture to reuse the same setup in every test.

  let gitKudos: GitKudos;
  before(async () => {
    const [owner] = await ethers.getSigners();
    const yourContractFactory = await ethers.getContractFactory("GitKudos");
    gitKudos = (await yourContractFactory.deploy(owner.address)) as GitKudos;
    await gitKudos.deployed();
  });

  describe("Deployment", function () {
    it("Should have the right message on deploy", async function () {
      expect(await gitKudos.greeting()).to.equal("Building Unstoppable Apps!!!");
    });

    it("Should allow setting a new message", async function () {
      const newGreeting = "Learn Scaffold-ETH 2! :)";

      await gitKudos.setGreeting(newGreeting);
      expect(await gitKudos.greeting()).to.equal(newGreeting);
    });
  });
});
