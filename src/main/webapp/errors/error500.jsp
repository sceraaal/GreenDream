<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <div class="error-page-container">
        <div class="error-code">500</div>
        <h2>Qualcosa è andato storto! 😿</h2>
        <p>I nostri server stanno facendo i capricci. I nostri tecnici (e i nostri criceti da guardia) sono già al lavoro per risolvere il problema.</p>
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn-error-home">Riprova più tardi</a>
    </div>
</main>

<%@ include file="fragments/footer.jsp" %>
