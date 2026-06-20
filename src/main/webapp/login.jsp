<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <div class="form-container">
        <div style="text-align: center; margin-bottom: 25px;">
            <h2>Bentornato! 🐾</h2>
            <p style="color: #7f8c8d; font-size: 15px;">Accedi per vedere i tuoi ordini e il carrello.</p>
        </div>

        <form action="${pageContext.request.contextPath}/LoginServlet" method="POST" id="loginForm">
            <div class="form-group">
                <label for="email">Indirizzo Email</label>
                <input type="email" id="email" name="email" placeholder="es. mario.rossi@email.com" required>
                <span class="error-message" id="emailError" style="color: var(--error-red);"></span>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Inserisci la tua password" required>
                <span class="error-message" id="passwordError" style="color: var(--error-red);"></span>
            </div>

            <button type="submit" class="btn-submit" style="margin-top: 10px;">Accedi alla tua area</button>
        </form>

        <div style="text-align: center; margin-top: 25px; font-size: 14px; border-top: 1px solid var(--border-color); padding-top: 20px;">
            <span style="color: #7f8c8d;">Non hai ancora un account?</span><br>
            <a href="${pageContext.request.contextPath}/register.jsp" style="color: var(--primary-green); font-weight: 700; text-decoration: none; display: inline-block; margin-top: 8px;">Registrati ora ed entra nel branco!</a>
        </div>
    </div>
</main>

<%@ include file="fragments/footer.jsp" %>