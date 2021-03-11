--1. What grades are there?

select *
from Grade;

--2. What emotions may be associated with a poem?

select *
from Emotion;

--3. How many poems are in the database?

select count (p.Id) as NumberOfPoems
from Poem p;

--4. Sort authors alphabetically by name. What are the names of the top 76 authors?

select top 76 (a.Name) as AuthorName
from Author a
	order by a.Name asc;


--5. Starting with the above query, add the grade of each of the authors.

select top 76 (a.Name) as AuthorName, g.Name as AuthorsGrade
from Author a
LEFT JOIN Grade g ON a.GradeId = g.Id
	order by a.Name asc;

--6. Starting with the above query, add the recorded gender of each of the authors.

select top 76 (a.Name) as AuthorName, g.Name as AuthorsGrade, gen.Name as AuthorsGender
from Author a
LEFT JOIN Grade g ON a.GradeId = g.Id
LEFT JOIN Gender gen ON a.GenderId = gen.Id
	order by a.Name asc;

--7. What is the total number of words in all poems in the database?

select count (p.WordCount) as TotalWords
	from Poem p;

-- 8. Which poem has the fewest characters?

select p.Title as PoemName, p.CharCount as CharCount
from poem p
	where p.CharCount = (
	select min (p.CharCount)
	from poem p);

--9. How many authors are in the third grade?

select count (a.GradeId) as TotalThirdGraders
	from Author a
	Where a.GradeId = 3;

--10. How many authors are in the first, second or third grades?

select count (a.GradeId) as TotalFirstGraders
	from Author a
	where a.gradeId = 1;
		select count (a.GradeId) as TotalSecondGraders
		from Author a
		where a.GradeId = 2;
			select count (a.GradeId) as TotalThirdGraders
			from Author a
			where a.GradeId = 3;

--11. What is the total number of poems written by fourth graders?

select count (p.id) as totalPoemsByFourthGraders
 from Poem p
	JOIN Author a ON p.AuthorId = a.Id
	JOIN Grade g ON a.GradeId = g.Id
	where g.Name = '4th Grade';

--12. How many poems are there per grade

select count(p.id) as totalPoemsByGrade
	from Poem p
		JOIN author a on p.authorid = a.id
		JOIN Grade g on a.GradeId = g.id
		group by g.id

--13. How many authors are in each grade? (Order your results by grade starting with 1st Grade)

select count (a.id) as TotalAuthorsByGrade
	from Author a
		join Grade g on a.GradeId = g.id
	group by g.id

--14. What is the title of the poem that has the most words?

select p.Title
	from Poem p
where p.WordCount = (
	select max (p.WordCount)
		from Poem p
		);

--15. Which author(s) have the most poems? (Remember authors can have the same name.)

select count(distinct p.AuthorId) as NumberOfPoems, a.Name
	from Poem p JOIN Author a on p.AuthorId = a.Id
group by a.Name
	having count(distinct p.AuthorId) > 1


--16. How many poems have an emotion of sadness?

select count (p.Id)
	from Poem p JOIN PoemEmotion emo on p.Id = emo.PoemId
	where emo.EmotionId = 3;

--17. How many poems are not associated with any emotion?

select count (p.Id)
	from Poem p 
	JOIN PoemEmotion pemo on p.Id = pemo.PoemId
	JOIN Emotion emo on pemo.Id = emo.Id
	where emo.Name = NULL
	
--18. Which emotion is associated with the least number of poems?

select count (emo.Id), emo.name
from Emotion emo
join PoemEmotion pemo on emo.id = pemo.EmotionId
join Poem p on pemo.PoemId = p.id
group by emo.name
	

--19. Which grade has the largest number of poems with an emotion of joy?

select count (p.Id) as numOfPoems, g.name
	from Poem p
	join Grade g on p.Id = p.AuthorId
	Join Author a on g.Id = a.GradeId
	join PoemEmotion pemo on pemo.PoemId = p.Id
	join Emotion emo on pemo.EmotionId = emo.Id
	where emo.Id = 4
	group by g.Name

--20. Which gender has the least number of poems with an emotion of fear?

select count (gen.Id), gen.Name
from Gender gen
join Author a on a.GenderId = gen.Id
join Poem p on a.Id = p.AuthorId
join PoemEmotion pemo on p.Id = pemo.PoemId
join Emotion emo on pemo.EmotionId = emo.Id
where emo.Id = 2
group by gen.Name
	
	

