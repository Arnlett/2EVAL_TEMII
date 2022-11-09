<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <body bgcolor="BFFCC6"><center>  
        <font face="Arial">
        <h1>
            <c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request">
            Registro de
            </c:if>
            <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request">
            Editar
            </c:if>
          
            producto
        </h1>
        <jsp:useBean  id="miProducto" scope="request" class="com.emergentes.modelo.Producto" />

        <form action="Controller" method="post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="text" name="id" value="<jsp:getProperty name="miProducto" property="id" />">
                    </td>
                </tr>
                <tr>
                    <td>Descripcion</td>
                    <td><input type="text" name="descripcion" value="<jsp:getProperty name="miProducto" property="descripcion" />">
                    </td>
                </tr>
                <tr>
                    <td>Cantidad</td>
                    <td><input type="int" name="cantidad" value="<jsp:getProperty name="miProducto" property="cantidad" />">
                    </td>
                </tr>
                <tr>
                    <td>Precio</td>
                    <td><input type="double" name="precio" value="<jsp:getProperty name="miProducto" property="precio" />">
                    </td>
                </tr>
                <tr>
                    <td>Categoria</td>
                    <td>
                        <select name="categoria">
                            <option value="Bebidas" 
                                <c:if  test="${miProducto.categoria=='Bebidas'}"
                                   var ="res" scope="request">
                                        selected
                                    </c:if>
                                        >Bebidas</option>
                               <option value="Galletas" <c:if  test="${miProducto.categoria=='Galletas'}"
                                   var ="res" scope="request">
                                        selected
                                    </c:if>
                                        >Galletas</option>
                                  <option value="Dulces" <c:if  test="${miProducto.categoria=='Dulces'}"
                                   var ="res" scope="request">
                                        selected
                                    </c:if>
                                        >Dulces</option>
                        </select>

                    </td>

                </tr>
                <tr>
                    <td>
                        <input  type="hidden" name="opg" value="${requestScope.op}"/>
                        <input  type="hidden" name="op" value="grabar" />
                    </td> 
                    <td><input type="submit" value="Enviar" /></td>
                </tr>
            </table>

        </form>
    </body>
</html>
