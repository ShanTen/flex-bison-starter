all:
	win_flex something.l
	gcc -o scanner.exe lex.yy.c