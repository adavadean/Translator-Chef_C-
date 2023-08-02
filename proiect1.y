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


METHOD : PUT ITEM {printf(");\n");} // Adaugă ingredientul în rețetă
       | FOLD ITEM {printf(" = mixingBowl.top(); \n mixingBowl.pop();\n");} // Pliază ingredientul
       | CLEAN // Curăță vasul de amestecat
       | SERVE_WITH AUXILIARY_ITEM // Servește rețeta cu un ingredient auxiliar
       | MIX // Amestecă ingredientele
       | ADD NUM UNITY {printf(", GET_VARIABLE_NAME(");} ITEM {printf("), mixingBowl);\n");} // Adaugă ingredientul în bol
       | REMOVE NUM UNITY {printf(", GET_VARIABLE_NAME(");} ITEM {printf("), mixingBowl);\n");} // Scoate ingredientul din bol
       | COMBINE NUM UNITY {printf(", GET_VARIABLE_NAME(");} ITEM {printf("), mixingBowl);\n");} // Combină ingredientul cu cel din bol
       | DIVIDE NUM UNITY {printf(", GET_VARIABLE_NAME(");}  ITEM {printf("), mixingBowl);\n");} // Împarte ingredientul la cel din bol
       | PRINT // Afișează rezultatul
       | PRINT2 // Afișează rezultatul într-un format specific
       | READ ITEM {printf(";\n");} // Citește un ingredient
       | REFRIGERATE NUM {printf("; i++){\n  cout<<mixingBowl.top();\n  mixingBowl.pop();\n }\n");} // Răcește rețeta timp de un anumit număr de minute
       | VERB // Verb
       | TASTE // Gustă rețeta
       ;


%%

#include "lex.yy.c"
int yywrap() {return 1;}
int main() {
    printf("// Translated from Chef to C++:\n\n");
    yyparse();
}

int yyerror() {
    // Funcție de manipulare a erorilor pentru analizatorul sintactic
    ;
}
