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
    <body>
        <h1>Listado de personal</h1>
        <a href="servRegistro?op=create">Nuevo Registro</a>
        <table border="1" cellspacing="0">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nombres</th>
                    <th>Apellido Paterno</th>
                    <th>Apellido Materno</th>
                    <th>Telefono</th>
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
                            <td><%=persona.getaPaterno()%></td>
                            <td><%=persona.getaMaterno()%></td>
                            <td><%=persona.getTelefono()%></td>
                            <td><a href="servRegistro?op=update&id=<%=persona.getId()%>">Modificar</a></td>
                            <td><a href="servRegistro?op=delete&id=<%=persona.getId()%>">Eliminar</td>
                        </tr>
                    <%
                    }
                %>
            </tbody>
        </table>

    </body>
</html>
