-- Index the foreign key used to join enrollment to course_offering
CREATE INDEX idx_enrollment_offering_id
ON enrollment (offering_id);

-- Index the calculated total score used in the WHERE condition
CREATE INDEX idx_enrollment_total_score
ON enrollment ((ca_score + exam_score));

-- Update table statistics for the query planner
ANALYZE enrollment;