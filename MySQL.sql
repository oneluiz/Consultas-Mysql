-- ------------------------------------------------
-- Permisos acceso remoto
-- -----------------------------------------------

GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
