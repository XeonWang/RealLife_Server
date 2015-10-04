USE Reallife;

INSERT INTO Uzer(id, name, password, friends) values(1, 'Test1', 'pwd', '2, 3');
INSERT INTO Uzer(id, name, password, friends) values(2, 'Test2', 'pwd', '3');
INSERT INTO Uzer(id, name, password, friends) values(3, 'Test3', 'pwd', null);

INSERT INTO Action_Type(id, name) values(1, 'Farm');

INSERT INTO Action(id, user_id, type_id, parameters) values(1, 1, 1, 'num=100, name=apple');
INSERT INTO Action(id, user_id, type_id, parameters) values(2, 2, 1, 'num=300, name=grope');
INSERT INTO Action(id, user_id, type_id, parameters) values(3, 3, 1, 'num=500, name=peach');