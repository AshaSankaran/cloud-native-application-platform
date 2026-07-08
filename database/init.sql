CREATE TABLE app_status (
    service_name VARCHAR(100),
    status VARCHAR(50)
);

INSERT INTO app_status
VALUES ('PostgreSQL', 'healthy');