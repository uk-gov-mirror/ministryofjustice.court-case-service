ALTER TABLE COURT_CASE ADD COLUMN PRE_SENTENCE_ACTIVITY BOOLEAN DEFAULT FALSE;
ALTER TABLE COURT_CASE DROP COLUMN LAST_UPDATED;
ALTER TABLE COURT_CASE DROP COLUMN LAST_UPDATED_BY;