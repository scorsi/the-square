const { user_skill } = require('./query');

test('Select data from user and skill for sylvain corsini', done => {
  function callback(data) {
    expect(data[0].name).toBe('Java');
    expect(data[1].name).toBe('Spring');

    done();
  }
  user_skill(callback);
})