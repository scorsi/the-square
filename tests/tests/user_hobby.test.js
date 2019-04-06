const { user_hobby } = require('./query');

test('Select data from user and hobby', done => {
   function callback(data) {
     expect(data[0].name).toBe("computing");
     expect(data[1].name).toBe("videogame");
     expect(data[2].name).toBe("movie");
     expect(data[3].name).toBe("footing");
     done();
   }
   user_hobby(callback);
 });