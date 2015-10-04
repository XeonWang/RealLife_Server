USE Reallife;

CREATE TABLE Uzer (
	id int(10),
	name varchar(20),
	password char(32), /* It will store a 32byte MD5 encoding password */
	friends varchar(1000) /* Set friends length as 1000 temperary, support max friends number is 90 */
);

ALTER TABLE Uzer ADD CONSTRAINT PK_Uzer PRIMARY KEY Uzer(id);
ALTER TABLE Uzer ADD UNIQUE (name);


CREATE TABLE Action_Type (
	id int(4),
	name varchar(10)
);

ALTER TABLE Action_Type ADD CONSTRAINT PK_Action_Type PRIMARY KEY Action_Type(id);


CREATE TABLE Action (
	id int(10),
	user_id int(10),
	type_id int(4),
	parameters varchar(100)
);

ALTER TABLE Action ADD CONSTRAINT PK_Action PRIMARY KEY Action(id);
ALTER TABLE Action ADD CONSTRAINT FK_Action_User FOREIGN KEY Action(user_id) REFERENCES Uzer(id);
ALTER TABLE Action ADD CONSTRAINT FK_Action_Action_Type FOREIGN KEY Action(type_id) REFERENCES Action_Type(id);