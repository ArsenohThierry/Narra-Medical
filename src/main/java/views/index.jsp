<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Object erreurAttribute = request.getAttribute("erreur");
    String erreur = erreurAttribute instanceof String ? (String) erreurAttribute : null;
    if (erreur != null) {
        erreur = erreur.replace("&", "&amp;")
                       .replace("<", "&lt;")
                       .replace(">", "&gt;")
                       .replace("\"", "&quot;")
                       .replace("'", "&#39;");
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#f4f8fb">
    <title>Connexion · Medica</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <main class="login-shell">
        <section class="brand-panel" aria-label="Présentation de Medica">
            <div class="brand">
                <span class="brand-mark" aria-hidden="true">
                    <svg viewBox="0 0 24 24" fill="none">
                        <path d="M12 4.5v15M4.5 12h15" stroke="currentColor" stroke-width="3" stroke-linecap="round"/>
                    </svg>
                </span>
                <span class="brand-name">Medica</span>
            </div>
            <div class="brand-copy">
                <p class="eyebrow">Espace professionnel</p>
                <p>Retrouvez un espace pensé pour accompagner votre pratique médicale au quotidien.</p>
            </div>
            <div class="brand-footer">Un espace dédié aux professionnels de santé</div>
        </section>

        <section class="form-panel" aria-labelledby="login-title">
            <div class="form-content">
                <h2 id="login-title">Bienvenuto</h2>
                <p class="form-intro">Connectez-vous à votre espace médecin.</p>

                <% if (erreur != null && !erreur.isBlank()) { %>
                    <p class="login-error" id="login-error" role="alert"><%= erreur %></p>
                <% } %>

                <form action="<%= request.getContextPath() %>/login" method="post">
                    <div class="field">
                        <label for="login">Identifiant</label>
                        <div class="input-wrap">
                            <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                                <circle cx="12" cy="8" r="3.5" stroke="currentColor" stroke-width="1.7"/>
                                <path d="M5 20c.6-3.5 3.1-5.3 7-5.3s6.4 1.8 7 5.3" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/>
                            </svg>
                            <input id="login" type="text" name="login" placeholder="Votre identifiant" autocomplete="username" required>
                        </div>
                    </div>
                    <div class="field">
                        <label for="password">Mot de passe</label>
                        <div class="input-wrap">
                            <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                                <rect x="5" y="10" width="14" height="10" rx="2" stroke="currentColor" stroke-width="1.7"/>
                                <path d="M8 10V7a4 4 0 0 1 8 0v3m-4 4v2" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/>
                            </svg>
                            <input id="password" type="password" name="password" placeholder="Votre mot de passe" autocomplete="current-password" required>
                        </div>
                    </div>
                    <button class="submit-button" type="submit">
                        Se connecter
                        <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                            <path d="M5 12h14m-6-6 6 6-6 6" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </button>
                </form>

                <p class="secure-note">
                    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                        <path d="M12 3 5 6v5c0 4.5 2.9 8.2 7 10 4.1-1.8 7-5.5 7-10V6l-7-3Z" stroke="currentColor" stroke-width="1.7" stroke-linejoin="round"/>
                        <path d="m9 12 2 2 4-4" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                    Accès réservé aux professionnels de santé
                </p>
            </div>
        </section>
    </main>
</body>
</html>
