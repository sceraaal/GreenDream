<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <div class="error-page-container">
        <div class="error-code">404</div>
        <h2>Ops! Abbiamo perso le tracce... 🐶</h2>
        <p>La pagina che stai cercando sembra essere sparita nel nulla. Forse il gatto ci ha giocato un po' troppo ed è finita sotto il divano!</p>
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn-error-home">Torna alla Vetrina</a>
    </div>
</main>

<%@ include file="fragments/footer.jsp" %>