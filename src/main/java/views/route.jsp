<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map, narrafw.dto.ControllerMethods, narrafw.dto.URLMethod" %>
<%
String url = (String) request.getAttribute("url");
String controllerName = (String) request.getAttribute("controllerName");
String methodName = (String) request.getAttribute("methodName");
String notFoundUrl = (String) request.getAttribute("notFoundUrl");
Map<URLMethod, ControllerMethods> matchingRoutes =
    (Map<URLMethod, ControllerMethods>) request.getAttribute("matchingRoutes");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Route</title>
</head>
<body>
<%
if (notFoundUrl != null) {
%>
    <h1><%= notFoundUrl %> non trouvé</h1>
    <h2>Routes qui commencent par <%= url %></h2>
    <ul>
<%
    if (matchingRoutes != null) {
        for (Map.Entry<URLMethod, ControllerMethods> entry : matchingRoutes.entrySet()) {
%>
        <li>
            <strong><%= entry.getKey().getMethod() %></strong>
            <strong>URL :</strong> <%= entry.getKey().getUrl() %><br>
            <strong>Controller :</strong> <%= entry.getValue().getControllerName() %><br>
            <strong>Méthode :</strong> <%= entry.getValue().getMethod().getName() %>
        </li>
<%
        }
    }
%>
    </ul>
<%
} else {
%>
    <h1>URL : <%= url %></h1>
    <p><strong>Controller :</strong> <%= controllerName %></p>
    <p><strong>Méthode :</strong> <%= methodName %></p>
<%
}
%>
    <a href="${pageContext.request.contextPath}/">Retour</a>
</body>
</html>
