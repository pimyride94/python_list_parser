

%{
#include <stdio.h>
#include <stdlib.h>

int cont=0;  
void yyerror(char *c);
int yylex(void);
%}

%token WORD OPENB CLOSEB SEP SPACE EOL

%%
end:	
		expression EOL {printf("OK\n");}

info:	/* empty */
		| WORD
		| info SEP SPACE info
		|
		;
		
expression:
		OPENB info CLOSEB
		| info SEP SPACE expression
		| OPENB expression CLOSEB
		;

%%

void yyerror(char *s) {
	printf("ERRO\n");
}

int main() {
  yyparse();
    return 0;

}
