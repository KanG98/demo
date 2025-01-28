-- Create users table
CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(50),
  phone_number VARCHAR(25),
  display_name VARCHAR(25),
  registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  last_updated_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  last_login_date DATETIME,
  PRIMARY KEY (id)
);

-- Create credentials table
CREATE TABLE credentials (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    credential_id VARCHAR(255) NOT NULL UNIQUE,
    public_key TEXT,
    attestation_type ENUM('direct', 'indirect', 'none') NOT NULL,
    aaguid CHAR(36) DEFAULT '00000000-0000-0000-0000-000000000000',
    signature_count INT,
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_used_date DATETIME,
    last_updated_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    type VARCHAR(25),
    transports SET('usb', 'nfc', 'ble', 'internal', 'hybrid'),
    backup_eligible BOOLEAN DEFAULT FALSE,
    backup_state BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id),
    UNIQUE KEY (credential_id(255)), -- Use a prefix index
    INDEX user_id_index (user_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE credential_transports (
    id BIGINT NOT NULL AUTO_INCREMENT, -- Add a surrogate primary key
    credential_id INT NOT NULL,
    transport ENUM('usb', 'nfc', 'ble', 'internal', 'hybrid') NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (credential_id) REFERENCES credentials(id) ON DELETE CASCADE
);

-- Insert mock data into users table
INSERT INTO users (user_name, email, phone_number, display_name, registration_date, last_login_date)
VALUES
    ('john_doe', 'john.doe@example.com', '123-456-7890', 'John', '2023-01-01 10:00:00', '2025-01-01 15:00:00'),
    ('jane_smith', 'jane.smith@example.com', '123-456-7891', 'Jane', '2023-02-01 11:00:00', '2025-01-10 14:30:00'),
    ('alice_brown', 'alice.brown@example.com', '123-456-7892', 'Alice', '2023-03-01 12:00:00', '2025-01-15 16:45:00'),
    ('bob_jones', 'bob.jones@example.com', '123-456-7893', 'Bob', '2023-04-01 13:00:00', '2025-01-20 17:20:00');

-- Insert mock data into credentials table
INSERT INTO credentials (user_id, credential_id, public_key, attestation_type, aaguid, signature_count, creation_date, last_used_date, type, transports, backup_eligible, backup_state)
VALUES
    (1, 'cred12345', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQ...', 'direct', '550e8400-e29b-41d4-a716-446655440000', 42, '2023-01-05 09:00:00', '2025-01-01 15:30:00', 'passwordless', 'usb,nfc', TRUE, FALSE),
    (2, 'cred23456', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQ...', 'indirect', '550e8400-e29b-41d4-a716-446655440001', 100, '2023-02-10 10:00:00', '2025-01-11 14:45:00', 'password', 'ble', FALSE, FALSE),
    (3, 'cred34567', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQ...', 'none', '550e8400-e29b-41d4-a716-446655440002', 88, '2023-03-15 11:30:00', '2025-01-16 17:00:00', 'passwordless', 'internal', TRUE, TRUE),
    (4, 'cred45678', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQ...', 'direct', '550e8400-e29b-41d4-a716-446655440003', 120, '2023-04-20 13:45:00', '2025-01-20 18:15:00', 'passwordless', 'usb,nfc,ble', TRUE, FALSE);

-- Insert mock data into credential_transports table
INSERT INTO credential_transports (credential_id, transport) VALUES
    (1, 'usb'),
    (1, 'nfc'),
    (2, 'ble'),
    (2, 'internal');

SET GLOBAL sql_mode = '';
