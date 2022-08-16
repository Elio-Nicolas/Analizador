Package Principal;
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
static{lexemas=yytext();return Static;}   //agregar a lexemas.cup
String{lexemas=yytext();return Cadena;}
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
";" {lexemas=yytext();return Punto_coma;}
"[" {lexemas=yytext();return Corchete_A;}  //agregar a lexemas.cup
"]" {lexemas=yytext();return Corchete_C;} //agregar a lexemas.cup

{L}({L}|{D})* {lexemas=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexema=yytext(); return Número;}
 . {lexemas=yytext();return ERROR;}
