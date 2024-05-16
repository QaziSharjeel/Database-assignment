
USE Votingsystem;
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    registration_date DATE
);

CREATE TABLE Elections (
    election_id INT PRIMARY KEY,
    election_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    description TEXT
);

CREATE TABLE Candidates (
    candidate_id INT PRIMARY KEY,
    election_id INT,
    user_id INT,
    candidate_name VARCHAR(100) NOT NULL,
    party VARCHAR(50),
    bio TEXT,
    FOREIGN KEY (election_id) REFERENCES Elections(election_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Voters (
    voter_id INT PRIMARY KEY,
    user_id INT,
    registration_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Ballots (
    ballot_id INT PRIMARY KEY,
    election_id INT,admins
    voter_id INT,
    submission_date DATE,
    FOREIGN KEY (election_id) REFERENCES Elections(election_id),
    FOREIGN KEY (voter_id) REFERENCES Voters(voter_id)
);

CREATE TABLE Votes (
    vote_id INT PRIMARY KEY,
    ballot_id INT,
    candidate_id INT,
    vote_date DATE,
    FOREIGN KEY (ballot_id) REFERENCES Ballots(ballot_id),
    FOREIGN KEY (candidate_id) REFERENCES Candidates(candidate_id)
);

CREATE TABLE Parties (
    party_id INT PRIMARY KEY,
    party_name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE ElectionResults (
    result_id INT PRIMARY KEY,
    election_id INT,
    candidate_id INT,
    total_votes INT,
    FOREIGN KEY (election_id) REFERENCES Elections(election_id),
    FOREIGN KEY (candidate_id) REFERENCES Candidates(candidate_id)
);

CREATE TABLE Admins (
    admin_id INT PRIMARY KEY,
    user_id INT,
    role VARCHAR(50),
    permissions TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE AuditLog (
    log_id INT PRIMARY KEY,
    user_id INT,
    action TEXT,
    timestamp TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);