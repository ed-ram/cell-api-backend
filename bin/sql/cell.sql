CREATE TABLE cell(
    id SERIAL PRIMARY KEY,
    identified varchar(50),
    discovered date
);

CREATE TABLE sequencePair(
    id SERIAL PRIMARY KEY,
    master boolean,
    heavySeqDNA varchar(255),
    lightSeqDNA varchar(255)
);

CREATE TABLE person(
    id SERIAL PRIMARY KEY,
    userId varchar(50),
    username varchar(50),
    emailAddress varchar(50)
);

CREATE TABLE discoveredBy(
    cell int,
    person int
);

CREATE TABLE pairBelongsTo(
    sequencePair int,
    cell int
);

INSERT INTO pairBelongsTo(sequencePair, cell)
VALUES
(1, 1),
(2, 3),
(3,3);

INSERT INTO cell
VALUES
(DEFAULT, 'yes', current_timestamp),
(DEFAULT, 'no', current_timestamp),
(DEFAULT, 'yes', current_timestamp);

INSERT INTO person 
VALUES 
(DEFAULT, 'barry', 'barry hughes', 'barry.h@pub.com'),
(DEFAULT, 'larry', 'larry quandry', 'larry.q@pub.com'),
(DEFAULT, 'harry', 'harry dupont', 'harry.d@pub.com');

INSERT INTO sequencePair 
VALUES 
(DEFAULT, true, 'AAAAGGGCCCTTT', 'CCCCCCCCCCCC'),
(DEFAULT, false, 'AAATTTTCCGGGCTTT', 'AAAAAAAAAA'),
(DEFAULT, true, 'AAAAGGGCCCTTT', 'TTTTTTTTTTTTTTTC');

INSERT INTO discoveredBy
VALUES
(1,2),
(2,1),
(3,3);