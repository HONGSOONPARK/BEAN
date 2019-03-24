Insert into TB_SEQ    (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE) Values (3, 3, 'BRD_DATA_IDX', '게시판', NOW());
Insert into TB_SEQ    (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)  Values    (1, 1, 'BRD_AAA001', '알림_공지사항', NOW());
Insert into TB_SEQ    (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)  Values    (2, 2, 'BRD_AAC001', '게시판_자유게시판', NOW());
Insert into TB_SEQ    (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)  Values    (4, 3, 'BRD_FILE_IDX', '첨부파일', NOW());
Insert into TB_SEQ    (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)  Values    (5, 12, 'CODE_DETAIL_IDX', '상세코드', NOW());
Insert into TB_SEQ    (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)  Values    (6, 4, 'CODE_IDX', '코드',NOW());
Insert into TB_SEQ    (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)  Values    (7, 3, 'MEMBER_NO', '홈페이지회원', NOW());
Insert into TB_SEQ    (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)  Values    (8, 15, 'MENU_IDX', '메뉴', NOW());
Insert into TB_SEQ    (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)  Values    (9, 28, 'ROLE_GROUP_IDX', '그룹권한', NOW());



Insert into ROLE_MENU    (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME,     MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID,     REG_DATE, MOD_ID, MOD_DATE)  Values    (15, 300, 301, 'BRD_AAC001', '자유게시판',     '/brd/brdList.do', 1, 'Y', 'N', 'admin',NOW(), 'admin',NOW());
Insert into ROLE_MENU    (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME,     SORT, USE_YN, ADMIN_YN, REG_ID, REG_DATE,     MOD_ID, MOD_DATE)  Values    (10, 0, 200, 'AAB000', '로또',     2, 'Y', 'N', 'admin',NOW(),     'admin', NOW());
Insert into ROLE_MENU    (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME,     SORT, USE_YN, ADMIN_YN, REG_ID, REG_DATE,     MOD_ID, MOD_DATE)  Values    (1, 0, 100, 'BRD_AAA000', '알림',     0, 'Y', 'N', 'admin',NOW(),     'admin', NOW());
Insert into ROLE_MENU    (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME,     MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID,     REG_DATE, MOD_ID, MOD_DATE)  Values    (2, 100, 101, 'BRD_AAA001', '공지사항',     '/brd/brdList.do', 0, 'Y', 'N', 'admin',     NOW(), 'admin', NOW());
Insert into ROLE_MENU    (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME,     SORT, USE_YN, ADMIN_YN, REG_ID, REG_DATE,     MOD_ID, MOD_DATE)  Values    (3, 0, 9000, 'ADM999', '관리자전용',     999, 'Y', 'N', 'admin', NOW(),     'admin', NOW());
Insert into ROLE_MENU    (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME,     MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID,     REG_DATE, MOD_ID, MOD_DATE)  Values    (4, 9000, 9001, 'ADM000', '통합관리',     '/admin/adminMain.do', 1, 'Y', 'N', 'admin',     NOW(), 'admin',NOW());
Insert into ROLE_MENU    (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME,     MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID,     REG_DATE, MOD_ID, MOD_DATE)  Values    (6, 0, 8002, 'ADM004', '메뉴관리',     '/admin/menuList.do', 4, 'Y', 'Y', 'admin', NOW(), 'admin', NOW());
Insert into ROLE_MENU    (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME,     MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID,     REG_DATE, MOD_ID, MOD_DATE)  Values    (7, 0, 8001, 'ADM003', '권한별메뉴관리',     '/admin/authMenuManager.do', 3, 'Y', 'Y', 'admin',     NOW(), 'admin', NOW());
Insert into ROLE_MENU    (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME,     MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID,     REG_DATE, MOD_ID, MOD_DATE)  Values    (8, 0, 8000, 'ADM002', '사용자정보관리',     '/admin/member/memberInfo.do', 2, 'Y', 'Y', 'admin',     NOW(), 'admin', NOW());
Insert into ROLE_MENU    (NO, DEPTH_2, MENU_ID, MENU_NAME, SORT,     USE_YN, ADMIN_YN, REG_ID, REG_DATE, MOD_ID,     MOD_DATE)  Values    (0, 0, 'MAIN', '최상단', 0,     'Y', 'N', 'admin', NOW(), 'admin',     NOW());
Insert into ROLE_MENU    (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME,     MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID,     REG_DATE, MOD_ID, MOD_DATE)  Values    (9, 0, 8003, 'ADM001', '코드관리',     '/admin/codeManager.do', 1, 'Y', 'Y', 'admin',NOW(), 'admin', NOW());
Insert into ROLE_MENU    (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME,     MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID,     REG_DATE, MOD_ID, MOD_DATE)  Values    (11, 200, 201, 'AAB001', '로또 번호 뽑기',     '/lotto_view.do', 1, 'Y', 'N', 'admin',  NOW(), 'admin',NOW());
Insert into ROLE_MENU    (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME,     SORT, USE_YN, ADMIN_YN, REG_ID, REG_DATE,     MOD_ID, MOD_DATE)  Values    (14, 0, 300, 'BRD_AAC000', '게시판',     1, 'Y', 'N', 'admin',NOW(),     'admin', NOW());

Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (3, 'ROLE_ADMIN', 10, 'AAB000', '로또',     'Y', 'Y', 'Y', 'admin', NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (4, 'ROLE_ADMIN', 11, 'AAB001', '로또 번호 뽑기',     'Y', 'Y', 'Y', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (6, 'ROLE_ADMIN', 3, 'ADM999', '관리자전용',     'Y', 'Y', 'Y', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (5, 'ROLE_ADMIN', 4, 'ADM000', '통합관리',     'Y', 'Y', 'Y', 'admin', NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (7, 'ROLE_GUEST', 1, 'BRD_AAA000', '알림',     'Y', 'N', 'N', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (8, 'ROLE_GUEST', 2, 'BRD_AAA001', '공지사항',     'Y', 'N', 'N', 'admin', NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (9, 'ROLE_GUEST', 10, 'AAB000', '로또',     'Y', 'N', 'N', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (10, 'ROLE_GUEST', 11, 'AAB001', '로또 번호 뽑기',     'Y', 'N', 'N', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (11, 'ROLE_USER', 1, 'BRD_AAA000', '알림',     'Y', 'N', 'N', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (12, 'ROLE_USER', 2, 'BRD_AAA001', '공지사항',     'Y', 'N', 'N', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (13, 'ROLE_USER', 10, 'AAB000', '로또',     'Y', 'N', 'N', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (14, 'ROLE_USER', 11, 'AAB001', '로또 번호 뽑기',     'Y', 'N', 'N', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (23, 'ROLE_ADMIN', 14, 'BRD_AAC000', '게시판',     'Y', 'Y', 'Y', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (24, 'ROLE_ADMIN', 15, 'BRD_AAC001', '자유게시판',     'Y', 'Y', 'Y', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (25, 'ROLE_GUEST', 14, 'BRD_AAC000', '게시판',     'Y', 'N', 'N', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (2, 'ROLE_ADMIN', 2, 'BRD_AAA001', '공지사항',     'Y', 'Y', 'Y', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (26, 'ROLE_GUEST', 15, 'BRD_AAC001', '자유게시판',     'Y', 'N', 'N', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (27, 'ROLE_USER', 14, 'BRD_AAC000', '게시판',     'Y', 'N', 'N', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (28, 'ROLE_USER', 15, 'BRD_AAC001', '자유게시판',     'Y', 'Y', 'Y', 'admin',NOW());
Insert into ROLE_GROUP    (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME,     READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)  Values    (1, 'ROLE_ADMIN', 1, 'BRD_AAA000', '알림',     'Y', 'Y', 'Y', 'admin',NOW());



Insert into MEMBER_INFO    (MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_ROLE, MEMBER_NICK,     MEMBER_NAME, DEL_YN, MEMBER_TYPE)  Values    (1, 'admin', '$2a$10$H3BV9tPjUP2IdXx./ICwUujl23HjcwpsGTv.bDmbtMOtJ3kIXwcGi', 'ROLE_ADMIN', '불독',     '관리자', 'N', '홈페이지');
Insert into MEMBER_INFO    (MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_ROLE, MEMBER_NICK,     MEMBER_NAME, DEL_YN, MEMBER_TYPE)  Values    (2, 'guest', '$2a$10$voFtrhMz6gPEtmAF5hpEuOyIGeQH82Zo74Xq/gBzfVGWBRRsO.ZUi', 'ROLE_GUEST', '테스트',     '손', 'N', '홈페이지');
Insert into MEMBER_INFO    (MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_ROLE, MEMBER_NICK,     MEMBER_NAME, DEL_YN, MEMBER_TYPE)  Values    (3, '1009291110', '$2a$10$zLFt39wa/7RbNT6Z5k293.GSkiW6kYP1CDbrx6jssUMUrctnQPPd2', 'ROLE_USER', '홍',     '홍', 'N', '카카오'); 


Insert into MEMBER_INFO_DETAIL    (MEMBER_ID, CRE_DATE, MOD_DATE, USE_YN, MEMBER_NO)  Values    ('1009291110',NOW(),NOW(), 'Y', 3);
Insert into MEMBER_INFO_DETAIL    (MEMBER_ID, MEMBER_TEL, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDR,     MEMBER_ADDR_2, MEMBER_ENG_NAME, CRE_DATE, MOD_DATE, USE_YN,     MEMBER_NO)  Values    ('admin', '043-222-2222', '010-4123-2517', 'admin@bean.com', 'San Francisco',     'street 1', 'James',NOW(),NOW(), 'Y',     1);
Insert into MEMBER_INFO_DETAIL    (MEMBER_ID, MEMBER_TEL, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDR,     MEMBER_ENG_NAME, CRE_DATE, MOD_DATE, USE_YN, MEMBER_NO)  Values    ('guest', '1588-1588', '1588-1588', 'guest@bean.com', 'Under the Sea',     'Jack',NOW(),NOW(), 'Y', 2);  

Insert into COMMON_CODE    (CODE, CODE_NAME, USE_YN, REG_ID, REG_DATE,     MOD_ID, MOD_DATE, NO)  Values    (3, '말머리', 'Y', 'admin',NOW(),     'admin', NOW(), 3);
Insert into COMMON_CODE    (CODE, CODE_NAME, USE_YN, REG_ID, REG_DATE,     MOD_ID, MOD_DATE, NO)  Values    (4, '회원가입유형', 'Y', 'admin',NOW(),     'admin', NOW(), 4);
Insert into COMMON_CODE    (CODE, CODE_NAME, USE_YN, REG_ID, REG_DATE,     MOD_ID, MOD_DATE, NO)  Values    (1, '권한코드', 'Y', 'admin',NOW(),     'admin',NOW(), 1);
Insert into COMMON_CODE    (CODE, CODE_NAME, USE_YN, REG_ID, REG_DATE,     MOD_ID, MOD_DATE, NO)  Values    (2, '사용구분', 'Y', 'admin',NOW(),     'admin', NOW(), 2); 


Insert into COMMON_CODE_DETAIL    (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REG_ID,     REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, DETAIL_NO)  Values    (4, '회원가입유형', '홈페이지', '홈페이지', 'admin',NOW(), 'admin',NOW(), 0, 9);
Insert into COMMON_CODE_DETAIL    (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REF_1,     REG_ID, REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER,     DETAIL_NO)  Values    (3, '말머리', '한마디', 'D', 'BRD_AAC001',     'admin', NOW(), 'admin', NOW(), 4,     11);
Insert into COMMON_CODE_DETAIL    (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REG_ID,     REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, DETAIL_NO)  Values    (4, '회원가입유형', '카카오', '카카오', 'admin',NOW(), 'admin',NOW(), 1, 10);
Insert into COMMON_CODE_DETAIL    (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REF_1,     REG_ID, REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER,     DETAIL_NO)  Values    (3, '말머리', '일상', 'E', 'BRD_AAC001',     'admin',NOW(), 'admin', NOW(), 5,     12);
Insert into COMMON_CODE_DETAIL    (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REF_1,     REG_ID, REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER,     DETAIL_NO)  Values    (3, '말머리', '행사', 'C', 'BRD_AAA001',     'admin', NOW(), 'admin', NOW(), 3,     8);
Insert into COMMON_CODE_DETAIL    (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REF_1,     REG_ID, REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER,     DETAIL_NO)  Values    (3, '말머리', '알림', 'A', 'BRD_AAA001',     'admin',NOW(), 'admin', NOW(), 1,     6);
Insert into COMMON_CODE_DETAIL    (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REF_1,     REG_ID, REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER,     DETAIL_NO)  Values    (3, '말머리', '중요', 'B', 'BRD_AAA001',     'admin',NOW(), 'admin', NOW(), 2,     7);
Insert into COMMON_CODE_DETAIL    (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REG_ID,     REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, DETAIL_NO)  Values    (2, '사용구분', '미사용', 'N', 'admin', NOW(), 'admin',NOW(), 2, 5);
Insert into COMMON_CODE_DETAIL    (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REG_ID,     REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, DETAIL_NO)  Values    (1, '권한코드', '관리자', 'ROLE_ADMIN', 'admin',NOW(), 'admin',NOW(), 1, 1);
Insert into COMMON_CODE_DETAIL    (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REG_ID,     REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, DETAIL_NO)  Values    (1, '권한코드', '손님', 'ROLE_GUEST', 'admin',NOW(), 'admin',NOW(), 2, 2);
Insert into COMMON_CODE_DETAIL    (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REG_ID,     REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, DETAIL_NO)  Values    (1, '권한코드', '일반', 'ROLE_USER', 'admin',NOW(), 'admin', NOW(), 3, 3);
Insert into COMMON_CODE_DETAIL    (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REG_ID,     REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, DETAIL_NO)  Values    (2, '사용구분', '사용', 'Y', 'admin',NOW(), 'admin',NOW(), 1, 4);

