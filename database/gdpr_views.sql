-- Pogledi za podporo GDPR (minimalizem za demonstracijo)

-- 1) Povzetek odprtih vlog brez prikaza EMŠO (data minimization)
CREATE VIEW IF NOT EXISTS v_application_overview AS
SELECT
  a.application_id,
  ap.first_name,
  ap.last_name,
  ap.email,
  ap.residence,
  ap.citizenship,
  a.community_name,
  a.status,
  a.submitted_at,
  a.closed_at
FROM application a
JOIN applicant ap ON ap.applicant_id = a.applicant_id;

-- 2) Pogled za audit sledi za določeno vlogo
CREATE VIEW IF NOT EXISTS v_audit_by_application AS
SELECT
  audit_id,
  actor_role,
  actor_id,
  action,
  target_type,
  target_id,
  result,
  created_at
FROM audit_log
WHERE target_type = 'APPLICATION';

