const { Pool } = require('pg')

const pool = new Pool({
  user: 'postgres',
  host: '172.21.0.2',
  database: 'square',
  password: 'secret',
  port: 5432,
})


function user(callback) {
  pool.query("SELECT * FROM user", (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      console.log(res.rows)
      callback(res.rows)
    }
  })
}

function company(callback) {
  pool.query("SELECT * FROM company", (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

function activitydomain(callback) {
  pool.query("SELECT * FROM activitydomain", (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

function company_activitydomain(callback) {
  pool.query("SELECT company.description as company_description, company.name as company_name, activitydomain.description as activitydomain_description, activitydomain.name as activitydomain_name FROM company_activitydomain, company, activitydomain WHERE company_activitydomain.company_id = company.company_id and activitydomain.activity_id = company_activitydomain.activity_id", (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

function hobby(callback) {
  pool.query("SELECT * FROM hobby", (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

function office(callback) {
  pool.query("SELECT * FROM office", (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

function office_company(callback) {
  pool.query("SELECT address, description, name, siret FROM office, company WHERE company.company_id = office.company_id", (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

module.exports = {
  user: user,
  company: company,
  activitydomain: activitydomain,
  company_activitydomain: company_activitydomain,
  hobby: hobby,
  office: office,
  office_company: office_company
}