show databases;

use people;


show tables;

desc member;

ALTER TABLE member ADD email varchar(30);

ALTER TABLE member DROP COLUMN registration;

select * 
from member;