const sayHello = require('./helloJest');

 test('the data is peanut butter', done => {
   function callback(data) {
     expect(data.hobby_id).toBe(1);
     done();
   }
   sayHello(callback);
 });
