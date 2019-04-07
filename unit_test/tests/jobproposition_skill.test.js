const { jobproposition_skill } = require('./query');

 test('Select data from jobproposition and skill', done => {
   function callback(data) {
     expect(data[0].jobproposition_name).toBe('Web developer');
     expect(data[0].description).toBe('We are looking for a web developer to work on a secret project');
     expect(data[0].gross_salary).toBe(5000);
     expect(data[0].skill_name).toBe("Javascript");

     done();
   }
   jobproposition_skill(callback);
 })