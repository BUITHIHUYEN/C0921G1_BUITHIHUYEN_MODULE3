use quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from subject
where Credit= (select max(Credit) from `subject`);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select*
from subject
where SubId = (select SubId from mark where Mark = (select max(mark.Mark) from mark));
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select *,
avg(ifnull(mark.Mark,0)) as diem_trung_binh
from student
left join mark on mark.StudentId = student.StudentId
group by student.StudentId
order by mark.Mark desc;