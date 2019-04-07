const { user_activitydomain } = require('./query');

test('Select data from user and activitydomain', done => {
   function callback(data) {
     expect(data[0].first_name).toBe("Sylvain");
     expect(data[0].last_name).toBe("Corsini");
     expect(data[0].email).toBe("scorsi@pm.me");
     expect(data[0].name).toBe("Web Development");
     done();
   }
   user_activitydomain(callback);
 });