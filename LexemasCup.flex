Package Principal;
import java_cup.runtime.symbol;
%%
%class LexemasCup
%type java_cup.runtime.symbol
%cup
%full
%line
%char

L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol (int type,object value){
       
         return new Symbol(type,yyline,yycolumn,value);
    }
    
     private Symbol symbol (int type){
       
         return new Symbol(type,yyline,yycolumn);
    }
%}
%%
int {return new Symbol(sym.Int, yychar, yyline, yytext());}
if  {return new Symbol(sym.If, yychar, yyline, yytext());}
else {return new Symbol(sym.Else, yychar, yyline, yytext());}
while {return new Symbol(sym.Else, yychar, yyline, yytext());}
package {return new Symbol(sym.Package, yychar, yyline, yytext());}
public {return new Symbol(sym.Public, yychar, yyline, yytext());}
class {return new Symbol(sym.Class, yychar, yyline, yytext());}
private {return new Symbol(sym.Private, yychar, yyline, yytext());}
void {return new Symbol(sym.Void, yychar, yyline, yytext());}
static {return new Symbol(sym.Static, yychar, yyline, yytext());}
String {return new Symbol(sym.Cadena, yychar, yyline, yytext());}
{espacio} {/*Ignorar*/}
"//".* {/*Ignorar*/}
"=" {return new Symbol(sym.Igual, yychar, yyline, yytext());}
"+" {return new Symbol(sym.Suma, yychar, yyline, yytext());}
"-" {return new Symbol(sym.Resta, yychar, yyline, yytext());}
"*" {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}
"/" {return new Symbol(sym.division, yychar, yyline, yytext());}
"(" {return new Symbol(sym.Parentesis_A, yychar, yyline, yytext());}
")" {return new Symbol(sym.Parentesis_C, yychar, yyline, yytext());}
"{" {return new Symbol(sym.Llave_A, yychar, yyline, yytext());}
"}" {return new Symbol(sym.Llave_C, yychar, yyline, yytext());}
";" {return new Symbol(sym.Punto_Coma, yychar, yyline, yytext());}
"[" {return new Symbol(sym.Corchete_A, yychar, yyline, yytext());}
"]" {return new Symbol(sym.corchete_C, yychar, yyline, yytext());}

{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}
("(-"{D}+")")|{D}+ {return new Symbol(sym.Número, yychar, yyline, yytext());}
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}

