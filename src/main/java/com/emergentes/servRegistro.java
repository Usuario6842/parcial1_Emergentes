
package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class servRegistro extends HttpServlet {
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Persona> lista= (ArrayList<Persona>) session.getAttribute("lista");
        Persona person = new Persona();
        String option = request.getParameter("op");
        int id;
        
        switch(option){
            case "create":
                if(!lista.isEmpty()){
                    id = lista.get((lista.size()-1)).getId();
                    request.setAttribute("lastId", id);
                }else{
                    id=lista.size();
                    session.setAttribute("persona", person);
                }
                
                request.setAttribute("lastId", id);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "update":
                id = Integer.parseInt(request.getParameter("id"));
                System.out.println("El valor de update"+id);
                if(buscarPosRegistro(lista, id)!=-1){
                    person = lista.get(buscarPosRegistro(lista, id));
                    request.setAttribute("persona", person);
                    request.getRequestDispatcher("editar.jsp").forward(request, response);
                }
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                if(buscarPosRegistro(lista, id)!=-1){
                    lista.remove(buscarPosRegistro(lista, id));
                    response.sendRedirect("index.jsp");
                }
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Persona> lista= (ArrayList<Persona>) session.getAttribute("lista");
        Persona person = new Persona();
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        int pParcial = Integer.parseInt(request.getParameter("pParcial"));
        int sParcial = Integer.parseInt(request.getParameter("sParcial"));
        int tParcial = Integer.parseInt(request.getParameter("tParcial"));
        
        person.setNombre(nombre);
        person.setpParcial(pParcial);
        person.setsParcial(sParcial);
        person.settParcial(tParcial);
        
        if(buscarPosRegistro(lista, id) == -1){
            //id = lista.size() + 1;
            person.setId(id);
            lista.add(person);
        }else{
            person.setId(id);
            lista.set(buscarPosRegistro(lista, id), person);
        }
        
        session.setAttribute("lista",lista);
        response.sendRedirect("index.jsp");
        
    }
    
    public int buscarPosRegistro(ArrayList<Persona> list, int id){
        int pos=0;
        for (Persona persona : list) {
            if(persona.getId() == id){
                return pos;
            }
            pos++;
        }
        return -1;
    }



}
