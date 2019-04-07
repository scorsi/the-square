const { formation_activitydomain } = require('./query');

 test('Select data from formation and activitydomain', done => {
   function callback(data) {
     expect(data[0].school_name).toBe('Epitech');
     expect(data[0].title).toBe('Expert en Informatique et Nouvelles Technologies');
     expect(data[0].start_year).toBe(2015);
     expect(data[0].end_year).toBe(2020);
     expect(data[0].fomration_description).toBe("...");
     expect(data[0].activity_description).toBe("Web Development....");
     expect(data[0].name).toBe("Web Development");
     done();
   }
   formation_activitydomain(callback);
 });