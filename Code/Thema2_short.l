%{
/* need this for the call to atof() below */
#include <math.h>
%}


DIGIT [0-9]
ALPHNUM [A-Za-z0-9]*
VTYPE integer_k|bool_k|real_k|char_k
VNAME [^,;:" "!]*
%%


section" "*{VTYPE}.* {printf("Invalid syntax! \n");};

section.*(","|";")" "*{VTYPE}.* {printf("Invalid syntax!\n");};

section.*(","",")" "*.* {printf("Invalid syntax!\n");};

section" "*({VNAME}" "*((" "*)","(" "*){VNAME}(" "*))*" "*":"" "*{VTYPE}" "*";"" "*)* {
printf("-----------------------------------------------------------------------------\n\n");
printf( "The variable declaration section was succesfully recognized:\n%s\n\n", yytext );
printf("-----------------------------------------------------------------------------\n");
}; 

" "*
.* printf("Invalid syntax!\n");

%%
main(){
yylex();
}
