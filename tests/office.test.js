const { office } = require('./query');

test('Select data from office', done => {
   function callback(data) {
     expect(data[0].address).toBe('87 rue du Molinel, Batiment - Adfinitas, Marcq-en-Baroeul, 59700, France');
     done();
   }
   office(callback);
 });