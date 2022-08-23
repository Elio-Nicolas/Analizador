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
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class analizador {
    
    public static void main(String[] args) throws IOException, Exception {
        
        String ruta1="C:/Users/baigo/OneDrive/Documentos/NetBeansProjects/Analizador/src/Principal/Lexemas.flex";
        String ruta2="C:/Users/baigo/OneDrive/Documentos/NetBeansProjects/Analizador/src/Principal/LexemasCup.flex";
        String [] rutaSint ={"-parser","Syntaxis","C:/Users/baigo/OneDrive/Documentos/NetBeansProjects/Analizador/src/Principal/Syntaxis.cup"};
        genera(ruta1,ruta2,rutaSint);
    }
    
    public static void genera(String ruta1,String ruta2, String[] rutaSint) throws IOException, Exception{
        File archivo;
        archivo= new File(ruta1);
        JFlex.Main.generate(archivo);
        archivo= new File(ruta2);
        JFlex.Main.generate(archivo);
        //archivo= new File(rutaSint[2]);
        java_cup.Main.main(rutaSint);
        
       
        Path rutasym;
        rutasym = Paths.get("C:/Users/baigo/OneDrive/Documentos/NetBeansProjects/Analizador/src/Principal/sym.java");
        if(Files.exists(rutasym)){
            Files.delete(rutasym);
        }
        
        Files.move(
                Paths.get("C:/Users/baigo/OneDrive/Documentos/NetBeansProjects/Analizador/sym.java")
               ,Paths.get("C:/Users/baigo/OneDrive/Documentos/NetBeansProjects/Analizador/src/Principal/sym.java"));
        
        
        Path rutasim;
        rutasim = Paths.get("C:/Users/baigo/OneDrive/Documentos/NetBeansProjects/Analizador/src/Principal/Syntaxis.java");
        
        
        if(Files.exists(rutasim)){
            Files.delete(rutasim);
        }
        
        Files.move(
                Paths.get("C:/Users/baigo/OneDrive/Documentos/NetBeansProjects/Analizador/Syntaxis.java")
               ,Paths.get("C:/Users/baigo/OneDrive/Documentos/NetBeansProjects/Analizador/src/Principal/Syntaxis.java"));
    }
}
