<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <div class="form-container">
        <h2>Registrazione PetHouse</h2>
        <p>Crea il tuo account per ordinare i prodotti del tuo pet.</p>
        
        <form action="${pageContext.request.contextPath}/RegisterServlet" method="POST" onsubmit="return validateRegistrationForm()">
            
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
                <input type="password" id="password" name="password" placeholder="Almeno 8 caratteri (Minusc, Maiusc, Numero)">
                <span id="password-error" class="error-message"></span>
            </div>

            <button type="submit" class="btn-submit">Registrati</button>
        </form>
    </div>
</main>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>

<%@ include file="fragments/footer.jsp" %>