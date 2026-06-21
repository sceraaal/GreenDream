<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <div style="background: var(--white); padding: 40px; border-radius: 16px; border: 1px solid var(--border-color); max-width: 600px; margin: 0 auto;">
        <h2 style="margin-bottom: 25px;">Il mio profilo</h2>

        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <div style="display: grid; grid-template-columns: 140px 1fr; gap: 14px 20px; font-size: 16px;">
                    <span style="color: #7f8c8d;">Nome</span>
                    <strong>${sessionScope.user.firstName}</strong>
                    <span style="color: #7f8c8d;">Cognome</span>
                    <strong>${sessionScope.user.lastName}</strong>
                    <span style="color: #7f8c8d;">Email</span>
                    <strong>${sessionScope.user.email}</strong>
                    <span style="color: #7f8c8d;">Ruolo</span>
                    <strong>${sessionScope.user.role}</strong>
                </div>

                <div style="display: flex; gap: 15px; margin-top: 30px; flex-wrap: wrap;">
                    <a href="${pageContext.request.contextPath}/Order"
                       class="btn-submit" style="width: auto; padding: 12px 25px; text-decoration: none; display: inline-block;">
                        I miei ordini
                    </a>
                    <a href="${pageContext.request.contextPath}/Login?action=logout"
                       class="btn-submit" style="width: auto; padding: 12px 25px; background: #7f8c8d; text-decoration: none; display: inline-block;">
                        Logout
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <p style="color: #7f8c8d;">Devi effettuare l'accesso per vedere il tuo profilo.</p>
                <a href="${pageContext.request.contextPath}/login.jsp" class="btn-submit"
                   style="display: inline-block; width: auto; padding: 12px 25px; text-decoration: none; margin-top: 15px;">
                    Vai al Login
                </a>
            </c:otherwise>
        </c:choose>
    </div>
</main>

<%@ include file="fragments/footer.jsp" %>
