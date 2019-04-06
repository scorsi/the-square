const { hobby } = require('./query');

 test('Select data from hobby', done => {
   function callback(data) {
     expect(data[0].hobby_id).toBe(1);
     expect(data[0].name).toBe('computing');

     expect(data[1].hobby_id).toBe(2);
     expect(data[1].name).toBe('football');

     expect(data[2].hobby_id).toBe(3);
     expect(data[2].name).toBe('videogame');

     expect(data[3].hobby_id).toBe(4);
     expect(data[3].name).toBe('movie');

     expect(data[4].hobby_id).toBe(5);
     expect(data[4].name).toBe('footing');

     done();
   }
   hobby(callback);
 })