const { user } = require('./query');

test('Select data from user', done => {
   function callback(data) {
    
     done();
   }
   user(callback);
 });