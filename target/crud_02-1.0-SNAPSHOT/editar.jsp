<%-- 
    Document   : editar
    Created on : 2 abr. de 2024, 15:29:11
    Author     : DELL
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Persona"%>
<%
    Persona person =(Persona) request.getAttribute("persona");
    ArrayList<Persona> lista = (ArrayList<Persona>)session.getAttribute("lista");
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Formulario</h3>
        <form action="servRegistro" method="post">
            <fieldset>
                <legend>Datos Personales</legend>
                <label>Id</label><br>
                <input type="text" name="id" value=<%=(person != null ? person.getId():lista.size()+1)%> readonly><br>
                <label>Nombre</label><br>
                <input type="text" name="nombre" value=<%=(person != null ? person.getNombre():"")%> ><br>
                <label>Apellido Paterno</label><br>
                <input type="text" name="paterno" placeholder="Lima" value=<%=(person != null ? person.getaPaterno():"")%> ><br>
                <label>Apellido Materno</label><br>
                <input type="text" name="materno" placeholder="Cardenas" value=<%=(person != null ? person.getaMaterno():"")%> ><br>
                <label>Telefono</label><br>
                <input type="text" name="telefono" placeholder="74001232" value=<%=(person != null ? person.getTelefono():"")%> ><br>
                <button type="submit">Aceptar</button>
            </fieldset>
        </form>
    </body>
</html>
