create table Reviews
(
MovieID INT,
ReviewID BIGINT,
Review VARCHAR(100),
Rating TINYINT
) clustered by (ReviewID) INTO 4 Buckets

insert into Reviews
values
(1,1, 'Amazing',5),
(1,2, 'Genre-Defining',5),
(1,3, 'Classic',5),
(1,4, 'Overrated',1),
(1,5, 'OK, Not Great',3),
(1,6, 'Two Thumbs Up',5),
(3,7, 'Crossover Hit',5),
(3,8, 'Love It',4),
(3,9, 'Nailbiting!',5),
(1,10, 'Cinematic Masterpiece',5),
(5,11, 'So Bad Its Good',0),
(2,12, 'Not Best As Good as Original',3),
(2,13, 'Overrated',2),
(2,14, 'Too Morbid',3),
(4,15, 'Sad, Thought-Provoking',4),
(4,16, 'Cinema At Its Best',5);


select * from reviews tablesample (bucket 4 out of 4 on ReviewId);



