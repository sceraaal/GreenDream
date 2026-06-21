<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <div class="form-container">
        <div style="text-align: center; margin-bottom: 25px;">
            <h2>Accedi a PetHouse</h2>
            <p style="color: #7f8c8d; font-size: 15px;">Entra nel tuo account per ordinare e seguire i tuoi ordini.</p>
        </div>

        <c:if test="${not empty errorMessage}">
            <div style="color: var(--error-red); background: #fdf2f2; padding: 10px 15px; border-radius: 8px; margin-bottom: 15px;">
                ${errorMessage}
            </div>
        </c:if>

        <c:if test="${not empty successMessage}">
            <div style="color: var(--primary-green); background: #eef9f1; padding: 10px 15px; border-radius: 8px; margin-bottom: 15px;">
                ${successMessage}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/Login" method="POST">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" id="email" name="email" placeholder="esempio@email.com" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="La tua password" required>
            </div>

            <button type="submit" class="btn-submit">Accedi</button>
        </form>

        <div style="text-align: center; margin-top: 25px; font-size: 14px; border-top: 1px solid var(--border-color); padding-top: 20px;">
            <span style="color: #7f8c8d;">Non hai ancora un account?</span><br>
            <a href="${pageContext.request.contextPath}/register.jsp"
               style="color: var(--primary-green); font-weight: 700; text-decoration: none; display: inline-block; margin-top: 8px;">
                Registrati ora →
            </a>
        </div>
    </div>
</main>

<%@ include file="fragments/footer.jsp" %>
