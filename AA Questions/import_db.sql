PRAGMA foreign_keys = ON;
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  

  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
  
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
xz
  user_id INTEGER NOT NULL,
  

  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)

);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,

  subject_question_id INTEGER NOT NULL,
 
  
  reply_id INTEGER NOT NULL,

  
  body TEXT NOT NULL,

  user_id INTEGER NOT NULL,
  
  
  FOREIGN KEY (subject_question_id) REFERENCES questions(id),
  FOREIGN KEY (reply_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)

);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,

  user_id INTEGER NOT NULL,

  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),

  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
  users (fname, lname)
VALUES
  ('Lori', 'Tamosaitis'),
  ('Kamran', 'Shahraray');

INSERT INTO 
  questions (title, body, user_id)
VALUES
  ('question1', 'sql????', (SELECT id FROM users WHERE fname = 'Kamran')),
  ('question2', 'what is it???', (SELECT id FROM users WHERE fname = 'Lori'));