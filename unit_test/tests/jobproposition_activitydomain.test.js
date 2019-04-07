const { jobproposition_activitydomain } = require('./query');

 test('Select data from jobproposition and ctivitydomain', done => {
   function callback(data) {
     expect(data[0].jobproposition_name).toBe('Web developer');
     expect(data[0].jobproposition_description).toBe('We are looking for a web developer to work on a secret project');
     expect(data[0].gross_salary).toBe(5000);
     expect(data[0].activitydomain_description).toBe("Web Development....");
     expect(data[0].activitydomain_name).toBe("Web Development");

     done();
   }
   jobproposition_activitydomain(callback);
 })