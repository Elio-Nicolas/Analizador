package Principal;
import static Principal.Tokens.*;
%%
%class Lexemas
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexemas;
%}
%%
int {lexemas=yytext(); return Int;}
if {lexemas=yytext(); return If;}
else {lexemas=yytext(); return Else;}
while {lexemas=yytext(); return While;}
package {lexemas=yytext();return Package;}
public {lexemas=yytext();return Public;}
class {lexemas=yytext();return Class;}
private {lexemas=yytext();return Private;}
void {lexemas=yytext();return Void;}
static {lexemas=yytext();return Estatico;}   
String {lexemas=yytext();return Cadena;}
return {lexemas=yytext();return Return;}
{espacio} {/*Ignorar*/}
"//".* {/*Ignorar*/}
"\n" {lexemas=yytext();return Linea;}
"=" {lexemas=yytext();return Igual;}
"+" {lexemas=yytext();return Suma;}
"-" {lexemas=yytext();return Resta;}
"*" {lexemas=yytext();return Multiplicacion;}
"/" {lexemas=yytext();return Division;}
"(" {lexemas=yytext();return Parentesis_A;}
")" {lexemas=yytext();return Parentesis_C;}
"{" {lexemas=yytext();return Llave_A;}
"}" {lexemas=yytext();return Llave_C;}
";" {lexemas=yytext();return Punto_Coma;}
"[" {lexemas=yytext();return Corchete_A;}  
"]" {lexemas=yytext();return Corchete_C;} 

{L}({L}|{D})* {lexemas=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexemas=yytext(); return Número;}
 . {lexemas=yytext();return ERROR;}
