select m_no, m_name, a.p_code, decode(p_school, 1, '고졸', 2, '학사', 3, '석사') 학력, to_char(substr(m_jumin, 1,6)||'-'||substr(m_jumin, 7,7))주민번호, m_city,
to_char(b.p_tel1||'-'||b.p_tel2||'-'||b.p_tel3)from tbl_member_202005 a, tbl_party_202005 b where a.p_code = b.p_code; 


select b.m_no, m_name, sum(a.m_no) from tbl_vote_202005 a,tbl_member_202005 b where a.m_no = b.m_no group by b.m_no, m_name; 

select a.m_no 후보번호, a.m_name 성명, count(b.m_no) 총투표건수 from tbl_member_202005 a, tbl_vote_202005 b where a.m_no = b.m_no and b.v_confirm = 'Y' group by a.m_no, a.m_name order by 총투표건수;

