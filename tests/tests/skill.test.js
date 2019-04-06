const { skill } = require('./query');

test('Select data from skill', done => {
   function callback(data) {
     expect(data[0].name).toBe('Java');
     expect(data[1].name).toBe('Spring');
     expect(data[2].name).toBe('Angular');
     expect(data[3].name).toBe('Python');
     done();
   }
   skill(callback);
 })