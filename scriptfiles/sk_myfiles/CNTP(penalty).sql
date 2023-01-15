SELECT
       COUNT(*)
  FROM 
       PENALTY
 WHERE
       MEM_NO = 5;
       
UPDATE
       PENALTY
   SET
       END_DATE = SYSDATE + 7
 WHERE 
       MEM_NO = 2;
       
       COMMIT;
       
       
       
SELECT
       TEAM_NO
       ,TEAM_GRADE
       ,MEM_NO
       TEAM_ENROLL_DATE
  FROM
       TEAM_MEMBER
 WHERE
       TEAM_NO = (
                  SELECT TEAM_NO
                    FROM TEAM_MEMBER
                   WHERE MEM_NO = 1
                 );