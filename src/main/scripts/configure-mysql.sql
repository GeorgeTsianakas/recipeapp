CREATE DATABASE mac_dev;
CREATE DATABASE mac_prod;

CREATE USER 'mac_dev_user'@'localhost' IDENTIFIED BY 'mac_dev_user';
CREATE USER 'mac_prod_user'@'localhost' IDENTIFIED BY 'mac_prod_user';
CREATE USER 'mac_dev_user'@'%' IDENTIFIED BY 'mac_dev_user';
CREATE USER 'mac_prod_user'@'%' IDENTIFIED BY 'mac_prod_user';

GRANT SELECT ON mac_dev.* to 'mac_dev_user'@'localhost';
GRANT INSERT ON mac_dev.* to 'mac_dev_user'@'localhost';
GRANT DELETE ON mac_dev.* to 'mac_dev_user'@'localhost';
GRANT UPDATE ON mac_dev.* to 'mac_dev_user'@'localhost';
GRANT SELECT ON mac_prod.* to 'mac_prod_user'@'localhost';
GRANT INSERT ON mac_prod.* to 'mac_prod_user'@'localhost';
GRANT DELETE ON mac_prod.* to 'mac_prod_user'@'localhost';
GRANT UPDATE ON mac_prod.* to 'mac_prod_user'@'localhost';
GRANT SELECT ON mac_dev.* to 'mac_dev_user'@'%';
GRANT INSERT ON mac_dev.* to 'mac_dev_user'@'%';
GRANT DELETE ON mac_dev.* to 'mac_dev_user'@'%';
GRANT UPDATE ON mac_dev.* to 'mac_dev_user'@'%';
GRANT SELECT ON mac_prod.* to 'mac_prod_user'@'%';
GRANT INSERT ON mac_prod.* to 'mac_prod_user'@'%';
GRANT DELETE ON mac_prod.* to 'mac_prod_user'@'%';
GRANT UPDATE ON mac_prod.* to 'mac_prod_user'@'%';