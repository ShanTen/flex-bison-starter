all:
	win_bison -t -d -v parser.y
	win_flex something.l
	gcc -o scanner.exe lex.yy.c