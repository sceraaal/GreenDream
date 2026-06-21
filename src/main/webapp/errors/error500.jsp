<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ include file="/fragments/header.jsp" %>
<%@ include file="/fragments/nav.jsp" %>

<main class="main-content">
    <div class="error-page-container">
        <div class="error-code">500</div>
        <h2>Qualcosa è andato storto</h2>
        <p>Si è verificato un errore interno. Riprova tra poco: il nostro team è già al lavoro.</p>
        <a href="${pageContext.request.contextPath}/" class="btn-error-home">Torna alla Home</a>
    </div>
</main>

<%@ include file="/fragments/footer.jsp" %>
