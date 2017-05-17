/* Generated Code (IMPORT) */
/* Source File: iris.csv */
/* Source Path: /folders/myfolders */
/* Code generated on: 5/5/17, 3:07 PM */

%web_drop_table(WORK.IRIS);


FILENAME REFFILE '/folders/myfolders/iris.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IRIS;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IRIS; RUN;


%web_open_table(WORK.IMPORT);