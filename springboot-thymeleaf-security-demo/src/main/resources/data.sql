
create table if not exists persistent_logins ( 
  username varchar(100) not null, 
  series varchar(64) primary key, 
  token varchar(64) not null, 
  last_used timestamp not null
);

delete from  messages;
delete from  role_permission;
delete from  user_role;
delete from  roles;
delete from  users;
delete from  permissions;

INSERT INTO roles (id, name) VALUES 
(1, 'ROLE_ADMIN'),
(2, 'ROLE_ACTUATOR'),
(3, 'ROLE_USER')
;

INSERT INTO users (id, email, password, name) VALUES 
(1, 'admin@gmail.com', '$2a$10$hKDVYxLefVHV/vtuPhWD3OigtRyOykRLDdUAp80Z1crSoS1lFqaFS', 'Admin'),
(3, 'user@gmail.com', '$2a$10$ByIUiNaRfBKSV6urZoBBxe4UbJ/sS6u1ZaPORHF9AtNWAuVPVz1by', 'User');


insert into user_role(user_id, role_id) values
(1,1),
(1,2),
(1,3),
(3,2)
;

INSERT INTO permissions (id, code, url) VALUES 
(1, 'save_message', '/messages'),
(2, 'list_message', '/messages/list')
;

insert into role_permission(role_id, permission_id) values
(1, 1),(1, 2),
(3, 2);

insert into messages(id, content) values 
(1, 'hey guru, you are right here!!!'),
(2, 'hey michael, how are youe!!!')
;

SELECT u.id, u.name, u.email, r.name, p.code, p.url FROM test.users u 
left join test.user_role ur on u.id = ur.user_id
left join test.roles r on ur.role_id=r.id
left join test.role_permission rp on r.id=rp.role_id
left join test.permissions p on rp.permission_id=p.id
;


