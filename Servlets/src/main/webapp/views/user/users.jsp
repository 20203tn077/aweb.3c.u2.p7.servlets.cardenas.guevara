<%--
  Created by IntelliJ IDEA.
  User: RCG
  Date: 16/07/2021
  Time: 08:22 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String context = request.getContextPath(); %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">

</head>
<body>
    <a href="<%=context%>/views/user/register.jsp" class="btn btn-outline-success btn-sm"><i class="fas fa-plus"></i> Agregar usuario</a>
    <table class="table">
        <thead class="table-dark">
            <tr>
                <th>#</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listUsers}" var="user" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${user.idPerson.name} ${user.idPerson.lastname}</td>
                    <td>${user.email}</td>
                    <td>
                        <c:if test = "${user.status == 1}">
                            <span class="badge bg-success">Activo</span>
                        </c:if>
                        <c:if test = "${user.status == 0}">
                            <span class="badge bg-secondary">Inactivo</span>
                        </c:if>
                    </td>
                    <td>
                        <c:if test = "${user.status == 1}">
                            <form action="<%=context%>/ServletUser" method="POST" style="display: inline;">
                                <input type="hidden" name="action" value="getUserById">
                                <input type="hidden" name="id" value="${ user.id }">
                                <button type="submit" class="btn btn-outline-primary"><i class="fas fa-edit"></i> Modificar</button>
                            </form>
                            <button type="button" class="btn btn-outline-danger btn-sm" onclick="modal('${ user.id }', '${user.idPerson.name} ${user.idPerson.lastname}')" data-bs-toggle="modal" data-bs-target="#delete"><i class="fas fa-trash"></i> Eliminar</button>
                        </c:if>
                        <c:if test = "${user.status == 0}">
                            <button type="button" class="btn btn-outline-info btn-sm"><i class="fa fa-info-circle"></i> Info</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Modal -->
    <div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Eliminar usuario</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ¿Desea eliminar al usuario <span id="modalUserName"></span>?
                </div>
                <div class="modal-footer">
                    <form action="<%=context%>/ServletUser" method="POST">
                        <input type="hidden" value="delete" name="action">
                        <input type="hidden" value="" name="id" id="inputDeleteId">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
                        <button type="submit" class="btn btn-danger">Eliminar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function modal(id, name) {
            document.getElementById("modalUserName").innerHTML = name;
            document.getElementById("inputDeleteId").value = id;
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
