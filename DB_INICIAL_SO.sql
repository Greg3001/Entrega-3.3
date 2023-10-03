CREATE DATABASE JugadoresDB;

USE JugadoresDB;

CREATE TABLE Jugadores (
    PlayerID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Username VARCHAR(100) NOT NULL UNIQUE,
    Contraseña VARCHAR(100) NOT NULL
);


CREATE DATABASE PartidasDB;

USE PartidasDB;

CREATE TABLE Partidas (
    GameID INT PRIMARY KEY AUTO_INCREMENT,
    FechaHora DATETIME NOT NULL,
    Tiempo INT NOT NULL,
    FOREIGN KEY (Player1) REFERENCES Jugadores(PlayerID),
    FOREIGN KEY (Player2) REFERENCES Jugadores(PlayerID),
    FOREIGN KEY (Player3) REFERENCES Jugadores(PlayerID),
    FOREIGN KEY (BackgroundID) REFERENCES FONDO(BackgroundID),
    FOREIGN KEY (Ganador) REFERENCES Historial(PlayerID)    
);



INSERT INTO Jugadores (PlayerID, Nombre, Username, Contraseña)
VALUES (1, 'Angela', 'AngelaCiutat', '123456789'),
       (2, 'Brais', 'BraisArrieta', '987654321'),
       (3, 'Grigory', 'GrigoryFilimonov', 'asdfghjklñ');

INSERT INTO Partidas (GameID, FechaHora, Tiempo, Player1, Player2, Player3, BackgroundID, Ganador)
VALUES (1, '2023-10-01 12:00:00', 120, 1, 2, 3, 5, 2),
       (2, '2023-10-02 08:54:30', 70, 2, 1, 3, 3, 1),
       (3, '2023-09-30 18:47:29', 100, 1, 3, 2, 1, 3),

