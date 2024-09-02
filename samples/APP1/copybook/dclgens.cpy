      ******************************************************************
      * DCLGEN TABLE(STUDENT)                                          *
      *        LIBRARY(ADCDF.SOURCE.DB2(DCLGENS))                      *
      *        LANGUAGE(COBOL)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE STUDENT TABLE
           ( STUDID                         CHAR(5),
             STUDNAME                       CHAR(10),
             DEPARTMENT                     CHAR(10)
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE STUDENT                            *
      ******************************************************************
       01  DCLSTUDENT.
           10 STUDID               PIC X(5).
           10 STUDNAME             PIC X(10).
           10 DEPARTMENT           PIC X(10).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 3       *
      ******************************************************************
