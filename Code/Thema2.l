%{
/* need this for the call to atof() below */
#include <math.h>
%}

%x vnames
%x vtypes
%x komma
%x semcl



DIGIT [0-9]
ALPHNUM [A-Za-z0-9]*
VTYPE integer_k|bool_k|real_k|char_k
VNAME [^,;:" "!]*
%%

section {
printf( "Keyword %s\n", yytext );
}; BEGIN(vnames);


<vnames>{VTYPE} {
printf("Invalid syntax!\n");
printf( "Variable name: %s is not permitted!\n", yytext );
}; BEGIN(INITIAL);

<vnames>{VNAME} {
printf( "Variable names %s \n", yytext );
}; BEGIN(komma);

<vnames>":" {
printf( "Special symbol %s \n", yytext );
}; BEGIN(vtypes);

<vnames>" "

<vnames>. {
printf("Invalid syntax!\n");
}; BEGIN(INITIAL);




<komma>" "*"," {
printf( "Special symbol %s \n", yytext );
};BEGIN(vnames);

<komma>" "*":" {
printf( "Special symbol %s \n", yytext );
}; BEGIN(vtypes);

<komma>. {
printf("Invalid syntax!\n");
}; BEGIN(INITIAL);





<vtypes>{VTYPE} {
printf( "Variable type %s \n", yytext );
}; BEGIN(semcl);

<vtypes>" "

<vtypes>{ALPHNUM} {
printf("Invalid syntax!\n");
}; BEGIN(INITIAL);

<vtypes>. {
printf("Invalid syntax!\n");
}; BEGIN(INITIAL);



<semcl>";" {
printf( "Special symbol %s \n", yytext );
}; BEGIN(vnames);

<semcl>" "

<semcl>{ALPHNUM} {
printf("Invalid syntax!\n");
}; BEGIN(INITIAL);

<semcl>. {
printf("Invalid syntax!\n");
}; BEGIN(INITIAL);



. ;

%%
main(){
yylex();
}
