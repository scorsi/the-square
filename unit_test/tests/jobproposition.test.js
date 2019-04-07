const { jobproposition } = require('./query');

 test('Select data from jobproposition', done => {
   function callback(data) {
     expect(data[0].name).toBe('Web developer');
     expect(data[0].description).toBe('We are looking for a web developer to work on a secret project');
     expect(data[0].gross_salary).toBe(5000);

     done();
   }
   jobproposition(callback);
 })