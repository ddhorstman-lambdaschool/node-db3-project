const db = require("../data/dbConfig");

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    .then(r => (r.length === 0 ? null : r[0]));
}

function findSteps(id) {
  return db("steps")
    .where({ "scheme_id": id })
    .join("schemes", "steps.scheme_id", "schemes.id")
    .select("steps.id", " schemes.scheme_name", " steps.step_number", " steps.instructions");
}
module.exports = { find, findById, findSteps };
