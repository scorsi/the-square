const { office } = require('./query');

test('Select data from office', done => {
   function callback(data) {
     expect(data[0].office_id).toBe(1);
     expect(data[0].address).toBe('87 rue du Molinel, Batiment - Adfinitas, Marcq-en-Baroeul, 59700, France');
     expect(data[0].company_id).toBe(1);
     done();
   }
   office(callback);
 });