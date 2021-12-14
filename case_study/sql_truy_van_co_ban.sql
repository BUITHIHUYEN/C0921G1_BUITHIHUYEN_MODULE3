-- task 2:	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” 
-- và có tối đa 15 kí tự.
use furama_database;
select *
from nhan_vien
where (ho_ten like 'H%' 
or ho_ten like 'T%'
or ho_ten like 'K%')
and char_length(ho_ten)<=15;

-- task 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang
where (round(datediff(curdate(),khach_hang.ngay_sinh)/365,0)>=18
and round(datediff(curdate(),khach_hang.ngay_sinh)/365,0)<=50)
and ((khach_hang.dia_chi like '%Đà Nẵng%' )
or (khach_hang.dia_chi like '%Quảng Trị%'));

-- task 4:Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.ma_khach_hang	,
kh.ho_ten,
count(hd.ma_khach_hang) 'total'
from khach_hang kh join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
where lk.ma_loai_khach=1
group by kh.ma_khach_hang
order by count(hd.ma_khach_hang);

-- task 5:5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select khach_hang.ma_khach_hang,
khach_hang .ho_ten,
loai_khach.ten_loai_khach,
hop_dong.ma_hop_dong,
dich_vu.ten_dich_vu,
hop_dong.ngay_lam_hop_dong,
hop_dong.ngay_ket_thuc,
sum(ifnull(dich_vu.chi_phi_thue,0)+ifnull(hop_dong_chi_tiet.so_luong,0)*ifnull(dich_vu_di_kem.gia,0)) total
from khach_hang  
left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong on khach_hang.ma_khach_hang =hop_dong.ma_khach_hang
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by ma_hop_dong 
order by ma_khach_hang asc ,ma_hop_dong desc;

-- task 6:Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- chưa từng được khách hàng thực hiện đặt quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dich_vu.ma_dich_vu,
dich_vu.ten_dich_vu,
dich_vu.dien_tich,
dich_vu.chi_phi_thue,
loai_dich_vu.ten_loai_dich_vu,
hop_dong.ngay_lam_hop_dong
from dich_vu
join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu =dich_vu.ma_loai_dich_vu
join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where dich_vu.ma_dich_vu not in (select hop_dong.ma_dich_vu
from hop_dong
where ((month(hop_dong.ngay_lam_hop_dong) between 1 and 3)
and year(hop_dong.ngay_lam_hop_dong)=2021))
group by dich_vu.ten_dich_vu;

-- task 7: Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dich_vu.ma_dich_vu,
dich_vu.ten_dich_vu,
dich_vu.dien_tich,
dich_vu.so_nguoi_toi_da,
dich_vu.chi_phi_thue,
loai_dich_vu.ten_loai_dich_vu,
hop_dong.ngay_lam_hop_dong
from dich_vu
join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where dich_vu.ma_dich_vu not in (select hop_dong.ma_dich_vu
from hop_dong
where
 year (hop_dong.ngay_lam_hop_dong) = 2021)
group by dich_vu.ten_dich_vu;
-- task 8: 	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.

-- cách 1:
select khach_hang.ho_ten
from khach_hang
group by khach_hang.ho_ten;
-- cách 2:
select distinct ho_ten
from khach_hang
group by ho_ten;
-- cách 3:chưa nghĩ ra

-- task 9:Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hop_dong.ngay_lam_hop_dong) as tháng,
count(month(hop_dong.ngay_lam_hop_dong)) as số_khách_đặt_phòng 
from hop_dong
where
year(hop_dong.ngay_lam_hop_dong)=2021
group by month( hop_dong.ngay_lam_hop_dong)
order by  month(hop_dong.ngay_lam_hop_dong);

-- task 10:Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hop_dong.ma_hop_dong,
hop_dong.ngay_lam_hop_dong,
hop_dong.ngay_ket_thuc,
hop_dong.tien_dat_coc,
sum(ifnull(so_luong,0)) as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
group by ma_hop_dong;

-- task 11: 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem,
dvdk.ten_dich_vu_di_kem,
dvdk.gia,
dvdk.don_vi,
dvdk.trang_thai,
lk.ten_loai_khach,
kh.dia_chi
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = 'Diamond' and (kh.dia_chi like '%Vinh%' or kh.dia_chi like '%Quãng Ngãi%');


-- task 12:Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ 
-- đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong,
nv.ho_ten,
kh.ho_ten,
kh.so_dien_thoai,
dv.ten_dich_vu,
sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem,
hd.tien_dat_coc
from hop_dong hd
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where  hd.ma_hop_dong in (
select hd.ma_hop_dong from hop_dong where (month(hd.ngay_lam_hop_dong) between 10 and 12) and year(hd.ngay_lam_hop_dong)=2020)
and hd.ma_hop_dong not in (select hd.ma_hop_dong from hop_dong where (month(hd.ngay_lam_hop_dong) between 1 and 6) and year(hd.ngay_lam_hop_dong)=2021)
group by hd.ma_hop_dong;

-- task 13: 























