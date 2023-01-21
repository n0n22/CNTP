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
        ,TEAM_ENROLL_DATE
  FROM
       TEAM_MEMBER
 WHERE
       TEAM_NO = (
                  SELECT TEAM_NO
                    FROM TEAM_MEMBER
                   WHERE MEM_NO = 3
                 )
            ;
                 
select
       mem_no
from
      team_member
where
       TEAM_NO = (
                  SELECT TEAM_NO
                    FROM TEAM_MEMBER
                   WHERE MEM_NO = 6
                 )
                 
   and tea_enroll_date =      
   
   (
   
   ;
   SELECT
        
       max(TEAM_ENROLL_DATE)
  FROM
       TEAM_MEMBER
 WHERE
       TEAM_NO = (
                  SELECT TEAM_NO
                    FROM TEAM_MEMBER
                   WHERE MEM_NO = 6
                 );
   
   
   
   
   
   )
                 ;
      
      
      
  SELECT
        TEAM_NO
        ,TEAM_GRADE
        ,MEM_NO
        ,TEAM_ENROLL_DATE
  FROM
       TEAM_MEMBER
 WHERE
       TEAM_NO = (
                  SELECT TEAM_NO
                    FROM TEAM_MEMBER
                   WHERE MEM_NO = 6
                 )
    and team_grade = 'M'
            ;    
      
      
SELECT
       TEAM_NO
       ,TEAM_GRADE
       ,MEM_NO
       ,TEAM_ENROLL_DATE
  FROM
       TEAM_MEMBER
 WHERE
       MEM_NO = 6
   AND
       TEAM_GRADE = 'L'
            ;          
 
 
DELETE
  FROM
       TEAM_MEMBER
 WHERE
       MEM_NO = ?;
      
      
      
      
      
      
      
select
       team_no
from
     team_member
where mem_no = 6;
      
      
      
                 
                 