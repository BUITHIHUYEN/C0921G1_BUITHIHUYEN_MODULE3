use quan_ly_sinh_vien;
-- Hiển thị danh sách tất cả các học viên
select *
from student

-- Hiển thị danh sách các học viên đang học
select *
from student
where `status` = true;

-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
select *
from subject 
where credit <10;

-- Hiển thị danh sách học viên lớp A1
-- Join 2 bảng Student và Class bằng câu lệnh sau:
select student.StudentId,student.StudentName,class.ClassName
from student student join class class on student.ClassId = class.ClassID
-- Sử dụng câu lệnh Where C.ClassName ='A1' để hiển thị danh sách học viên lớp A1
where class.ClassName = 'A1';

-- Hiển thị tất cả các điểm đang có của học viên
select student.StudentId,student.StudentName,subject.SubName,mark.Mark
from student student join mark mark	on student.StudentId = mark.StudentId join `subject` `subject` on mark.SubId = subject.SubId

-- Sử dụng câu lệnh Where để hiển thị điểm môn CF các học viên
select student.StudentId,student.StudentName,subject.SubName,mark.Mark
from student student join mark mark	on student.StudentId = mark.StudentId join `subject` `subject` on mark.SubId = subject.SubId
where subject.SubName ='CF';





