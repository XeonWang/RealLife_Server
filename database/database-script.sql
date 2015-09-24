
CREATE Uzer (
	id varchar(10),
	name varchar(20),
	password char(32); /* It will store a 32byte MD5 encoding password */
	friends varchar(1000), /* Set friends length as 1000 temperary, support max friends number is 90 */
);