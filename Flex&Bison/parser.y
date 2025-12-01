%{
    #include <stdio.h>
    int yylex(void);
    int yyerror(const char *s);
    extern FILE *yyin;
%}

%union {
    float fnum;
}

/* Tokens */
%token EOL
%token<fnum> NUMBER
%token PLUS MINUS MUL DIV LPAREN RPAREN

/* Non-terminal value types */
%type<fnum> exp term factor frac

%%
/* rules section */

/* Allow multiple lines of input */
input:
      /* empty */
    | input line
    ;

line: 
    exp EOL { printf("%.2f\n", $1); }
    | exp { printf("%.2f\n", $1); } /* Allow expressions without EOL */
    | EOL   /* empty line */
    ;

/* Level 1: Addition/Subtraction - Lowest Priority */
exp:
    exp PLUS term  { $$ = $1 + $3; }
    | exp MINUS term { $$ = $1 - $3; }
    | term
    ;

/* Level 2: Multiplication - Medium Priority */
term:
    term MUL term { $$ = $1 * $3; }
    | frac 
    ;

/* Level 3: Division - Highest Priority */
frac:
    frac DIV frac { $$ = $1 / $3; }
    | factor
    ;

/* Level 4: Atomic values */
factor:
    NUMBER { $$ = $1; }
    | LPAREN exp RPAREN { $$ = $2; }
    ;

%%
/* user section */
int main() {
    yyin = fopen("input.txt", "r");
    if (!yyin) {
        perror("Could not open input.txt");
        return 1;
    }
    int res = yyparse();
    fclose(yyin);
    return res;
}

int yyerror(const char *s) {
    printf("ERROR: %s\n", s);
    return 0;
}