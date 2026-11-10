// CREATE
db.students.insertOne({
  matric_no: "TEST001",
  full_name: "Temporary Test Student",
  email: "test@aeu.edu",
  department: "Computer Science",
  academic_records: []
});

// READ
db.students.find({
  department: "Computer Science"
});

// UPDATE
db.students.updateOne(
  { matric_no: "AEU002" },
  { $set: { email: "mary.james.updated@aeu.edu" } }
);

// DELETE
db.students.deleteOne({
  matric_no: "TEST001"
});