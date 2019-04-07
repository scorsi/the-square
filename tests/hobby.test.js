const { hobby } = require('./query');

 test('Select data from hobby', done => {
   function callback(data) {
     expect(data[0].name).toBe('computing');
     expect(data[1].name).toBe('football');
     expect(data[2].name).toBe('videogame');
     expect(data[3].name).toBe('movie');
     expect(data[4].name).toBe('footing');

     done();
   }
   hobby(callback);
 })