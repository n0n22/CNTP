----------------------- 공지사항 insert --------------------------------
INSERT
  INTO
       NOTICE
       (
       NOTICE_NO,
       CATEGORY,
       TITLE,
       CONTENT,
       MEM_NO,
       CREATE_DATE,
       ORIGIN_NAME,
       CHANGE_NAME,
       )
 VALUES
        (
        SEQ_NNO.NEXTVAL,
        #{category},
        #{title},
        #{content},
        SYSDATE,
        #{originName},
        #{changeName},
        )
        
        
----------------------- 공지사항 select --------------------------------
SELECT
       NOTICE_NO,
       CATEGORY,
       TITLE,
       CONTENT,
       CREATE_DATE,
       NICNAME,
       ORIGIN_NAME,
       CHANGE_NAME,
       STATUS
  FROM
       NOTICE
  JOIN
       MEMBER ON(WRITER = MEM_NO)
 WHERE
       STATUS = 'Y'
 ORDER
    BY
       NOTICE_NO DESC
    
       
----------------------- 공지사항 UPDATE ------------------------------      
UPDATE
       NOTICE
   SET
       (
       CATEGORY = #{category},
       TITLE = #{title},
       CONTENT = #{content},
       ORIGIN_NAME = #{originName},
       CHANGE_NAME = #{changeName}
       )
 WHERE
       NOTICE_NO = #{noticeNo}
   AND
       STATUS = 'N'

        
----------------------- 배너 insert -----------------------------       

INSERT
  INTO
       BANNER
       (
       BANNER_NO,
       CREATE_DATE,
       ORIGIN_NAME,
       CHANGE_NAME,
       STATS
       )
VALUES
       (
       SEQ_BNO,
       SYSDATE,
       'N',
       #{originName},
       #{changeName},
       'Y'
       )

  
----------------------- 배너 update (숨김) -----------------------------         
        
UPDATE
       BANNER
   SET
       (
       STATUS = #{status}
       )


----------------------- 배너 select ---------------------------

SELECT
       BANNER_NO,
       CREATE_DATE,
       ORIGIN_NAME,
       CHANGE_NAME,
       STATS
  FROM
       BANNER
 WHERE
       STATUS = 'Y'
 ORDER
    BY
       BANNER_NO DESC



----------------------- 신고 INSERT (유저가) ---------------------------
INSERT
  INTO
       REPORT
       (
       REPORT_NO,
       MEM_NO,
       REPORT_BOARD,
       REPORTER,
       REPORT_DATE,
       REPORT_REASON,
       BOARD_NO
       )
VALUES
       (
       SEQ_RNO,
       #{memNo},
       #{report_board},
       #{reporter},
       SYSDATE,
       #{reportReason},
       #{boardNo}
       )
       
-- 게시글이 신고당했는지 알기 위해서 게시글의 상태를 바꿀려면
UPDATE
       BOARD
   SET
       (
       STATUS = 'R'
       )
 WHERE
       BOARD_NO = #{boardNo}
   AND
       STATUS = 'Y'
        
       
----------------------- 신고 update 처리할때 ---------------------------       
       
-- 신고 취소시

-- 게시글 정상 상태로 업데이트
UPDATE
       BOARD
   SET
       (
       STATUS = 'Y'
       )
 WHERE
       BOARD_NO = #{boardNo}
   AND
       STATUS = 'R'

-- 신고 내역 철회로 업데이트
UPDATE
       REPORT
   SET
       (
       COMPLETION_DATE = SYSDATE,
       REPORT_RESULT = 'X'
       )
 WHERE
       REPORT_NO = #{reportNo}

-- 신고 확정시

-- 신고 내역 확정으로 업데이트
UPDATE
       REPORT
   SET
       (
       COMPLETION_DATE = SYSDATE,
       REPORT_RESULT = 'O'
       )
 WHERE
       REPORT_NO = #{reportNo}


-- 신고 내역 조회
SELECT
       REPORT
       (
       RE
       )




----------------------- 신고 조회 ---------------------------

-- 신고 목록 조회
SELECT
       REPORT_NO,
       MEM_NO,
       MEM_ID,
       REPORT_BOARD,
       MEM_ID "REPORTER",
       REPORT_DATE,
       REPORT_REASON,
       BOARD_NO
  FROM
       REPORT
  JOIN
       MEMBER USING (MEM_NO)
 ORDER
    BY
       REPORT_NO DESC;

-- 신고 내용 조회
SELECT
       REPORT_NO,
       MEM_NO,
       MEM_ID,
       REPORT_BOARD,
       MEM_ID "REPORTER",
       REPORT_DATE,
       REPORT_REASON,
       번호,
       내용
  FROM
       REPORT 
  JOIN
       MEMBER ON (MEM_NO = REPORTER)
  JOIN
       #{reportBoard} USING (번호)
 ORDER
    BY
       REPORT_NO DESC;



----------------------- 패널티 조회 ---------------------------

-- 패널티 대상 회원 목록 조회
SELECT
       MEM_NO,
       MEM_ID,
       COUNT(*),
       COMPLETION_DATE
  FROM


-- 신고 횟수 조회
SELECT
       MEM_NO,
       MEM_ID,
       COUNT(*)
  FROM
       MEMBER
 GROUP
    BY
       MEM_NO, MEM_ID;

-- 신고 횟수가 5이상인 사람들 번호와 카운트 조회
SELECT
       MEM_NO,
       COUNT(*)
  FROM
       MEMBER
 WHERE
       STATUS = 'Y' 
 GROUP
    BY
       MEM_NO
HAVING
       COUNT(*) >= 5

-- 신고 횟수가 5이상인 사람들 정보 조회
SELECT
       MEM_NO,
       MEM_ID,
       COUNT(*)
  FROM
       MEMBER
  JOIN
       
 WHERE
       MEM_NO IN ( 
                    SELECT
                           MEM_NO,
                           COUNT(*)
                      FROM
                           MEMBER
                     WHERE
                           STATUS = 'Y' 
                     GROUP
                        BY
                           MEM_NO
                    HAVING
                           COUNT(*) >= 5
                    )
   
        









        
        
        
        