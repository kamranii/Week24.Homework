--HOMEWORK TASK

CREATE TABLE Books(
    ID SMALLINT PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(100) NOT NULL UNIQUE 
)

CREATE TABLE Addresses(
    ID SMALLINT PRIMARY KEY IDENTITY(1,1),
    [City] NVARCHAR(50) NOT NULL UNIQUE,
    [Country] NVARCHAR(100) NOT NULL
)
CREATE TABLE Authors(
    [Name] NVARCHAR(100),
    [Age] SMALLINT NOT NULL CHECK(Age <= 30),
    [AddressID] SMALLINT FOREIGN KEY REFERENCES Addresses(ID),
    [BookID] SMALLINT FOREIGN KEY REFERENCES Books(ID),
    [Company] NVARCHAR(100),
    CONSTRAINT PK_Authors PRIMARY KEY ([Name], BookID)
)

INSERT Books([Name]) VALUES ('Səfillər'), ('Gülən adam'), ('Cinayət və Cəza'), ('Kürk Mantolu Madonna'), ('Danabaş kəndinin əhvalatları')

INSERT Addresses([City], [Country]) VALUES ('Paris', 'France'), ('Saint-Petersburg', 'Russia'), ('Istanbul', 'Turkiye'), ('Nakhchivan', 'Azerbaijan')

INSERT Authors([Name], [Age], [AddressID], [BookID]) VALUES 
('Victor Hugo', 25, 1, 1),
('Victor Hugo', 25, 1, 2),
('Fyodor Dostoevsky', 22, 2, 3),
('Calil Mammadquluzade', 29, 4, 4),
('Sebahattin Ali', 24, 3, 3)

SELECT B.Name, AU.Name, AD.City, AD.Country FROM Authors AS AU 
JOIN Addresses AS AD ON AU.AddressID = AD.ID 
JOIN Books AS B ON AU.BookID = B.ID 
WHERE B.Name = 'Səfillər' 