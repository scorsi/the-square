const { company_activitydomain } = require('./query');

test('Select data from company and activitydomain', done => {
  function callback(data) {
    expect(data[0].company_description).toBe("A strategy marketing company");
    expect(data[0].company_name).toBe("Adfinitas");
    expect(data[0].activitydomain_description).toBe('Web Development....');
    expect(data[0].activitydomain_name).toBe('Web Development');

    expect(data[1].company_description).toBe("A strategy marketing company");
    expect(data[1].company_name).toBe("Adfinitas");
    expect(data[1].activitydomain_description).toBe('Marketing blablabla');
    expect(data[1].activitydomain_name).toBe('Marketing');

    done();
  }
  company_activitydomain(callback);
});