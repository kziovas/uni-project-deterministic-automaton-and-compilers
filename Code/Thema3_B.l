%{
#include <math.h>
%}


%x shape
%x gwnia
%x trigwno
%x tetragwno

EDGES [A-E]
VERB Dinetai
GAP[" ""\n""\t""\r\n"]
%%


{VERB}{GAP}  {printf("%s : Einai rima \n", yytext);}; BEGIN(shape);

<shape>"Gwnia"{GAP} {printf("%s : Einai gewmetrikh ontotita \n", yytext);}; BEGIN(gwnia);
<shape>"Trigwno"{GAP} {printf("%s : Einai gewmetrikh ontotita \n", yytext);}; BEGIN(trigwno);
<shape>"Tetragwno"{GAP} {printf("%s : Einai gewmetrikh ontotita \n", yytext);}; BEGIN(tetragwno);
<shape>{GAP}* ;
<shape>[^{GAP}] {printf("Invalid Syntax! %s is not correct here! \n", yytext);}; BEGIN(INITIAL);


<gwnia>{EDGES}{1,1} { printf("%s : Einai onoma gewmetrikhs ontotitas (gwnias) \n", yytext);}BEGIN(INITIAL);
<gwnia>{GAP}* ;
<gwnia>[^{GAP}] {printf("Invalid Syntax! %s is not correct here! \n", yytext);}; BEGIN(INITIAL);



<trigwno>{EDGES}{3,3} {	if(yytext[0]!= yytext[1] && yytext[0]!= yytext[2] && yytext[1]!= yytext[2]){
				printf("%s : Einai onoma gewmetrikhs ontotitas (gwnias) \n", yytext);
		     	}
			else{
				printf("%s : Den epitrepetai i epanalipsi grammatwn! \n", yytext);
			}
		      }; BEGIN(INITIAL);
<trigwno>{GAP}* ;
<trigwno>[^{GAP}] {printf("Invalid Syntax! %s is not correct here! \n", yytext);}; BEGIN(INITIAL);




<tetragwno>{EDGES}{4,4} {	if(yytext[0]!= yytext[1] && yytext[0]!= yytext[2] && yytext[0]!= yytext[3]&& yytext[1]!= yytext[2] && yytext[1]!= yytext[3] && yytext[2]!= yytext[3]){
					printf("%s : Einai onoma gewmetrikhs ontotitas (gwnias) \n", yytext);
		     		}
				else{
					printf("%s : Den epitrepetai i epanalipsi grammatwn! \n", yytext);
				}
		    	 }; BEGIN(INITIAL);
<tetragwno>{GAP}* ;
<tetragwno>[^{GAP}] {printf("Invalid Syntax! %s is not correct here! \n", yytext);}; BEGIN(INITIAL);


{GAP}* ;
[^{GAP}] {printf("Invalid Syntax! \n");};
.;

%%
main(){
yylex();
}
