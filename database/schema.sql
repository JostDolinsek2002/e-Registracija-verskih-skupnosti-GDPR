-- Simulacijska shema baze za prototip (ne produkcijska implementacija)
-- Namen: podpora GDPR zahtevam (sledljivost, privolitve, hramba) in BAI06 dokumentiranju sprememb.

CREATE TABLE IF NOT EXISTS applicant (
  applicant_id      INTEGER PRIMARY KEY,
  first_name        TEXT NOT NULL,
  last_name         TEXT NOT NULL,
  email             TEXT,
  emso              TEXT,              -- osebni podatek (posebna skrb)
  residence         TEXT,
  citizenship       TEXT,
  created_at        TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS application (
  application_id    INTEGER PRIMARY KEY,
  applicant_id      INTEGER NOT NULL,
  community_name    TEXT NOT NULL,
  status            TEXT NOT NULL,      -- DRAFT/SUBMITTED/IN_REVIEW/APPROVED/REJECTED
  submitted_at      TEXT,
  closed_at         TEXT,
  FOREIGN KEY(applicant_id) REFERENCES applicant(applicant_id)
);

-- Evidenca privolitev (če je v postopku potrebna)
CREATE TABLE IF NOT EXISTS consent (
  consent_id        INTEGER PRIMARY KEY,
  applicant_id      INTEGER NOT NULL,
  consent_type      TEXT NOT NULL,      -- npr. "privacy_notice_ack", "cookies"
  consent_given     INTEGER NOT NULL,   -- 0/1
  consent_text_ver  TEXT NOT NULL,      -- verzija besedila
  given_at          TEXT NOT NULL,
  FOREIGN KEY(applicant_id) REFERENCES applicant(applicant_id)
);

-- Metapodatki prilog (dejanske datoteke niso del prototipa)
CREATE TABLE IF NOT EXISTS attachment_meta (
  attachment_id     INTEGER PRIMARY KEY,
  application_id    INTEGER NOT NULL,
  file_name         TEXT NOT NULL,
  file_type         TEXT,
  uploaded_at       TEXT NOT NULL,
  FOREIGN KEY(application_id) REFERENCES application(application_id)
);

-- Audit trail (sledljivost dostopov in akcij uradnih oseb)
CREATE TABLE IF NOT EXISTS audit_log (
  audit_id          INTEGER PRIMARY KEY,
  actor_role        TEXT NOT NULL,     -- USER/OFFICIAL/SYSTEM
  actor_id          TEXT,              -- npr. uporabnik ali uradna oseba (ID)
  action            TEXT NOT NULL,     -- VIEW_APP, APPROVE, REJECT, EXPORT_LOGS...
  target_type       TEXT NOT NULL,     -- APPLICATION/APPLICANT/ATTACHMENT
  target_id         TEXT NOT NULL,
  result            TEXT NOT NULL,     -- SUCCESS/FAIL
  details           TEXT,
  created_at        TEXT NOT NULL
);

