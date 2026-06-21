<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <div class="form-container">
        <div style="text-align: center; margin-bottom: 25px;">
            <h2>Registrazione PetHouse</h2>
            <p style="color: #7f8c8d; font-size: 15px;">Crea il tuo account per ordinare i prodotti del tuo pet.</p>
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

        <form action="${pageContext.request.contextPath}/Registration" method="POST"
              onsubmit="return validateRegistrationForm()">

            <div class="form-group">
                <label for="nome">Nome</label>
                <input type="text" id="nome" name="nome" placeholder="Inserisci il tuo nome">
                <span id="nome-error" class="error-message"></span>
            </div>

            <div class="form-group">
                <label for="cognome">Cognome</label>
                <input type="text" id="cognome" name="cognome" placeholder="Inserisci il tuo cognome">
                <span id="cognome-error" class="error-message"></span>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" id="email" name="email" placeholder="esempio@email.com">
                <span id="email-error" class="error-message"></span>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password"
                       placeholder="Almeno 8 caratteri (Maiusc, Minusc, Numero)">
                <span id="password-error" class="error-message"></span>
            </div>

            <button type="submit" class="btn-submit">Registrati</button>
        </form>

        <div style="text-align: center; margin-top: 25px; font-size: 14px; border-top: 1px solid var(--border-color); padding-top: 20px;">
            <span style="color: #7f8c8d;">Hai già un account?</span><br>
            <a href="${pageContext.request.contextPath}/login.jsp"
               style="color: var(--primary-green); font-weight: 700; text-decoration: none; display: inline-block; margin-top: 8px;">
                Accedi ora →
            </a>
        </div>
    </div>
</main>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>

<%@ include file="fragments/footer.jsp" %>
