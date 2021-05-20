ALTER TABLE students RENAME TO studenci;
ALTER TABLE studenci CHANGE student_id id_studenta INT(7) NOT NULL;
ALTER TABLE studenci CHANGE family_name nazwisko VARCHAR(50) NOT NULL;
ALTER TABLE studenci CHANGE name imie VARCHAR(30) NOT NULL;
ALTER TABLE studenci CHANGE country kraj VARCHAR(100) NOT NULL DEFAULT "Polska";