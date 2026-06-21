<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ include file="/fragments/header.jsp" %>
<%@ include file="/fragments/nav.jsp" %>

<main class="main-content">
    <div class="error-page-container">
        <div class="error-code">403</div>
        <h2>Alt! Zona riservata</h2>
        <p>Non hai i permessi per accedere a quest'area. Assicurati di aver effettuato l'accesso con l'account corretto prima di fiutare da queste parti.</p>
        <a href="${pageContext.request.contextPath}/login.jsp" class="btn-error-home">Vai al Login</a>
    </div>
</main>

<%@ include file="/fragments/footer.jsp" %>
