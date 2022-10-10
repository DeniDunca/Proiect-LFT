%{
#include <stdio.h>
#include <stdlib.h>
%}

%token ID NUM ITEM INGREDIENTS FUNCTIONS PUT FOLD UNITY CLEAN SERVE_WITH 
       AUXILIARY_ITEM MIX ADD PRINT PRINT2 READ EQ COMMA
       REMOVE COMBINE DIVIDE REFRIGERATE VERB TASTE
%%

S  : INGREDIENTS  DEF
   ;


DEF : {printf("{\n"); printf("\n int ");} BODY {printf(" return 0;\n}\n");}
    ;
    

BODY : BODY BODY 
     | ST
     ;

ST  :  ITEM NUM
    |  ITEM EQ NUM UNITY COMMA
    |  ITEM EQ NUM UNITY 
    |  FUNCTIONS {printf(";\n");}
    |  METHOD
    ;


METHOD : PUT ITEM {printf(");\n");}
       | FOLD ITEM {printf(" = mixingBowl.top(); \n mixingBowl.pop();\n");}
       | CLEAN
       | SERVE_WITH AUXILIARY_ITEM 
       | MIX
       | ADD NUM UNITY {printf(", GET_VARIABLE_NAME(");} ITEM {printf("), mixingBowl);\n");}
       | REMOVE NUM UNITY {printf(", GET_VARIABLE_NAME(");} ITEM {printf("), mixingBowl);\n");}
       | COMBINE NUM UNITY {printf(", GET_VARIABLE_NAME(");} ITEM {printf("), mixingBowl);\n");}
       | DIVIDE NUM UNITY {printf(", GET_VARIABLE_NAME(");}  ITEM {printf("), mixingBowl);\n");}
       | PRINT
       | PRINT2
       | READ ITEM {printf(";\n");} 
       | REFRIGERATE NUM {printf("; i++){\n  cout<<mixingBowl.top();\n  mixingBowl.pop();\n }\n");}
       | VERB 
       | TASTE 
       ;


%%

#include "lex.yy.c"

int main() {
printf("//Translated from Chef to C++:\n\n");
yyparse();
}
int yyerror(){;}
