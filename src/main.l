
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}
	

%%

\"?[A-Z0-9]+\"? return WORD;

"["				return OPENB;

"]" 			return CLOSEB;

"," 			return SEP;

[' '] 			return SPACE;

['\n'] 			return EOL;

. 				yyerror("Unknown character");


%%

int yywrap() {
  return 1;
}
