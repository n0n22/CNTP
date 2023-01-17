SELECT 
       R.REPORT_NO, 
       R.REPORT_BOARD,
       R.BOARD_NO,      
       R.REPORTER,
       TO_CHAR(R.REPORT_DATE, 'YYYY-MM-DD') "REPORT_DATE",
       R.REPORT_RESULT,
       TO_CHAR(R.COMPLETION_DATE, 'YYYY-MM-DD') "COMPLETION_DATE",   
       B.MEM_NO, 
       B.MEM_ID,
       B.CONTENT,
       M.MEM_ID "REPORTER_ID" 
  FROM
       REPORT "R"
  JOIN
       (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
          FROM BOARD
          JOIN MEMBER USING(MEM_NO)) "B" ON (B.BOARD_NO = R.BOARD_NO)
  JOIN
       MEMBER "M" ON(M.MEM_NO = R.REPORTER)
 WHERE
       REPORT_NO = 5;
       
       
       COMMIT;
       
ALTER TABLE REPORT DROP COLUMN MEM_NO;       

dropse


SELECT
       R.REPORT_NO
       ,B.MEM_NO
       ,B.MEM_ID
       ,R.BOARD_NO
       ,R.REPORT_BOARD
       ,R.REPORT_REASON
       ,R.REPORTER
       ,M.MEM_ID "REPORTER_ID"
       ,TO_CHAR(R.REPORT_DATE, 'YYYY-MM-DD') "REPORT_DATE"
       ,R.REPORT_RESULT
       ,TO_CHAR(R.COMPLETION_DATE, 'YYYY-MM-DD') "COMPLETION_DATE"
  FROM
       REPORT "R"
  JOIN
       (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
          FROM BOARD
          JOIN MEMBER USING(MEM_NO)) "B" ON (B.BOARD_NO = R.BOARD_NO)
  JOIN
       MEMBER "M" ON(M.MEM_NO = R.REPORTER)
 WHERE
       REPORT_RESULT is null
 ORDER
    BY
       REPORT_NO ASC;

COMMIT;




		SELECT 
		       R.REPORT_NO
		       ,R.REPORT_BOARD
		       ,R.BOARD_NO      
		       ,R.REPORTER
		       ,R.REPORT_REASON
		       ,TO_CHAR(R.REPORT_DATE, 'YYYY-MM-DD') "REPORT_DATE"
		       ,R.REPORT_RESULT
		       ,TO_CHAR(R.COMPLETION_DATE, 'YYYY-MM-DD') "COMPLETION_DATE"  
		       ,B.MEM_NO
		       ,B.MEM_ID
		       ,B.CONTENT
		       ,M.MEM_ID "REPORTER_ID" 
		  FROM
		       REPORT "R"
		  JOIN
		       (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
		          FROM BOARD
		          JOIN MEMBER USING(MEM_NO)) "B" ON (B.BOARD_NO = R.BOARD_NO)
		  JOIN
		       MEMBER "M" ON(M.MEM_NO = R.REPORTER)
		 WHERE
		       REPORT_NO = 5;


-- ±×·ìÇÕ : ½Å°í È®Á¤ÀÌ 5 ÀÌ»óÀÎ »ç¶÷µéÀÇ ´©Àû ½Å°í¼ö¿Í È¸¿ø¹øÈ£
SELECT MEM_NO
       ,MEM_ID
       ,COUNT(*)
       ,MAX(COMPLETION_DATE) "COMPLETION_DATE"
FROM REPORT "R"
JOIN 
   (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
      FROM BOARD
      JOIN MEMBER USING(MEM_NO)  
    ) "B" ON (B.BOARD_NO = R.BOARD_NO)
WHERE REPORT_RESULT = 'O'
GROUP BY MEM_NO, MEM_ID
HAVING COUNT(*) > 5;


-- ÃÖÁ¾½Å°íÃ³¸®ÀÏ
SELECT COMPLETION_DATE, MEM_NO
  FROM REPORT "R"
  JOIN 
       (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
          FROM BOARD
          JOIN MEMBER USING(MEM_NO)  
        ) "B" ON (B.BOARD_NO = R.BOARD_NO)
  WHERE REPORT_RESULT = 'O'
ORDER BY COMPLETION_DATE DESC;

SELECT *
FROM
(
SELECT COMPLETION_DATE
  FROM REPORT
  WHERE REPORT_RESULT = 'O'
ORDER BY COMPLETION_DATE DESC
)
WHERE ROWNUM = 1;




SELECT MEM_NO, COMPLETION_DATE
  FROM REPORT "R"
  JOIN 
       (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
          FROM BOARD
          JOIN MEMBER USING(MEM_NO)  
        ) "B" ON (B.BOARD_NO = R.BOARD_NO);
        
        
        
        
        


----------------------------------------------------------------------------------
SELECT MEM_NO
       ,MEM_ID
       ,COUNT(*) "COUNT",
       CASE WHEN COUNT(*) >= 10 THEN 'Å»Åð'
            WHEN COUNT(*) >= 5  THEN 'Á¤Áö'
       END "PENALTY"
       ,TO_CHAR(MAX(COMPLETION_DATE), 'YYYY-MM-DD') "COMPLETION_DATE"
FROM REPORT "R"
JOIN 
   (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
      FROM BOARD
      JOIN MEMBER "M" USING(MEM_NO) 
    ) "B" ON (B.BOARD_NO = R.BOARD_NO)
WHERE REPORT_RESULT = 'O'
GROUP BY MEM_NO, MEM_ID
HAVING COUNT(*) >= 5;
-------------------------------------------------------------------------------


       ,DECODE(COUNT(*), 5<=COUNT(*)< 10, 'Á¤Áö', 10<=COUNT(*), 'Å»Åð') "";;;;


SELECT MEM_NO
               ,MEM_ID
               ,COUNT(*)
               ,MAX(COMPLETION_DATE) "COMPLETION_DATE",
       CASE WHEN COUNT(*) >= 10 THEN 'Å»Åð'
            WHEN COUNT(*) >= 5  THEN 'Á¤Áö'
       END "FENALTY"
FROM
        (SELECT MEM_NO
               ,MEM_ID
               ,COUNT(*)
               ,MAX(COMPLETION_DATE) "COMPLETION_DATE"
        FROM REPORT "R"
        JOIN 
           (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
              FROM BOARD
              JOIN MEMBER USING(MEM_NO)  
            ) "B" ON (B.BOARD_NO = R.BOARD_NO)
        WHERE REPORT_RESULT = 'O'
        GROUP BY MEM_NO, MEM_ID
        HAVING COUNT(*) >= 5);



SELECT B.MEM_NO
       ,COUNT(*) "STACK",
       CASE WHEN COUNT(*) >= 10 THEN 'Å»Åð'
            WHEN COUNT(*) >= 5  THEN 'Á¤Áö'
       END "FENALTY"
       ,MAX(COMPLETION_DATE) "COMPLETION_DATE"
FROM REPORT "R"
JOIN BOARD "B" ON (R.BOARD_NO = R.BOARD_NO)
JOIN MEMBER "M" ON (B.MEM_NO = M.MEM_NO)
WHERE REPORT_RESULT = 'O'
GROUP BY B.MEM_NO
HAVING COUNT(*) >= 5;



   (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
      FROM BOARD
      JOIN MEMBER USING(MEM_NO)  
    ) "B" ON (B.BOARD_NO = R.BOARD_NO);



SELECT
       COUNT(*)
  FROM
       (
SELECT
       A.MEM_NO,
       A.MEM_ID,
       COUNT,
       PENALTY,
       COMPLETION_DATE
  FROM
       (
               SELECT MEM_NO
                       ,MEM_ID
                       ,COUNT(*) "COUNT",
                       CASE WHEN COUNT(*) >= 10 THEN 'Å»Åð'
                            WHEN COUNT(*) >= 5  THEN 'Á¤Áö'
                       END "PENALTY"
                       ,TO_CHAR(MAX(COMPLETION_DATE), 'YYYY-MM-DD') "COMPLETION_DATE"
                FROM REPORT "R"
                JOIN 
                   (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
                      FROM BOARD
                      JOIN MEMBER USING(MEM_NO)  
                    ) "B" ON (B.BOARD_NO = R.BOARD_NO)
                WHERE REPORT_RESULT = 'O'
                GROUP BY MEM_NO, MEM_ID
                HAVING COUNT(*) >= 5
                ) "A"
         JOIN
              PENALTY "P" ON (A.MEM_NO = P.MEM_NO)
         WHERE
               END_DATE < SYSDATE
       );


insert into penalty values (11, sysdate + 7);
COMMIT;



SELECT
       *
  FROM
       (
       SELECT MEM_NO
               ,MEM_ID
               ,COUNT(*) "COUNT",
               CASE WHEN COUNT(*) >= 10 THEN 'Å»Åð'
                    WHEN COUNT(*) >= 5  THEN 'Á¤Áö'
               END "PENALTY"
               ,TO_CHAR(MAX(COMPLETION_DATE), 'YYYY-MM-DD') "COMPLETION_DATE"
        FROM REPORT "R"
        JOIN 
           (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
              FROM BOARD
              JOIN MEMBER USING(MEM_NO)  
            ) "B" ON (B.BOARD_NO = R.BOARD_NO)
        WHERE REPORT_RESULT = 'O'
        GROUP BY MEM_NO, MEM_ID
        HAVING COUNT(*) >= 5
        ) "A"
  LEFT JOIN
      PENALTY "P" ON (A.MEM_NO = P.MEM_NO)
 WHERE
       END_DATE  SYSDATE;
      




COMMIT;






SELECT MEM_NO
       ,MEM_ID
       ,COUNT(*) "COUNT",
       CASE WHEN COUNT(*) >= 10 THEN 'Å»Åð'
            WHEN COUNT(*) >= 5  THEN 'Á¤Áö'
       END "PENALTY"
       ,TO_CHAR(MAX(R.COMPLETION_DATE), 'YYYY-MM-DD') "COMPLETION_DATE"
FROM REPORT "R"
JOIN 
   (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
      FROM BOARD
      JOIN MEMBER USING(MEM_NO)
      WHERE STATUS = 'Y'
    ) "B" ON (B.BOARD_NO = R.BOARD_NO)
WHERE REPORT_RESULT = 'O'
GROUP BY MEM_NO, MEM_ID
HAVING COUNT(*) >= 5;

commit;

   SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
      FROM BOARD
      JOIN MEMBER USING(MEM_NO)
      LEFT JOIN PENALTY USING(MEM_NO);
      WHERE END_DATE < SYSDATE;

SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
      FROM BOARD
      JOIN MEMBER USING(MEM_NO)
     WHERE STATUS = 'Y';


SELECT MEM_NO
  FROM
       (SELECT
               *
          FROM
               TEAM_MEMBER
         WHERE  
               TEAM_NO = (
		                  SELECT TEAM_NO
		                    FROM TEAM_MEMBER
		                   WHERE MEM_NO = 21
		                 )
           AND 
               TEAM_GRADE != 'L'
         ORDER 
            BY TEAM_GRADE DESC, TEAM_ENROLL_DATE)
 WHERE ROWNUM = 1;
    -- ¾Æ¹«°Íµµ Á¶È¸ X
    -- ºÎ¸®´õ
    -- °¡ÀÔÀÏ °¡Àå ºü¸¥ »ç¶÷
    
    
SELECT
       COUNT(*)
  FROM
       TEAM_MEMBER
 WHERE
       MEM_NO = 20;
    
    
    
    
    
SELECT MEM_NO
       ,MEM_ID
       ,COUNT(*) "COUNT",
       CASE WHEN COUNT(*) >= 10 THEN 'Å»Åð'
            WHEN COUNT(*) >= 5  THEN 'Á¤Áö'
       END "PENALTY"
       ,TO_CHAR(MAX(COMPLETION_DATE), 'YYYY-MM-DD') "COMPLETION_DATE"
FROM REPORT "R"
JOIN 
   (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
      FROM BOARD
      JOIN MEMBER "M" USING(MEM_NO) 
    ) "B" ON (B.BOARD_NO = R.BOARD_NO)
WHERE REPORT_RESULT = 'O'
GROUP BY MEM_NO, MEM_ID
HAVING COUNT(*) >= 5;

commit;




   SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT, MEM_STATUS
      FROM BOARD
      JOIN MEMBER USING(MEM_NO);


		SELECT
		       *
		  FROM
		       TEAM_MEMBER
		 WHERE
		       MEM_NO = 3;




		SELECT
		       COUNT(*)
		  FROM
		       (
		SELECT
		       A.MEM_NO,
		       A.MEM_ID,
		       COUNT,
		       PENALTY,
		       COMPLETION_DATE
		  FROM
		       (
		               SELECT MEM_NO
		                       ,MEM_ID
		                       ,COUNT(*) "COUNT",
		                       CASE WHEN COUNT(*) >= 10 THEN 'Å»Åð'
		                            WHEN COUNT(*) >= 5  THEN 'Á¤Áö'
		                       END "PENALTY"
		                       ,TO_CHAR(MAX(COMPLETION_DATE), 'YYYY-MM-DD') "COMPLETION_DATE"
		                FROM REPORT "R"
		                JOIN 
		                   (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
		                      FROM BOARD
		                      JOIN MEMBER USING(MEM_NO)
                             WHERE MEM_STATUS != 'K'
		                    ) "B" ON (B.BOARD_NO = R.BOARD_NO)
		                WHERE REPORT_RESULT = 'O'
		                GROUP BY MEM_NO, MEM_ID
		                HAVING COUNT(*) >= 5
		                ) "A"
		         JOIN
		              PENALTY "P" ON (A.MEM_NO = P.MEM_NO)
		         WHERE
		               END_DATE < SYSDATE
		       );


		SELECT
		       R.REPORT_NO
		       ,B.MEM_NO
		       ,B.MEM_ID
		       ,R.BOARD_NO
		       ,R.REPORT_BOARD
		       ,R.REPORT_REASON
		       ,R.REPORTER
		       ,M.MEM_ID "REPORTER_ID"
		       ,TO_CHAR(R.REPORT_DATE, 'YYYY-MM-DD') "REPORT_DATE"
		       ,R.REPORT_RESULT
		       ,TO_CHAR(R.COMPLETION_DATE, 'YYYY-MM-DD') "COMPLETION_DATE"
		  FROM
		       REPORT "R"
		  JOIN
		       (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
		          FROM BOARD
		          JOIN MEMBER USING(MEM_NO)) "B" ON (B.BOARD_NO = R.BOARD_NO)
		  JOIN
		       MEMBER "M" ON(M.MEM_NO = R.REPORTER)
		 WHERE
		       REPORT_RESULT is null
		 ORDER
            BY
               REPORT_NO ASC;

commit;




                SELECT MEM_ID, MEM_NO, NICKNAME, COMMENT_NO, COMMENT_CONTENT
		          FROM BOARD_REPLY
		          JOIN MEMBER ON(MEM_NO = WRITER);




SELECT
		       R.REPORT_NO
		       ,B.MEM_NO
		       ,B.MEM_ID
		       ,R.BOARD_NO
		       ,R.REPORT_BOARD
		       ,R.REPORT_REASON
		       ,R.REPORTER
		       ,M.MEM_ID "REPORTER_ID"
		       ,TO_CHAR(R.REPORT_DATE, 'YYYY-MM-DD') "REPORT_DATE"
		       ,R.REPORT_RESULT
		       ,TO_CHAR(R.COMPLETION_DATE, 'YYYY-MM-DD') "COMPLETION_DATE"
		  FROM
		       REPORT "R"
		  JOIN
		       (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
		          FROM BOARD
		          JOIN MEMBER USING(MEM_NO)) "B" ON (B.BOARD_NO = R.BOARD_NO)
		  JOIN
		       MEMBER "M" ON(M.MEM_NO = R.REPORTER)
		 WHERE
		       REPORT_RESULT is null
        AND REPORT_BOARD = 'board'
UNION

		SELECT
		       R.REPORT_NO
		       ,C.MEM_NO
		       ,C.MEM_ID
		       ,R.BOARD_NO
		       ,R.REPORT_BOARD
		       ,R.REPORT_REASON
		       ,R.REPORTER
		       ,M.MEM_ID "REPORTER_ID"
		       ,TO_CHAR(R.REPORT_DATE, 'YYYY-MM-DD') "REPORT_DATE"
		       ,R.REPORT_RESULT
		       ,TO_CHAR(R.COMPLETION_DATE, 'YYYY-MM-DD') "COMPLETION_DATE"
		  FROM
		       REPORT "R"
		  JOIN
		       (SELECT MEM_ID, MEM_NO, NICKNAME, COMMENT_NO, COMMENT_CONTENT
		          FROM BOARD_REPLY
		          JOIN MEMBER ON(MEM_NO = WRITER)) "C" ON (C.COMMENT_NO = R.BOARD_NO)
		  JOIN
		       MEMBER "M" ON(M.MEM_NO = R.REPORTER)
		 WHERE
		       REPORT_RESULT is null
           AND REPORT_BOARD = 'board_reply'
           
           order by report_date asc;



		SELECT 
		       R.REPORT_NO
		       ,R.REPORT_BOARD
		       ,R.BOARD_NO      
		       ,R.REPORTER
		       ,R.REPORT_REASON
		       ,TO_CHAR(R.REPORT_DATE, 'YYYY-MM-DD') "REPORT_DATE"
		       ,R.REPORT_RESULT
		       ,TO_CHAR(R.COMPLETION_DATE, 'YYYY-MM-DD') "COMPLETION_DATE" 
		       ,C.MEM_NO 
		       ,C.MEM_ID
		       ,DECODE(, 'board', B.CONTENT, 'board-reply', C.CONTENT) "CONTENT"
		       ,M.MEM_ID "REPORTER_ID" 
		  FROM
		       REPORT "R"
		  JOIN
		       (SELECT MEM_ID, MEM_NO, NICKNAME, COMMENT_NO, COMMENT_CONTENT "CONTENT"
		          FROM BOARD_REPLY
		          JOIN MEMBER ON(MEM_NO = WRITER)) "C" ON (C.COMMENT_NO = R.BOARD_NO)
          JOIN
		       (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, CONTENT
		          FROM BOARD
		          JOIN MEMBER USING(MEM_NO)) "B" ON (B.BOARD_NO = R.BOARD_NO)
		  JOIN
		       MEMBER "M" ON(M.MEM_NO = R.REPORTER)
		 WHERE
		       REPORT_NO = 30;






-------------------------------------------------------------------------
               

		SELECT
		       R.REPORT_NO
		       ,MEM_NO
		       ,MEM_ID
		       ,R.BOARD_NO
		       ,R.REPORT_BOARD
		       ,R.REPORT_REASON
		       ,R.REPORTER
		       ,M.MEM_ID "REPORTER_ID"
		       ,TO_CHAR(R.REPORT_DATE, 'YYYY-MM-DD') "REPORT_DATE"
		       ,R.REPORT_RESULT
		       ,TO_CHAR(R.COMPLETION_DATE, 'YYYY-MM-DD') "COMPLETION_DATE"
		  FROM
		       REPORT "R"
		  JOIN
		       (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
		          FROM BOARD
		          JOIN MEMBER USING(MEM_NO)) "B" ON (B.BOARD_NO = R.BOARD_NO)
		  JOIN
		       (SELECT MEM_ID, MEM_NO, NICKNAME, COMMENT_NO, COMMENT_CONTENT "CONTENT"
		          FROM BOARD_REPLY
		          JOIN MEMBER ON(MEM_NO = WRITER)) "C" ON (C.COMMENT_NO = R.BOARD_NO)
		  JOIN
		       MEMBER "M" ON(M.MEM_NO = R.REPORTER)
		 WHERE
		       REPORT_RESULT

			   is null

		 ORDER
            BY
               REPORT_NO ASC;





select count(*)
from report
where report_board = 'board_reply'
and reporter = 1
and board_no = 5;


       