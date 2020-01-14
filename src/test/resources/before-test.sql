DELETE FROM courtcaseservicetest.court_case WHERE true;
DELETE FROM courtcaseservicetest.court WHERE true;

INSERT INTO courtcaseservicetest.court (id, name, court_code) VALUES (4444443, 'Sheffield Magistrates Court Test', 'SHF');
INSERT INTO courtcaseservicetest.court_case (case_id, case_no, court_id, court_room, session_start_time, data, probation_record) VALUES (5555555, 1600028913, 4444443, 1, '2019-12-14 09:00', '{"inf": "POL01", "h_id": 1246000, "def_name": "JTEST", "def_addr": {"line3": "a3", "line2": "a2", "line1": "a1"}, "type": "C", "caseno": 1111111111, "def_dob": "01/01/1998", "valid": "Y", "cseq": 1, "listno": "1st", "offences": {"offence": [{"as": "Contrary to section 1(1) and 7 of the Theft Act 1968.", "code": "TH68010", "oseq": 1, "co_id": 1142222, "maxpen": "EW: 6M &/or Ultd Fine", "sum": "On 01/01/2015 at own, stole article, to the value of £987.00, belonging to person.", "title": "Theft from a shop"}, {"as": "Contrary to section 1(1) and 7 of the Theft Act 1968.", "code": "TH68010", "oseq": 2, "co_id": 1142222, "maxpen": "EW: 6M &/or Ultd Fine", "sum": "On 01/01/2015 at own, stole article, to the value of £987.00, belonging to person.", "title": "Theft from a shop"}]}, "def_age": 18, "c_id": 3333333, "def_type": "P", "def_sex": "M"}', 'Not known');


