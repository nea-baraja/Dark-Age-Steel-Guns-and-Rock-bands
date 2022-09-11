create table "counter" (
'numbers' INTEGER NOT NULL,
PRIMARY KEY(numbers)
);

WITH RECURSIVE
  Indices(i) AS (SELECT -50 UNION ALL SELECT (i + 1) FROM Indices LIMIT 100)
  insert into counter(numbers) select i from Indices;