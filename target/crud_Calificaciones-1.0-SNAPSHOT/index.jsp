<%-- 
    Document   : index.jsp
    Created on : 2 abr. de 2024, 14:47:53
    Author     : DELL
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Persona"%>
<%
    if(session.getAttribute("lista")==null){
        ArrayList<Persona> aux = new ArrayList();
        session.setAttribute("lista", aux);
    }
    ArrayList<Persona> lista = (ArrayList<Persona>) session.getAttribute("lista");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="max-width: 100%; margin: auto">
        <div  style="display: grid; place-content:center; ">
            <ul style="width: 100%; font-size: 1.2em; background-color: #F3F1E6; list-style: none; padding:2rem 1rem; border: 3px solid blue; border-radius: 3rem; text-align: center;  ">
                <li>Primer Parcial TEM-742</li>
                <li>Nombre: Bernardo Lima Cardenas</li>
                <li>Carnet: 10070606 lp</li>
            </ul>
            <h1 style=" text-transform: uppercase; font-size: 3em; background: linear-gradient(to bottom, #8800ff, #8800ff,#000000);-webkit-background-clip: text;-webkit-text-fill-color: transparent;">Registro de Calificaciones</h1>
            <a href="servRegistro?op=create"  style="font-weight: bold; width: 7rem; padding: 1rem 2rem; border-radius: 3rem; border: 1px solid red; color: red; background-color: transparent;">Nuevo Registro</a>
            <table border="1" cellspacing="0" style="margin: 1rem 0 0">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombres</th>
                        <th>Primer Parcial</th>
                        <th>Segundo Parcial</th>
                        <th>Tercer Parcial</th>
                        <th colspan="2">Operaciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Persona persona : lista) {
                         %>
                             <tr>
                                <td><%=persona.getId()%></td>
                                <td><%=persona.getNombre()%></td>
                                <td><%=persona.getpParcial()%></td>
                                <td><%=persona.getsParcial()%></td>
                                <td><%=persona.gettParcial()%></td>
                                <td><a style=" text-transform: uppercase; color: blue;" href="servRegistro?op=update&id=<%=persona.getId()%>">Modificar</a></td>
                                <td><a style=" text-transform: uppercase; color: blue;" href="servRegistro?op=delete&id=<%=persona.getId()%>">Eliminar</td>
                            </tr>
                        <%
                        }
                    %>
                </tbody>
            </table>
        
        </div>

    </body>
</html>
