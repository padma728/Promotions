Select 
	InstructorName, 
	CourseName, 
	Stuff((SELECT ', ' + Name
	FROM Student std
	Inner Join Course C on std.StudentID = C.StudentId
	where std.StudentID = C.StudentId and C.CourseName = Cour.CourseName
        FOR XML PATH('')),1, 1, '')
from Instructor Inst 
inner join Course Cour on Inst.InstructorId = Cour.InstructorId 
group by InstructorName, CourseName
order by InstructorName, CourseName