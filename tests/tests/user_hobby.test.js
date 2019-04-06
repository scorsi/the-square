const { user_hobby } = require('./query');
var md5 = require('md5');

test('Select data from user and hobby', done => {
   function callback(data) {
     expect(data[0].name).toBe("footing");
     expect(data[0].first_name).toBe("Sylvain");
     expect(data[0].last_name).toBe("Corsini");
     expect(String(data[0].birth_date)).toBe("Sat Sep 14 1996 00:00:00 GMT+0200 (Central European Summer Time)");
     expect(data[0].zip_code).toBe(59100);
     expect(data[0].password).toBe(md5("secret"));
     expect(data[0].email).toBe("scorsi@pm.me");
     done();
   }
   user_hobby(callback);
 });