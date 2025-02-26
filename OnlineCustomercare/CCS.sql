CREATE DATABASE customercaresystem;
USE customercaresystem;


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    telephone VARCHAR(20),
    role ENUM('customer', 'admin', 'agent', 'technical_officer', 'billing_department') DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO users (firstname, lastname, email, username, password, telephone, role) VALUES
('saru', 'saru', 'saru@gmail.com', 'saru', 'saru@2002', '1122334455', 'technical_officer');

INSERT INTO users (firstname, lastname, email, username, password, telephone, role) VALUES
('Keerthigan', 'Dev', 'keerthigan@gmail.com', 'keerthigan', 'Keerthi@2002', '1234567890', 'admin'),
('Kenushan', 'kenu', 'kenushan@gmail.com', 'kenushan', 'Kenu@2002', '0987654321', 'customer'),
('Viviyan', 'vivi', 'viviyan@gmail.com', 'viviyan', 'Vivi@2001', '1122334455', 'technical_officer'),
('Naganarthanan', 'naga', 'naganarthanan@gmail.com', 'naganarthanan', 'Naga@2002', '2233445566', 'admin'),
('Rosa', 'rosa', 'rosa@gmail.com', 'rosa', 'Rosa@2001', '3344556677', 'billing_department'),
('Jeya', 'jeya', 'jeya@gmail.com', 'jeya', 'Jeya@2002', '4455667788', 'agent');

INSERT INTO users (firstname, lastname, email, username, password, telephone, role) VALUES
('suban', 'suban', 'suban@gmail.com', 'suban', 'suban@2002', '1122334455', 'customer');

INSERT INTO users (firstname, lastname, email, username, password, telephone, role) VALUES
('paven', 'paven', 'paven@gmail.com', 'paven', 'paven@2002', '1122334455', 'billing_department');

CREATE TABLE complaints (
    complaint_id INT AUTO_INCREMENT PRIMARY KEY,      
    customer_id INT,                                  
    title VARCHAR(255) NOT NULL,                     
    issue_type ENUM('technical', 'billing', 'other') NOT NULL, 
    description TEXT NOT NULL,                        
    status ENUM('pending', 'in-progress', 'resolved') DEFAULT 'pending',  
    date_raised TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    FOREIGN KEY (customer_id) REFERENCES users(id) 
);
select * from users
delete 
ALTER TABLE complaints
ADD COLUMN agent_id INT,
ADD FOREIGN KEY (agent_id) REFERENCES users(id); -- Assuming agents are in the 'users' table

ALTER TABLE complaints
ADD COLUMN assigned_department VARCHAR(50);
select * from complaints
CREATE TABLE allocation_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    complaint_id INT,
    agent_id INT,
    allocated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (complaint_id) REFERENCES complaints(complaint_id),
    FOREIGN KEY (agent_id) REFERENCES users(id) -- Assuming agents are in the 'users' table
);


ALTER TABLE allocation_history
ADD COLUMN response_message TEXT;

ALTER TABLE complaints
ADD COLUMN responser_id int ;

