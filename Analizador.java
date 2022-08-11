/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Principal;

/**
 *
 * @author baigo
 */
import java.util.*;
import java.io.File;

public class Analizador {
    public static void main(String[] args) {
        
        String ruta="C:/Users/baigo/OneDrive/Documentos/NetBeansProjects/Analizador/src/Principal/Lexemas.flex"
        generaLexema(ruta);    
        
        
    }
    
    public static void generaLexema(String ruta){
        File archivo= new File(ruta);
        jflex.Main.generate(archivo);
    }
}
