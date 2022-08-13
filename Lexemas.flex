Package Principal;
import static Principal.Tokens.*;
%%
%class Lexemas
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexemas;
%}
%%
int |
if |
else |
while {lexemas=yytext(); return Reservadas;}
{espacio} {/*Ignorar*/}
"//".* {/*Ignorar*/}
"=" {lexemas=yytext();return Igual;}
"+" {lexemas=yytext();return Suma;}
"-" {lexemas=yytext();return Resta;}
"*" {lexemas=yytext();return Multiplicacion;}
"/" {lexemas=yytext();return Division;}
{L}({L}|{D})* {lexemas=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexema=yytext(); return Número;}
 . {lexemas=yytext();return ERROR;}
