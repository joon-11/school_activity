select * from member_tbl_02;

select custno, custname, phone, address, to_char(joindate,'yyyy-mm-dd')joindate, 
decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원'), city from member_tbl_02 where custno = ?;

update member_tbl_02 set custname = '김행박' where custno = '100001';