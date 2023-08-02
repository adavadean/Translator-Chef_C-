alpha [A-Za-z]
digit [0-9]
%%

[\t \n]

Ingredients. {
    // Include bibliotecile necesare
    printf(" #include<iostream>\n #include<bits/stdc++.h>\n using namespace std;\n  #define GET_VARIABLE_NAME(Variable) (#Variable)\n\n\n");

    // Definiție funcție pentru pregătirea vasului
    printf(" void prepare(int dish){\n   stack<int> newDish; \n   newDish.push(dish);\n }\n\n");

    // Definiție funcție pentru amestecarea ingredientelor
    printf(" stack<int> mix(stack<int> stack){\n   unsigned seed=0;\n   shuffle(stack.begin(), stack.end(), default_random_engine(seed)); \n   return stack;\n }\n\n");

    // Definiție funcție pentru adăugarea unui ingredient
    printf(" stack<int> add_ingredient(int value, string ingredient,stack<int> stack){\n   cout<<\"We added \"<<ingredient; \n   int item= stack.top(); \n   stack.pop();\n   item +=value; \n   stack.push(item); \n   return stack; \n }\n\n");

    // Definiție funcție pentru scoaterea unui ingredient
    printf(" stack<int> remove_ingredient(int value, string ingredient,stack<int> stack){\n   cout<<\"We removed\"<<ingredient; \n   int item= stack.top(); \n   stack.pop();\n   item -=value; \n   stack.push(item); \n   return stack; \n}\n\n");

    // Definiție funcție pentru combinarea unui ingredient
    printf(" stack<int> combine_ingredient(int value, string ingredient,stack<int> stack){\n   cout<<\"We combined \"<<ingredient; \n   int item= stack.top(); \n   stack.pop();\n   item *=value; \n   stack.push(item); \n   return stack; \n}\n\n");

    // Definiție funcție pentru împărțirea unui ingredient
    printf(" stack<int> divide_ingredient(int value, string ingredient,stack<int> stack){\n   cout<<\"We divided \"<<ingredient; \n   int item= stack.top(); \n   stack.pop();\n  item /=value; \n   stack.push(item); \n   return stack; \n }\n\n");

    printf("\n int main()"); 
    return INGREDIENTS;
}

Method. {
    printf(";\n\n stack<int> mixingBowl");
    return FUNCTIONS;
}

salt   |
pepper |
water  |
butter |
sugar  |
flour  |
eggs   |
powder |
cream  |
yogurt |
apple  |
beans  |
soda   |
milk   |
bacon  |
garlic |
onion  |
honey  |
meat   |
potatoes |
spinach  |
mashroom |
cucumber |
corn     |
chocolate |
vanilla   |
margarine  {
    printf(" ");
    printf(yytext);
    return ITEM;
}

Boil |
Stir |
Fry  |
Wash |
Bake |
Cut  {
    printf(" int i=10;\n do{\n   i--; \n }while(i>0);\n");
    return VERB;
}

fries     |
salad     |
wine      |
bread     |
rice      |
ice-cream |
sos       {
    printf(" int ");
    printf(yytext);
    printf("=100;\n");
    printf(" prepare(");
    printf(yytext);
    printf(");\n");
    return AUXILIARY_ITEM;
}

Fold return FOLD;

Put {
    printf("\n mixingBowl.push(");
    return PUT;
}

Add {
    printf(" mixingBowl = add_ingredient(");
    return ADD;
}

Remove {
    printf(" mixingBowl = remove_ingredient(");
    return REMOVE;
}

Combine {
    printf(" mixingBowl = combine_ingredient(");
    return COMBINE;
}

Divide {
    printf(" mixingBowl = divide_ingredient(");
    return DIVIDE;
}

"Refrigerate for" {
    printf(" for(int i=1; i<");
    return REFRIGERATE;
}

"Taste the food." {
    printf(" if(mixingBowl.empty())\n cout<<\"The food is delicious\";\n else \n cout<<\"The food is simple\";\n\n");
    return TASTE;
}

g      |
kg     |
piece  |
pieces |
ml     return UNITY;

"Serve with"  return SERVE_WITH;

"Mix the mixing bowl well." {
    printf(" mixingBowl=mix(mixingBowl); \n");
    return MIX;
}

"into the mixing bowl."                             |
"from refrigerator."                                |
"from mixing bowl."                                 |
"the content of the mixing bowl."                   |
"hours."                                            |
"minutes"                                           {;}

"Take" {
    printf(" cin>>");
    return READ;
}

"Last baking dish." {
    printf(" cout<<mixingBowl.top();\n mixingBowl.pop();");
    return PRINT;
}

"Clean mixing bowl." {
    printf(" \n while(!mixingBowl.empty())\n");
    printf(" {\n  mixingBowl.pop();\n }\n\n");
    return CLEAN;
}

"Baking dishes." {
    printf("\n while(!mixingBowl.empty())\n");
    printf(" {\n  cout<<mixingBowl.top();\n  mixingBowl.pop();\n }\n");
    return PRINT2;
}

{digit}+  {
    printf(yytext);
    return NUM;
}

{alpha}({alpha}|{digit})* return ID;

"=" {
    printf("=");
    return EQ;
}

"," {
    printf(",");
    return COMMA;
}

. return yytext[0];
%%
