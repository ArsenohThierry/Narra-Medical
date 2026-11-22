<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, main.java.models.Patient" %>
<%!
    private String escapeHtml(String value) {
        if (value == null) return "—";
        return value.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#39;");
    }
%>
<%
    List<Patient> patients = (List<Patient>) request.getAttribute("patients");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#f4f8fb">
    <title>Patients · Medica</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/patients.css">
</head>
<body class="dashboard-page">
    <div class="dashboard-shell">
        <jsp:include page="/medecin/sidebar.jsp">
            <jsp:param name="active" value="patients" />
        </jsp:include>

        <main class="dashboard-main">
            <header class="dashboard-topbar">
                <div class="breadcrumb">Medica <span>/</span> Patients</div>
                <div class="profile-chip">
                    <span class="profile-avatar" aria-hidden="true">M</span>
                    <span>Espace médecin</span>
                </div>
            </header>

            <section class="patients-content" aria-labelledby="patients-title">
                <p class="dashboard-eyebrow">Votre activité médicale</p>
                <h1 id="patients-title">Patients</h1>
                <p class="patients-intro">Retrouvez les patients enregistrés dans votre espace.</p>

                <div class="patients-table-wrap">
                    <table class="patients-table">
                        <thead>
                            <tr>
                                <th scope="col">Identifiant</th>
                                <th scope="col">Nom</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (patients == null || patients.isEmpty()) { %>
                                <tr>
                                    <td class="patients-empty" colspan="2">Aucun patient à afficher pour le moment.</td>
                                </tr>
                            <% } else { %>
                                <% for (Patient patient : patients) { %>
                                    <tr>
                                        <td><%= escapeHtml(patient.getId()) %></td>
                                        <td><%= escapeHtml(patient.getNom()) %></td>
                                    </tr>
                                <% } %>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
