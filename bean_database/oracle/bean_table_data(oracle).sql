Insert into TB_SEQ
   (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)
 Values
   (3, 0, 'BRD_DATA_IDX', '게시판', TO_DATE('02/07/2019 18:24:32', 'MM/DD/YYYY HH24:MI:SS'));
Insert into TB_SEQ
   (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)
 Values
   (1, 0, 'BRD_AAA001', '알림_공지사항', TO_DATE('02/07/2019 13:50:30', 'MM/DD/YYYY HH24:MI:SS'));
Insert into TB_SEQ
   (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)
 Values
   (2, 0, 'BRD_AAC001', '게시판_자유게시판', TO_DATE('02/07/2019 13:50:31', 'MM/DD/YYYY HH24:MI:SS'));
Insert into TB_SEQ
   (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)
 Values
   (4, 0, 'BRD_FILE_IDX', '첨부파일', TO_DATE('02/07/2019 13:50:31', 'MM/DD/YYYY HH24:MI:SS'));
Insert into TB_SEQ
   (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)
 Values
   (5, 14, 'CODE_DETAIL_IDX', '상세코드', TO_DATE('02/07/2019 13:50:31', 'MM/DD/YYYY HH24:MI:SS'));
Insert into TB_SEQ
   (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)
 Values
   (6, 5, 'CODE_IDX', '코드', TO_DATE('02/07/2019 13:50:31', 'MM/DD/YYYY HH24:MI:SS'));
Insert into TB_SEQ
   (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)
 Values
   (7, 2, 'MEMBER_NO', '홈페이지회원', TO_DATE('02/07/2019 13:50:31', 'MM/DD/YYYY HH24:MI:SS'));
Insert into TB_SEQ
   (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)
 Values
   (8, 15, 'MENU_IDX', '메뉴', TO_DATE('02/07/2019 13:50:31', 'MM/DD/YYYY HH24:MI:SS'));
Insert into TB_SEQ
   (NO, SEQ_NO, SEQ_CODE, SEQ_NAME, REG_DATE)
 Values
   (9, 28, 'ROLE_GROUP_IDX', '그룹권한', TO_DATE('02/07/2019 13:50:31', 'MM/DD/YYYY HH24:MI:SS'));
COMMIT;



Insert into MEMBER_INFO
   (MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_ROLE, MEMBER_NICK, 
    MEMBER_NAME, DEL_YN, MEMBER_TYPE)
 Values
   (1, 'admin', '$2a$10$H3BV9tPjUP2IdXx./ICwUujl23HjcwpsGTv.bDmbtMOtJ3kIXwcGi', 'ROLE_ADMIN', '불독', 
    '관리자', 'N', '홈페이지');
Insert into MEMBER_INFO
   (MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_ROLE, MEMBER_NICK, 
    MEMBER_NAME, DEL_YN, MEMBER_TYPE)
 Values
   (2, 'guest', '$2a$10$voFtrhMz6gPEtmAF5hpEuOyIGeQH82Zo74Xq/gBzfVGWBRRsO.ZUi', 'ROLE_GUEST', '테스트', 
    '손', 'N', '홈페이지');
COMMIT;


Insert into MEMBER_INFO_DETAIL
   (MEMBER_ID, MEMBER_TEL, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDR, 
    MEMBER_ADDR_2, MEMBER_ENG_NAME, CRE_DATE, MOD_DATE, USE_YN, 
    MEMBER_NO)
 Values
   ('admin', '043-222-2222', '010-4123-2517', 'admin@bean.com', 'San Francisco', 
    'street 1', 'James', TO_DATE('11/17/2018 10:18:43', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('02/02/2019 01:16:17', 'MM/DD/YYYY HH24:MI:SS'), 'Y', 
    1);
Insert into MEMBER_INFO_DETAIL
   (MEMBER_ID, MEMBER_TEL, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDR, 
    MEMBER_ENG_NAME, CRE_DATE, MOD_DATE, USE_YN, MEMBER_NO)
 Values
   ('guest', '1588-1588', '1588-1588', 'guest@bean.com', 'Under the Sea', 
    'Jack', TO_DATE('11/17/2018 17:57:39', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('02/01/2019 14:41:32', 'MM/DD/YYYY HH24:MI:SS'), 'Y', 2);
COMMIT;


Insert into COMMON_CODE
   (CODE, CODE_NAME, USE_YN, REG_ID, REG_DATE, 
    MOD_ID, MOD_DATE, NO)
 Values
   (3, '말머리', 'Y', 'admin', TO_DATE('01/11/2019 17:18:07', 'MM/DD/YYYY HH24:MI:SS'), 
    'admin', TO_DATE('02/07/2019 21:05:25', 'MM/DD/YYYY HH24:MI:SS'), 3);
Insert into COMMON_CODE
   (CODE, CODE_NAME, USE_YN, REG_ID, REG_DATE, 
    MOD_ID, MOD_DATE, NO)
 Values
   (4, '회원가입유형', 'Y', 'admin', TO_DATE('02/01/2019 00:43:08', 'MM/DD/YYYY HH24:MI:SS'), 
    'admin', TO_DATE('02/01/2019 19:56:16', 'MM/DD/YYYY HH24:MI:SS'), 4);
Insert into COMMON_CODE
   (CODE, CODE_NAME, USE_YN, REG_ID, REG_DATE, 
    MOD_ID, MOD_DATE, NO)
 Values
   (1, '권한코드', 'Y', 'admin', TO_DATE('11/19/2018 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 
    'admin', TO_DATE('01/10/2019 23:19:40', 'MM/DD/YYYY HH24:MI:SS'), 1);
Insert into COMMON_CODE
   (CODE, CODE_NAME, USE_YN, REG_ID, REG_DATE, 
    MOD_ID, MOD_DATE, NO)
 Values
   (2, '사용구분', 'Y', 'admin', TO_DATE('11/19/2018 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 
    'admin', TO_DATE('12/14/2018 15:54:01', 'MM/DD/YYYY HH24:MI:SS'), 2);
COMMIT;



Insert into COMMON_CODE_DETAIL
   (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, DETAIL_NO)
 Values
   (4, '회원가입유형', '홈페이지', '홈페이지', 'admin', 
    TO_DATE('02/01/2019 19:56:16', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('02/01/2019 19:56:16', 'MM/DD/YYYY HH24:MI:SS'), 0, 9);
Insert into COMMON_CODE_DETAIL
   (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REF_1, 
    REG_ID, REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, 
    DETAIL_NO)
 Values
   (3, '말머리', '한마디', 'D', 'BRD_AAC001', 
    'admin', TO_DATE('02/07/2019 21:05:25', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('02/07/2019 21:05:25', 'MM/DD/YYYY HH24:MI:SS'), 4, 
    11);
Insert into COMMON_CODE_DETAIL
   (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, DETAIL_NO)
 Values
   (4, '회원가입유형', '카카오', '카카오', 'admin', 
    TO_DATE('02/01/2019 19:56:16', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('02/01/2019 19:56:16', 'MM/DD/YYYY HH24:MI:SS'), 1, 10);
Insert into COMMON_CODE_DETAIL
   (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REF_1, 
    REG_ID, REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, 
    DETAIL_NO)
 Values
   (3, '말머리', '일상', 'E', 'BRD_AAC001', 
    'admin', TO_DATE('02/07/2019 21:05:25', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('02/07/2019 21:05:25', 'MM/DD/YYYY HH24:MI:SS'), 5, 
    12);
Insert into COMMON_CODE_DETAIL
   (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REF_1, 
    REG_ID, REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, 
    DETAIL_NO)
 Values
   (3, '말머리', '행사', 'C', 'BRD_AAA001', 
    'admin', TO_DATE('02/07/2019 21:05:25', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('02/07/2019 21:05:25', 'MM/DD/YYYY HH24:MI:SS'), 3, 
    8);
Insert into COMMON_CODE_DETAIL
   (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REF_1, 
    REG_ID, REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, 
    DETAIL_NO)
 Values
   (3, '말머리', '알림', 'A', 'BRD_AAA001', 
    'admin', TO_DATE('02/07/2019 21:05:25', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('02/07/2019 21:05:25', 'MM/DD/YYYY HH24:MI:SS'), 1, 
    6);
Insert into COMMON_CODE_DETAIL
   (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REF_1, 
    REG_ID, REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, 
    DETAIL_NO)
 Values
   (3, '말머리', '중요', 'B', 'BRD_AAA001', 
    'admin', TO_DATE('02/07/2019 21:05:25', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('02/07/2019 21:05:25', 'MM/DD/YYYY HH24:MI:SS'), 2, 
    7);
Insert into COMMON_CODE_DETAIL
   (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, DETAIL_NO)
 Values
   (2, '사용구분', '미사용', 'N', 'admin', 
    TO_DATE('12/14/2018 15:54:01', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('12/14/2018 15:54:01', 'MM/DD/YYYY HH24:MI:SS'), 2, 5);
Insert into COMMON_CODE_DETAIL
   (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, DETAIL_NO)
 Values
   (1, '권한코드', '관리자', 'ROLE_ADMIN', 'admin', 
    TO_DATE('01/10/2019 23:19:40', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('01/10/2019 23:19:40', 'MM/DD/YYYY HH24:MI:SS'), 1, 1);
Insert into COMMON_CODE_DETAIL
   (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, DETAIL_NO)
 Values
   (1, '권한코드', '손님', 'ROLE_GUEST', 'admin', 
    TO_DATE('01/10/2019 23:19:40', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('01/10/2019 23:19:40', 'MM/DD/YYYY HH24:MI:SS'), 2, 2);
Insert into COMMON_CODE_DETAIL
   (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, DETAIL_NO)
 Values
   (1, '권한코드', '일반', 'ROLE_USER', 'admin', 
    TO_DATE('01/10/2019 23:19:40', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('01/10/2019 23:19:40', 'MM/DD/YYYY HH24:MI:SS'), 3, 3);
Insert into COMMON_CODE_DETAIL
   (CODE, CODE_NAME, VAR_CODE, VAR_NAME, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE, CODE_ORDER, DETAIL_NO)
 Values
   (2, '사용구분', '사용', 'Y', 'admin', 
    TO_DATE('12/14/2018 15:54:01', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('12/14/2018 15:54:01', 'MM/DD/YYYY HH24:MI:SS'), 1, 4);
COMMIT;




Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (3, 'ROLE_ADMIN', 10, 'AAB000', '로또', 
    'Y', 'Y', 'Y', 'admin', TO_DATE('01/10/2019 21:48:27', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (4, 'ROLE_ADMIN', 11, 'AAB001', '로또 번호 뽑기', 
    'Y', 'Y', 'Y', 'admin', TO_DATE('01/10/2019 21:48:27', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (6, 'ROLE_ADMIN', 3, 'ADM999', '관리자전용', 
    'Y', 'Y', 'Y', 'admin', TO_DATE('01/10/2019 21:48:27', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (5, 'ROLE_ADMIN', 4, 'ADM000', '통합관리', 
    'Y', 'Y', 'Y', 'admin', TO_DATE('01/10/2019 21:48:27', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (7, 'ROLE_GUEST', 1, 'BRD_AAA000', '알림', 
    'Y', 'N', 'N', 'admin', TO_DATE('01/10/2019 21:48:48', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (8, 'ROLE_GUEST', 2, 'BRD_AAA001', '공지사항', 
    'Y', 'N', 'N', 'admin', TO_DATE('01/10/2019 21:48:48', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (9, 'ROLE_GUEST', 10, 'AAB000', '로또', 
    'Y', 'N', 'N', 'admin', TO_DATE('01/10/2019 21:48:48', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (10, 'ROLE_GUEST', 11, 'AAB001', '로또 번호 뽑기', 
    'Y', 'N', 'N', 'admin', TO_DATE('01/10/2019 21:48:48', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (11, 'ROLE_USER', 1, 'BRD_AAA000', '알림', 
    'Y', 'N', 'N', 'admin', TO_DATE('01/10/2019 21:49:11', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (12, 'ROLE_USER', 2, 'BRD_AAA001', '공지사항', 
    'Y', 'N', 'N', 'admin', TO_DATE('01/10/2019 21:49:11', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (13, 'ROLE_USER', 10, 'AAB000', '로또', 
    'Y', 'N', 'N', 'admin', TO_DATE('01/10/2019 21:49:11', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (14, 'ROLE_USER', 11, 'AAB001', '로또 번호 뽑기', 
    'Y', 'N', 'N', 'admin', TO_DATE('01/10/2019 21:49:11', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (23, 'ROLE_ADMIN', 14, 'BRD_AAC000', '게시판', 
    'Y', 'Y', 'Y', 'admin', TO_DATE('02/07/2019 20:22:46', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (24, 'ROLE_ADMIN', 15, 'BRD_AAC001', '자유게시판', 
    'Y', 'Y', 'Y', 'admin', TO_DATE('02/07/2019 20:22:46', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (25, 'ROLE_GUEST', 14, 'BRD_AAC000', '게시판', 
    'Y', 'N', 'N', 'admin', TO_DATE('02/07/2019 20:23:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (2, 'ROLE_ADMIN', 2, 'BRD_AAA001', '공지사항', 
    'Y', 'Y', 'Y', 'admin', TO_DATE('01/10/2019 21:48:27', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (26, 'ROLE_GUEST', 15, 'BRD_AAC001', '자유게시판', 
    'Y', 'N', 'N', 'admin', TO_DATE('02/07/2019 20:23:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (27, 'ROLE_USER', 14, 'BRD_AAC000', '게시판', 
    'Y', 'N', 'N', 'admin', TO_DATE('02/07/2019 20:23:20', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (28, 'ROLE_USER', 15, 'BRD_AAC001', '자유게시판', 
    'Y', 'Y', 'Y', 'admin', TO_DATE('02/07/2019 20:23:20', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_GROUP
   (NO, ROLE_CHAR, MENU_NO, MENU_ID, MENU_NAME, 
    READ_GRANT, WRITE_GRANT, DELETE_GRANT, REG_ID, REG_DATE)
 Values
   (1, 'ROLE_ADMIN', 1, 'BRD_AAA000', '알림', 
    'Y', 'Y', 'Y', 'admin', TO_DATE('01/11/2019 09:44:32', 'MM/DD/YYYY HH24:MI:SS'));
COMMIT;



Insert into ROLE_MENU
   (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME, 
    MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE)
 Values
   (15, 300, 301, 'BRD_AAC001', '자유게시판', 
    '/brd/brdList.do', 1, 'Y', 'N', 'admin', 
    TO_DATE('02/07/2019 20:19:01', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('02/07/2019 20:20:52', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_MENU
   (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME, 
    SORT, USE_YN, ADMIN_YN, REG_ID, REG_DATE, 
    MOD_ID, MOD_DATE)
 Values
   (10, 0, 200, 'AAB000', '로또', 
    2, 'Y', 'N', 'admin', TO_DATE('01/02/2019 13:54:27', 'MM/DD/YYYY HH24:MI:SS'), 
    'admin', TO_DATE('02/07/2019 20:20:42', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_MENU
   (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME, 
    SORT, USE_YN, ADMIN_YN, REG_ID, REG_DATE, 
    MOD_ID, MOD_DATE)
 Values
   (1, 0, 100, 'BRD_AAA000', '알림', 
    0, 'Y', 'N', 'admin', TO_DATE('12/21/2018 11:30:38', 'MM/DD/YYYY HH24:MI:SS'), 
    'admin', TO_DATE('02/07/2019 20:20:42', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_MENU
   (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME, 
    MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE)
 Values
   (2, 100, 101, 'BRD_AAA001', '공지사항', 
    '/brd/brdList.do', 0, 'Y', 'N', 'admin', 
    TO_DATE('12/21/2018 11:30:38', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('02/07/2019 20:20:42', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_MENU
   (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME, 
    SORT, USE_YN, ADMIN_YN, REG_ID, REG_DATE, 
    MOD_ID, MOD_DATE)
 Values
   (3, 0, 9000, 'ADM999', '관리자전용', 
    999, 'Y', 'N', 'admin', TO_DATE('12/21/2018 11:30:38', 'MM/DD/YYYY HH24:MI:SS'), 
    'admin', TO_DATE('02/07/2019 20:20:42', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_MENU
   (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME, 
    MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE)
 Values
   (4, 9000, 9001, 'ADM000', '통합관리', 
    '/admin/adminMain.do', 1, 'Y', 'N', 'admin', 
    TO_DATE('12/21/2018 11:30:38', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('02/07/2019 20:20:42', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_MENU
   (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME, 
    MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE)
 Values
   (6, 0, 8002, 'ADM004', '메뉴관리', 
    '/admin/menuList.do', 4, 'Y', 'Y', 'admin', 
    TO_DATE('12/21/2018 11:30:38', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('12/21/2018 11:30:38', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_MENU
   (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME, 
    MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE)
 Values
   (7, 0, 8001, 'ADM003', '권한별메뉴관리', 
    '/admin/authMenuManager.do', 3, 'Y', 'Y', 'admin', 
    TO_DATE('12/21/2018 11:30:38', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('12/21/2018 11:30:38', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_MENU
   (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME, 
    MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE)
 Values
   (8, 0, 8000, 'ADM002', '사용자정보관리', 
    '/admin/member/memberInfo.do', 2, 'Y', 'Y', 'admin', 
    TO_DATE('12/21/2018 11:30:38', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('12/21/2018 11:30:38', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_MENU
   (NO, DEPTH_2, MENU_ID, MENU_NAME, SORT, 
    USE_YN, ADMIN_YN, REG_ID, REG_DATE, MOD_ID, 
    MOD_DATE)
 Values
   (0, 0, 'MAIN', '최상단', 0, 
    'Y', 'N', 'admin', TO_DATE('12/21/2018 11:30:38', 'MM/DD/YYYY HH24:MI:SS'), 'admin', 
    TO_DATE('12/21/2018 11:30:38', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_MENU
   (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME, 
    MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE)
 Values
   (9, 0, 8003, 'ADM001', '코드관리', 
    '/admin/codeManager.do', 1, 'Y', 'Y', 'admin', 
    TO_DATE('12/21/2018 11:30:38', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('12/21/2018 11:30:38', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_MENU
   (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME, 
    MENU_URL, SORT, USE_YN, ADMIN_YN, REG_ID, 
    REG_DATE, MOD_ID, MOD_DATE)
 Values
   (11, 200, 201, 'AAB001', '로또 번호 뽑기', 
    '/lotto_view.do', 1, 'Y', 'N', 'admin', 
    TO_DATE('01/02/2019 13:58:06', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('02/07/2019 20:20:42', 'MM/DD/YYYY HH24:MI:SS'));
Insert into ROLE_MENU
   (NO, DEPTH_1, DEPTH_2, MENU_ID, MENU_NAME, 
    SORT, USE_YN, ADMIN_YN, REG_ID, REG_DATE, 
    MOD_ID, MOD_DATE)
 Values
   (14, 0, 300, 'BRD_AAC000', '게시판', 
    1, 'Y', 'N', 'admin', TO_DATE('02/07/2019 20:18:39', 'MM/DD/YYYY HH24:MI:SS'), 
    'admin', TO_DATE('02/07/2019 20:20:42', 'MM/DD/YYYY HH24:MI:SS'));
COMMIT;
