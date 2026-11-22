<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#f4f8fb">
    <title>Tableau de bord · Medica</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
</head>
<body class="dashboard-page">
    <div class="dashboard-shell">
        <jsp:include page="sidebar.jsp">
            <jsp:param name="active" value="dashboard" />
        </jsp:include>

        <main class="dashboard-main">
            <header class="dashboard-topbar">
                <div class="breadcrumb">Medica <span>/</span> Tableau de bord</div>
                <div class="profile-chip">
                    <span class="profile-avatar" aria-hidden="true">M</span>
                    <span>Espace médecin</span>
                </div>
            </header>

            <section class="dashboard-content" aria-labelledby="dashboard-title">
                <p class="dashboard-eyebrow">Votre espace de travail</p>
                <h1 id="dashboard-title">Bienvenue sur votre tableau de bord</h1>
                <p class="dashboard-intro">Accédez rapidement aux outils de suivi de votre activité médicale.</p>

                <h2 class="section-title">Gestion du cabinet</h2>
                <a class="patients-card" href="${pageContext.request.contextPath}/patients">
                    <span class="patients-icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24" fill="none">
                            <path d="M16 20v-1.5a3.5 3.5 0 0 0-3.5-3.5h-5A3.5 3.5 0 0 0 4 18.5V20m6-8a4 4 0 1 0 0-8 4 4 0 0 0 0 8Zm6-7.5a4 4 0 0 1 0 7.5m2 3h.5a3.5 3.5 0 0 1 3.5 3.5V20" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </span>
                    <span class="patients-copy">
                        <strong>Patients</strong>
                        <span>Consultez la liste et les informations de vos patients.</span>
                    </span>
                    <span class="patients-action" aria-hidden="true">
                        <svg viewBox="0 0 24 24" fill="none">
                            <path d="M5 12h14m-6-6 6 6-6 6" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </span>
                </a>
            </section>
        </main>
    </div>
</body>
</html>
