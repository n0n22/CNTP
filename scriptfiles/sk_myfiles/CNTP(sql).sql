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
      JOIN MEMBER USING(MEM_NO)  
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
       ,TO_CHAR(MAX(COMPLETION_DATE), 'YYYY-MM-DD') "COMPLETION_DATE"
FROM REPORT "R"
JOIN 
   (SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
      FROM BOARD
      JOIN MEMBER USING(MEM_NO)  
    ) "B" ON (B.BOARD_NO = R.BOARD_NO)
WHERE REPORT_RESULT = 'O'
GROUP BY MEM_NO, MEM_ID
HAVING COUNT(*) >= 5;



   SELECT MEM_ID, MEM_NO, NICKNAME, BOARD_NO, TITLE, CONTENT
      FROM BOARD
      JOIN MEMBER USING(MEM_NO)
      LEFT JOIN PENALTY USING(MEM_NO);
      WHERE END_DATE < SYSDATE;




       
       