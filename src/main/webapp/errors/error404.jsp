<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ include file="/fragments/header.jsp" %>
<%@ include file="/fragments/nav.jsp" %>

<main class="main-content">
    <div class="error-page-container">
        <div class="error-code">404</div>
        <h2>Pagina non trovata</h2>
        <p>La pagina che cercavi è scappata via. Controlla l'indirizzo oppure torna alla vetrina.</p>
        <a href="${pageContext.request.contextPath}/" class="btn-error-home">Torna alla Home</a>
    </div>
</main>

<%@ include file="/fragments/footer.jsp" %>
