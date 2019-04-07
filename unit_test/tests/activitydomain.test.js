const { activitydomain } = require('./query');

test('Select data from activitydomain', done => {
   function callback(data) {
     expect(data[0].description).toBe('Web Development....');
     expect(data[0].name).toBe('Web Development');

     expect(data[1].description).toBe('Marketing blablabla');
     expect(data[1].name).toBe('Marketing');

     done();
   }
   activitydomain(callback);
 });