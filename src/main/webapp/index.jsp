<%@page import="com.emergentes.modelo.Producto"%>
<%@page import="com.emergentes.modelo.GestorProductos"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
if (session.getAttribute("agenda")==null) {
        GestorProductos objeto1= new GestorProductos();
        objeto1.insertarProducto(new Producto(1,"Coca Cola",100,10,"Bebidas"));
        objeto1.insertarProducto(new Producto(2,"Pepsi",50,11,"Bebidas"));
        objeto1.insertarProducto(new Producto(3,"Frack",100,2.50,"Galletas"));
        objeto1.insertarProducto(new Producto(4,"Serranitas",80,1.50,"Galletas"));
        session.setAttribute("agenda",objeto1);
        
    }   
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="BFFCC6"><center>  
        <font face="Arial">
        
        <table border="0">
            <thead>
                <tr>
                    <th>Segundo parcial practico</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Nombre: Luz Faviola Daza Huanca</td>
                </tr>
                 <tr>
                    <td>Carnet: 10028265</td>
                </tr>
            </tbody>
        </table>

        <br>
        <h1>Productos</h1>
        <a href="Controller?op=nuevo">Nuevo producto</a>
        <table border=1>
            <tr>
                <th>Id</th>
                <th>Descripcion</th>
                <th>Cantidad</th>
                 <th>Precio</th>
                <th>Categoria</th>
                <th></th><!-- comment -->
                <th></th><!-- <th>Id</th> -->
            </tr>
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                 <tr>
                <td>${item.id}</td>
                <td>${item.descripcion}</td>
                <td>${item.cantidad}</td>
                <td>${item.precio}</td>
                <td>${item.categoria}</td>
                <td><a href="Controller?op=modificar&id=${item.id}">Editar</a></td><!-- comment -->
                <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a></td><!-- <th>Id</th> -->
            </tr>
            </c:forEach>
        </table>
</html>
