use quan_ly_sinh_vien;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *
from student
where StudentName like "h%";

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from class
where StartDate like "%-12-%";

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *
from `subject`
where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.

update student
set ClassId =2
where StudentName ='Hung';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
insert into mark
values (4,1,3,8,1);
select s.StudentName,su.SubName,m.Mark 
from student s join mark m on s.StudentId=m.StudentId join `subject` su on m.SubId = su.SubId
order by m.Mark desc ,s.StudentName asc;








