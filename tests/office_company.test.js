const { office_company } = require('./query');

test('Select data from office and company', done => {
   function callback(data) {
     expect(data[0].address).toBe("87 rue du Molinel, Batiment - Adfinitas, Marcq-en-Baroeul, 59700, France");
     expect(data[0].description).toBe('A strategy marketing company');
     expect(data[0].name).toBe('Adfinitas');
     expect(data[0].siret).toBe('43232660100056');
     done();
   }
   office_company(callback);
 });