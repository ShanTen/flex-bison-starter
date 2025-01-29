all:
	win_bison -t -d -v parser.y
	win_flex something.l
	gcc lex.yy.c parser.tab.c -o scanner.exe 