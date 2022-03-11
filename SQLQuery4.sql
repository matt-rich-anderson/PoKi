--1. What grades are stored in the database?   1st-5th Grade
Select *
From Grade

--2. What emotions may be associated with a poem?   4 Emptions: Anger, Fear, Sadness, Joy
Select *
From Emotion

--3. How many poems are in the database?   32842
Select Count(Id) AS NumPoems
From Poem

--4. Sort authors alphabetically by name. What are the names of the top 76 authors?
Select top 76 Name
From Author
Order By Name

--5. Starting with the above query, add the grade of each of the authors.
Select 
	top 76 a.Name,
	g.Name
From Author a join Grade g on a.GradeId = g.Id
Order By a.Name

--6. Starting with the above query, add the recorded gender of each of the authors.
Select 
	top 76 a.Name as AuthorName,
	g.Name as Grade,
	gr.Name as Gender
From Author a 
	join Grade g on a.GradeId = g.Id
	join Gender gr on a.GenderId = gr.Id
Order By a.Name

--7. What is the total number of words in all poems in the database?
Select Sum(WordCount) As TotalWords
From Poem

--8. Which poem has the fewest characters?
Select Top 1 CharCount, Title
From Poem
Order by CharCount asc

--9. How many authors are in the third grade?
Select Count(*) as NumOf3rdGraders
From Author
Where GradeId = 3

--10. How many total authors are in the first through third grades?
Select Count(*) as FirstThroughThird
From Author
Where GradeId <= 3

--11. What is the total number of poems written by fourth graders?
Select Count(*) as PoemsByFourth
From Poem p left join Author a on p.AuthorId = a.Id
Where a.GradeId = 4

--12. How many poems are there per grade?
Select g.Name as GradeName, Count(p.Id) as NumPoems
From Grade g join Author a on g.Id = a.GradeId join Poem p on a.Id = p.AuthorId
Group By g.name

--13. How many authors are in each grade? (Order your results by grade starting with 1st Grade)
Select g.Name as Grades, Count(a.id) as NumAuthor
From Grade g join Author a on g.Id = a.GradeId
Group By g.Name
--14. What is the title of the poem that has the most words?
--15. Which author(s) have the most poems? (Remember authors can have the same name.)
--16. How many poems have an emotion of sadness?
--17. How many poems are not associated with any emotion?
--18. Which emotion is associated with the least number of poems?
--19. Which grade has the largest number of poems with an emotion of joy?
--20. Which gender has the least number of poems with an emotion of fear?