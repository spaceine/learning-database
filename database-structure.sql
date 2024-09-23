CREATE DATABASE dogkennel;
\c dogkennel;

CREATE TABLE IF NOT EXISTS breed(
    breedId serial NOT NULL,
    breedName varchar(100) NOT NULL,
    PRIMARY KEY(breedId)
);

CREATE TABLE IF NOT EXISTS owner(
    ownerId serial NOT NULL,
    surname varchar(100) NOT NULL,
    name varchar(100) NOT NULL,
    patronymic varchar(100),
    PRIMARY KEY(ownerId)
);

CREATE TABLE IF NOT EXISTS dog(
    dogId serial NOT NULL,
    dogName varchar(255) NOT NULL,
    gender char(1) NOT NULL,
    dogBirthday date NOT NULL,
    isDead boolean DEFAULT FALSE,
    ownerId integer,
    mother integer,
    father integer,
    breedId integer NOT NULL,
    PRIMARY KEY(dogId),
    FOREIGN KEY(ownerId) REFERENCES owner(ownerId) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(mother) REFERENCES dog(dogId) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(father) REFERENCES dog(dogId) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(breedId) REFERENCES breed(breedId) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS medal(
    medalId serial NOT NULL,
    medalType varchar(30) NOT NULL,
    medalName varchar(50) NOT NULL,
    dateOfReceipt date NOT NULL,
    dogId integer,
    PRIMARY KEY(medalId),
    FOREIGN KEY(dogId) REFERENCES dog(dogId) ON DELETE SET NULL ON UPDATE CASCADE
);
