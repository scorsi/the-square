const { user } = require('./query');
var md5 = require('md5');


test('Select data from user', done => {
   function callback(data) {

    expect(data[0].first_name).toBe('Sylvain');
    expect(data[0].last_name).toBe('Corsini');
    expect(String(data[0].birth_date)).toBe('Sat Sep 14 1996 00:00:00 GMT+0200 (CEST)');
    expect(data[0].zip_code).toBe(59100);
    expect(data[0].password).toBe(md5('secret'));
    expect(data[0].email).toBe('scorsi@pm.me');

     done();
   }
   user(callback);
 });