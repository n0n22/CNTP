----------------------- �������� insert --------------------------------
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
        
        
----------------------- �������� select --------------------------------
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
    
       
----------------------- �������� UPDATE ------------------------------      
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

        
----------------------- ��� insert -----------------------------       

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

  
----------------------- ��� update (����) -----------------------------         
        
UPDATE
       BANNER
   SET
       (
       STATUS = #{status}
       )


----------------------- ��� select ---------------------------

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



----------------------- �Ű� INSERT (������) ---------------------------
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
       
-- �Խñ��� �Ű���ߴ��� �˱� ���ؼ� �Խñ��� ���¸� �ٲܷ���
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
        
       
----------------------- �Ű� update ó���Ҷ� ---------------------------       
       
-- �Ű� ��ҽ�

-- �Խñ� ���� ���·� ������Ʈ
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

-- �Ű� ���� öȸ�� ������Ʈ
UPDATE
       REPORT
   SET
       (
       COMPLETION_DATE = SYSDATE,
       REPORT_RESULT = 'X'
       )
 WHERE
       REPORT_NO = #{reportNo}

-- �Ű� Ȯ����

-- �Ű� ���� Ȯ������ ������Ʈ
UPDATE
       REPORT
   SET
       (
       COMPLETION_DATE = SYSDATE,
       REPORT_RESULT = 'O'
       )
 WHERE
       REPORT_NO = #{reportNo}


-- �Ű� ���� ��ȸ
SELECT
       REPORT
       (
       RE
       )




----------------------- �Ű� ��ȸ ---------------------------

-- �Ű� ��� ��ȸ
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

-- �Ű� ���� ��ȸ
SELECT
       REPORT_NO,
       MEM_NO,
       MEM_ID,
       REPORT_BOARD,
       MEM_ID "REPORTER",
       REPORT_DATE,
       REPORT_REASON,
       ��ȣ,
       ����
  FROM
       REPORT 
  JOIN
       MEMBER ON (MEM_NO = REPORTER)
  JOIN
       #{reportBoard} USING (��ȣ)
 ORDER
    BY
       REPORT_NO DESC;



----------------------- �г�Ƽ ��ȸ ---------------------------

-- �г�Ƽ ��� ȸ�� ��� ��ȸ
SELECT
       MEM_NO,
       MEM_ID,
       COUNT(*),
       COMPLETION_DATE
  FROM


-- �Ű� Ƚ�� ��ȸ
SELECT
       MEM_NO,
       MEM_ID,
       COUNT(*)
  FROM
       MEMBER
 GROUP
    BY
       MEM_NO, MEM_ID;

-- �Ű� Ƚ���� 5�̻��� ����� ��ȣ�� ī��Ʈ ��ȸ
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

-- �Ű� Ƚ���� 5�̻��� ����� ���� ��ȸ
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
   
        









        
        
        
        