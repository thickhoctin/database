//Import assert
const assert = require('assert');
//Import Rooster module
const Rooster = require('../index');

describe('Rooster', () => {
  describe('.announceDawn ', () => {
    it('returns a rooster call', () => {
      // Define expected output
      const expected = 'cock-a-doodle-doo!';
      
      // Call Rooster.announceDawn and store result in variable
      const actual = Rooster.announceDawn();
      // Use an assert method to compare actual and expected result
      assert.strictEqual(expected, actual);
    })
    describe('.timeAtDawn  ', () => {
      it('returns its argument as a string', () => {
        //setup
        const inputNumber = 12;
        const expected = '12';
        //exercise
        const actual = Rooster.timeAtDawn(inputNumber);
        //verify
        assert.equal(expected, actual);
        //(optional) teardown
      });
      it('throw a range error if number passed < 0', () => {
        //setup
        const inputNumber = -1;
        const expected = RangeError;
        //verify
        assert.throws(() =>{
          Rooster.timeAtDawn(inputNumber);//exercise
        },expected);
        //(optional) teardown
      });
      it('throw a range error if number greater than 23', () => {
        //setup
        const inputNumber = 24;
        const expected = RangeError;
        //verify
        assert.throws(() =>{
          Rooster.timeAtDawn(inputNumber);//exercise
        },expected);
        //(optional) teardown
      })
    });
  });
});
