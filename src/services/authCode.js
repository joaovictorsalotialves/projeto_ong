import Chance from "chance";

const chance = new Chance();

export const authCode = () => {
  return chance.integer({ min: 100000, max: 999999 });
}