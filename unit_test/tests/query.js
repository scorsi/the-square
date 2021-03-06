const { Pool } = require('pg')

const pool = new Pool({
  user: 'postgres',
  host: '172.21.0.2',
  database: 'square',
  password: 'secret',
  port: 5432,
})


function user(callback) {
  pool.query('SELECT * FROM "user"', (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
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

function user_hobby(callback) {
  pool.query('SELECT name FROM user_hobby, hobby, "user" where user_hobby.user_id = "user".user_id and user_hobby.hobby_id = hobby.hobby_id and "user".user_id = 1', (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

function skill(callback) {
  pool.query("SELECT * FROM skill", (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

function user_skill(callback) {
  pool.query('SELECT name FROM user_skill, skill, "user" WHERE user_skill.user_id = "user".user_id and skill.skill_id = user_skill.skill_id and "user".user_id = 1', (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

function user_office(callback) {
  pool.query('SELECT address FROM user_office, "user", office WHERE user_office.office_id = office.office_id and user_office.user_id = "user".user_id and "user".user_id = 1', (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

function formation(callback) {
  pool.query("SELECT * FROM formation", (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

function formation_activitydomain(callback) {
  pool.query('SELECT school_name, title, start_year, end_year, formation.description as fomration_description, activitydomain.description as activity_description, name FROM formation_activitydomain, formation, activitydomain WHERE formation_activitydomain.formation_id = formation.formation_id and formation_activitydomain.activity_id = activitydomain.activity_id', (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

function jobproposition(callback) {
  pool.query("SELECT * FROM jobproposition", (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

function jobproposition_activitydomain(callback) {
  pool.query("SELECT jobproposition.name as jobproposition_name, jobproposition.description as jobproposition_description, gross_salary, activitydomain.description as activitydomain_description, activitydomain.name as activitydomain_name FROM jobproposition_activitydomain, jobproposition, activitydomain WHERE jobproposition_activitydomain.jobproposition_id = jobproposition.jobproposition_id and jobproposition_activitydomain.activity_id = activitydomain.activity_id", (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

function jobproposition_skill(callback) {
  pool.query("SELECT jobproposition.name as jobproposition_name, description, gross_salary, skill.name as skill_name FROM jobproposition_skill, jobproposition, skill WHERE jobproposition_skill.jobproposition_id = jobproposition.jobproposition_id and jobproposition_skill.skill_id = skill.skill_id", (err, res) => {
    if (err) {
      console.log(err.stack)
    } else {
      callback(res.rows)
    }
  })
}

function user_activitydomain(callback) {
  pool.query('SELECT first_name, last_name, email, name FROM user_activitydomain, "user", activitydomain WHERE user_activitydomain.user_id = "user".user_id and user_activitydomain.activity_id = activitydomain.activity_id', (err, res) => {
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
  office_company: office_company,
  user_hobby: user_hobby,
  skill: skill,
  user_skill: user_skill,
  user_office: user_office,
  formation: formation,
  formation_activitydomain: formation_activitydomain,
  jobproposition: jobproposition,
  jobproposition_activitydomain: jobproposition_activitydomain,
  jobproposition_skill: jobproposition_skill,
  user_activitydomain: user_activitydomain
}