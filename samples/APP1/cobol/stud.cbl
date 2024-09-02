       IDENTIFICATION DIVISION.
       PROGRAM-ID. STUD.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
                SELECT EMPFIL ASSIGN TO EMPFILE
                ORGANIZATION IS SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD EMPFIL
            RECORDING MODE IS F.
       01 FL-REC.
          05 STUD-ID    PIC X(05).
          05 FILLER    PIC X(75).
       WORKING-STORAGE SECTION.
       01 WS-FL-REC.
          05 FL-STUD-ID PIC X(05).
          05 FILLER    PIC X(75).


       01 WS-EOF    PIC A VALUE SPACE.

            EXEC SQL
               INCLUDE SQLCA
            END-EXEC.

            EXEC SQL
               INCLUDE DCLGENS
            END-EXEC.

       01  DCLSTUDENT.
           10 WS-STUD-ID               PIC X(05).
           10 WS-STUD-NAME             PIC X(30).
           10 WS-STUD-DEPT             PIC X(10).

       PROCEDURE DIVISION.

            OPEN INPUT EMPFIL.

            PERFORM UNTIL WS-EOF = 'Y'

               READ EMPFIL INTO WS-FL-REC
                 AT END MOVE 'Y' TO WS-EOF
                 NOT AT END PERFORM A000-WRITE-PARA
               END-READ

            END-PERFORM.

            CLOSE EMPFIL.
            GOBACK.

       A000-WRITE-PARA.

             DISPLAY ' HERE'
             MOVE FL-STUD-ID TO WS-STUD-ID
             DISPLAY FL-STUD-ID
             DISPLAY WS-STUD-ID

             EXEC SQL
                  SELECT  STUDID, STUDNAME, DEPARTMENT
                    INTO  :WS-STUD-ID, :WS-STUD-NAME, :WS-STUD-DEPT
                 FROM STUDENT
                 WHERE STUDID = :WS-STUD-ID
             END-EXEC.


             EVALUATE SQLCODE
             WHEN 100
                  DISPLAY 'NO SUCH RECORD FOUND'
                  MOVE +12  TO RETURN-CODE
             WHEN 0
                  DISPLAY 'STUD-ID: ' WS-STUD-ID
                  DISPLAY 'STUD-NAME: ' WS-STUD-NAME
                  MOVE 0    TO RETURN-CODE
             WHEN OTHER
                  DISPLAY SQLCODE
             END-EVALUATE.
