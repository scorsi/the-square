const { user_office } = require('./query');

test('Select office for user corisni', done => {
   function callback(data) {
     expect(data[0].address).toBe("87 rue du Molinel, Batiment - Adfinitas, Marcq-en-Baroeul, 59700, France");
     done();
   }
   user_office(callback);
 });