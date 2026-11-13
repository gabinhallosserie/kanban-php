CREATE TABLE USERS(
   userId INT AUTO_INCREMENT,
   pseudo VARCHAR(50)  NOT NULL,
   email VARCHAR(50)  NOT NULL,
   password VARCHAR(255)  NOT NULL,
   PRIMARY KEY(userId)
);

CREATE TABLE BOARDS(
   boardId INT AUTO_INCREMENT,
   title VARCHAR(50)  NOT NULL,
   description VARCHAR(50)  NOT NULL,
   PRIMARY KEY(boardId)
);

CREATE TABLE COLUMNS(
   columnId INT AUTO_INCREMENT,
   title VARCHAR(50)  NOT NULL,
   color VARCHAR(50) ,
   boardId INT NOT NULL,
   PRIMARY KEY(columnId),
   FOREIGN KEY(boardId) REFERENCES BOARDS(boardId)
);

CREATE TABLE CARDS(
   cardId INT AUTO_INCREMENT,
   title VARCHAR(50)  NOT NULL,
   description VARCHAR(50) ,
   deadline DATE,
   columnId INT NOT NULL,
   PRIMARY KEY(cardId),
   FOREIGN KEY(columnId) REFERENCES COLUMNS(columnId)
);

CREATE TABLE has_access_to(
   userId INT,
   boardId INT,
   role VARCHAR(50)  NOT NULL,
   PRIMARY KEY(userId, boardId),
   FOREIGN KEY(userId) REFERENCES USERS(userId),
   FOREIGN KEY(boardId) REFERENCES BOARDS(boardId)
);

CREATE TABLE is_assigned_to(
   userId INT,
   cardId INT,
   PRIMARY KEY(userId, cardId),
   FOREIGN KEY(userId) REFERENCES USERS(userId),
   FOREIGN KEY(cardId) REFERENCES CARDS(cardId)
);
