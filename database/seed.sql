-- Primer testnih podatkov (simulacija)

INSERT INTO applicant(applicant_id, first_name, last_name, email, emso, residence, citizenship, created_at)
VALUES
(1, 'Ana', 'Novak', 'ana.novak@example.com', '0101000500000', 'Ljubljana', 'SI', '2026-01-11T10:00:00Z');

INSERT INTO application(application_id, applicant_id, community_name, status, submitted_at, closed_at)
VALUES
(100, 1, 'Verska skupnost Primer', 'SUBMITTED', '2026-01-11T10:05:00Z', NULL);

INSERT INTO consent(consent_id, applicant_id, consent_type, consent_given, consent_text_ver, given_at)
VALUES
(200, 1, 'privacy_notice_ack', 1, 'v1.0', '2026-01-11T10:04:30Z');

INSERT INTO audit_log(audit_id, actor_role, actor_id, action, target_type, target_id, result, details, created_at)
VALUES
(300, 'SYSTEM', 'eREG', 'AUTO_CHECKS', 'APPLICATION', '100', 'SUCCESS', 'Age/residence/citizenship checks OK', '2026-01-11T10:06:00Z');

