<%
    String activePage = request.getParameter("active");
    boolean dashboardActive = "dashboard".equals(activePage);
    boolean patientsActive = "patients".equals(activePage);
%>
<aside class="dashboard-sidebar" aria-label="Navigation principale">
    <a class="dashboard-brand" href="<%= request.getContextPath() %>/medecin/dashboard.jsp" aria-label="Medica, tableau de bord">
        <span class="dashboard-brand-mark" aria-hidden="true">
            <svg viewBox="0 0 24 24" fill="none">
                <path d="M12 4.5v15M4.5 12h15" stroke="currentColor" stroke-width="3" stroke-linecap="round"/>
            </svg>
        </span>
        <span>Medica</span>
    </a>

    <div class="sidebar-caption">Espace médecin</div>
    <nav aria-label="Sections">
        <a class="sidebar-link<%= dashboardActive ? " is-active" : "" %>"
           href="<%= request.getContextPath() %>/medecin/dashboard.jsp"
           <%= dashboardActive ? "aria-current=\"page\"" : "" %>>
            <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                <path d="m3.5 10 8.5-7 8.5 7v10.5h-6v-7h-5v7h-6V10Z" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            <span>Tableau de bord</span>
            <% if (dashboardActive) { %>
                <svg class="nav-arrow" viewBox="0 0 24 24" fill="none" aria-hidden="true">
                    <path d="m9 18 6-6-6-6" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            <% } %>
        </a>
        <a class="sidebar-link<%= patientsActive ? " is-active" : "" %>"
           href="<%= request.getContextPath() %>/patients"
           <%= patientsActive ? "aria-current=\"page\"" : "" %>>
            <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                <path d="M16 20v-1.5a3.5 3.5 0 0 0-3.5-3.5h-5A3.5 3.5 0 0 0 4 18.5V20m6-8a4 4 0 1 0 0-8 4 4 0 0 0 0 8Zm6-7.5a4 4 0 0 1 0 7.5m2 3h.5a3.5 3.5 0 0 1 3.5 3.5V20" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            <span>Patients</span>
            <% if (patientsActive) { %>
                <svg class="nav-arrow" viewBox="0 0 24 24" fill="none" aria-hidden="true">
                    <path d="m9 18 6-6-6-6" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            <% } %>
        </a>
    </nav>

    <div class="sidebar-footer">
        <span class="status-dot" aria-hidden="true"></span>
        Espace professionnel
    </div>
    <form class="logout-form" action="<%= request.getContextPath() %>/logout" method="post">
        <button class="logout-button" type="submit">
            <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                <path d="M10 4H5.5A1.5 1.5 0 0 0 4 5.5v13A1.5 1.5 0 0 0 5.5 20H10m4-4 4-4-4-4m4 4H9" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            <span>Se déconnecter</span>
        </button>
    </form>
</aside>
