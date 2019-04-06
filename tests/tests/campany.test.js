const { company } = require('./query');
var md5 = require('md5');

 test('Select data from company', done => {
   function callback(data) {
     expect(data[0].company_id).toBe(1);
     expect(data[0].description).toBe('A strategy marketing company');
     expect(data[0].name).toBe('Adfinitas');
     expect(data[0].siret).toBe('43232660100056');
     done();
   }
   company(callback);
 });