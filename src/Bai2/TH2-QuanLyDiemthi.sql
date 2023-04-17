--  Tạo mới schema
create database QuanLyDiemThi;
use quanlydiemthi;

-- Tạo bảng khai báo các trường và kiểu dữ liệu
create table HocSinh(
MaHS varchar(20) primary key,
TenHS varchar(50),
NgaySinh date,
Lop varchar(20),
GT varchar(20)
);
-- gán dữ liệu cho các trường
insert into HocSinh(MaHS, TenHS, NgaySinh, Lop,GT) values
("HS01", "Son", "2023-04-16", "Java 10", "Nam"),
("HS02", "Huy", "2023-05-15", "Java 11", "Nam"),
("HS03", "Thu", "2000-09-11", "Java 9", "Nu");


create table MonHoc(
MaMH varchar(20) primary key,
TenMH varchar(50)
);
insert into MonHoc(MaMH,TenMH) values 
("MH01", "CSS"),
("MH02", "Javascript"),
("MH03", "PHP");


create table BangDiem(
MaHS varchar(20),
MaMH varchar(20),
DiemKT int,
NgayKT datetime,
primary key (MaHS, MaMH),
foreign key (MaHS) references HocSinh(MaHS),
foreign key (MaMH) references MonHoc(MaMH)
);
insert into BangDiem(MaHS, MaMH, DiemKT, NgayKT) values
("HS01", "MH02", 8, now());




create table GiaoVien(
MaGV varchar(20) primary key,
TenGV varchar(20),
SDT varchar(10)
);
insert into GiaoVien( MaGV, TenGV, SDT) values
(GV01, ThayToan, 0123456789),
(GV02, ThayHung, 0922222222),
(GV03, ThayChinh, 0933333333);


alter table MonHoc add MaGV varchar(20);
alter table MonHoc add constraint FK_MaSV foreign key (MaGV)
references GiaoVien(MaGV);

select h.MaHS ,  h.TenHS, h.Lop, b.DiemKT from hocsinh h join bangdiem b on h.MaHS=b.MaHS where b.DiemKT=8;

