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
    .where({ scheme_id: id })
    .join("schemes", "steps.scheme_id", "schemes.id")
    .select(
      "steps.id",
      " schemes.scheme_name",
      " steps.step_number",
      " steps.instructions"
    );
}

function add(scheme) {
  return db("schemes")
    .insert(scheme, ["id"])
    .then(ids => {
      const id = ids[0].id || ids[0];
      return findById(id);
    });
}

function update(changes, id) {
  return db("schemes")
    .update(changes)
    .where({ id })
    .then(count => {
      if (count == 1) return findById(id);
      throw new Error("Error updating the record");
    });
}

async function remove(id) {
  const entry = await findById(id);
  return db("schemes")
    .where({ id })
    .delete()
    .then(count => {
      if (count == 1) return entry;
      return null;
    });
}
module.exports = { find, findById, findSteps, add, update, remove };
