<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>
<main class="main-content">
    <div style="background: var(--white); padding: 60px 40px; border-radius: 16px; border: 1px solid var(--border-color); text-align: center;">
        <h2 style="color: var(--dark-green); font-size: 32px; margin-bottom: 15px;">Ordine confermato!</h2>

        <c:if test="${not empty sessionScope.successMessage}">
            <p style="font-size: 18px; color: #7f8c8d; margin-bottom: 30px;">
                ${sessionScope.successMessage}
            </p>
            <c:remove var="successMessage" scope="session"/>
        </c:if>

        <div style="display: flex; justify-content: center; gap: 20px; margin-top: 30px; flex-wrap: wrap;">
            <a href="${pageContext.request.contextPath}/Product?action=list"
               class="btn-submit" style="width: auto; padding: 12px 30px; text-decoration: none;">
                Continua lo shopping
            </a>

            <a href="${pageContext.request.contextPath}/Order"
               class="btn-submit" style="width: auto; padding: 12px 30px; background: #7f8c8d; text-decoration: none;">
                I miei ordini
            </a>
        </div>
    </div>
</main>

<%@ include file="fragments/footer.jsp" %>
