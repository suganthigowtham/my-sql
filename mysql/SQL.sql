

-- Create database
CREATE DATABASE IF NOT EXISTS IMB;

-- Use the MOB database
USE IMB;

-- Create table for movies
CREATE TABLE IF NOT EXISTS Movies (
    MovieID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ReleaseDate DATE,
    Duration INT,
    Description TEXT
);

-- Create table for media (videos and images)
CREATE TABLE IF NOT EXISTS Media (
    MediaID INT AUTO_INCREMENT PRIMARY KEY,
    MovieID INT,
    Type ENUM('video', 'image') NOT NULL,
    URL VARCHAR(255) NOT NULL,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- Create table for genres
CREATE TABLE IF NOT EXISTS Genres (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- Create table for movie-genre relationships
CREATE TABLE IF NOT EXISTS MovieGenres (
    MovieID INT,
    GenreID INT,
    PRIMARY KEY (MovieID, GenreID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- Create table for reviews
CREATE TABLE IF NOT EXISTS Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    MovieID INT,
    UserID INT,
    Rating DECIMAL(3, 1),
    Comment TEXT,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create table for users
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(255)
);

-- Create table for artists
CREATE TABLE IF NOT EXISTS Artists (
    ArtistID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- Create table for skills
CREATE TABLE IF NOT EXISTS Skills (
    SkillID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- Create table for artist skills
CREATE TABLE IF NOT EXISTS ArtistSkills (
    ArtistID INT,
    SkillID INT,
    PRIMARY KEY (ArtistID, SkillID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (SkillID) REFERENCES Skills(SkillID)
);

-- Create table for roles
CREATE TABLE IF NOT EXISTS Roles (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- Create table for artist roles in movies
CREATE TABLE IF NOT EXISTS ArtistRoles (
    MovieID INT,
    ArtistID INT,
    RoleID INT,
    PRIMARY KEY (MovieID, ArtistID, RoleID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

-- Insert sample data into Movies table
INSERT INTO Movies (Title, ReleaseDate, Duration, Description)
VALUES ('The Shawshank Redemption', '1994-09-23', 142, 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.'),
       ('The Godfather', '1972-03-24', 175, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.'),
       ('The Dark Knight', '2008-07-18', 152, 'When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.');

-- Insert sample data into Genres table
INSERT INTO Genres (Name)
VALUES ('Drama'), ('Crime'), ('Thriller');

-- Insert sample data into Users table
INSERT INTO Users (Name, Email, Password)
VALUES ('John Doe', 'john@example.com', 'password123'),
       ('Jane Smith', 'jane@example.com', 'password456');

-- Insert sample data into Artists table
INSERT INTO Artists (Name)
VALUES ('Morgan Freeman'), ('Marlon Brando'), ('Heath Ledger');

-- Insert sample data into Skills table
INSERT INTO Skills (Name)
VALUES ('Acting'), ('Directing'), ('Writing');

-- Insert sample data into Roles table
INSERT INTO Roles (Name)
VALUES ('Actor'), ('Director');

-- Insert sample data into ArtistSkills table
INSERT INTO ArtistSkills (ArtistID, SkillID)
VALUES (1, 1), (2, 1), (3, 1);

-- Insert sample data into ArtistRoles table
INSERT INTO ArtistRoles (MovieID, ArtistID, RoleID)
VALUES (1, 1, 1), (2, 2, 1), (3, 3, 1), (3, 3, 2);
```

In this database design:

- The `Movies` table stores information about movies.
- The `Media` table stores information about media associated with movies (videos or images).
- The `Genres` table stores information about movie genres.
- The `MovieGenres` table establishes a many-to-many relationship between movies and genres.
- The `Reviews` table stores reviews given by users for movies.
- The `Users` table stores information about users.
- The `Artists` table stores information about artists involved in movies.
- The `Skills` table stores information about skills artists possess.
- The `ArtistSkills` table establishes a many-to-many relationship between artists and skills.
- The `Roles` table stores information about roles artists can perform in movies.
- The `ArtistRoles` table establishes a many-to-many relationship between movies, artists, and roles.

This design allows for flexibility in managing various aspects of movies, including media, genres, reviews, artists, skills, and roles.
