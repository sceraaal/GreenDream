let isEmailAvailable = false;

document.addEventListener("DOMContentLoaded", () => {
    const nomeInput = document.getElementById("nome");
    if (nomeInput) nomeInput.focus();
    
    const emailInput = document.getElementById("email");
    if (emailInput) {
        emailInput.addEventListener("input", debounce(() => {
            checkEmailAvailability(emailInput.value);
        }, 500));
    }
});

function validateRegistrationForm() {
    clearErrors();

    const nome = document.getElementById("nome");
    const cognome = document.getElementById("cognome");
    const email = document.getElementById("email");
    const password = document.getElementById("password");

    let isValid = true;
    let firstErrorField = null;

    const nomeRegex = /^[A-Za-zÀ-ù\s]{2,30}$/; 
    if (!nomeRegex.test(nome.value.trim())) {
        showError("nome-error", "Nome non valido (solo lettere, min 2 caratteri).");
        if (!firstErrorField) firstErrorField = nome;
        isValid = false;
    }

    const cognomeRegex = /^[A-Za-zÀ-ù\s]{2,30}$/;
    if (!cognomeRegex.test(cognome.value.trim())) {
        showError("cognome-error", "Cognome non valido (solo lettere, min 2 caratteri).");
        if (!firstErrorField) firstErrorField = cognome;
        isValid = false;
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email.value.trim())) {
        showError("email-error", "Formato email non valido.");
        if (!firstErrorField) firstErrorField = email;
        isValid = false;
    } else if (!isEmailAvailable) {
        showError("email-error", "Questa email è già registrata nei nostri sistemi.");
        if (!firstErrorField) firstErrorField = email;
        isValid = false;
    }

    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;
    if (!passwordRegex.test(password.value)) {
        showError("password-error", "La password deve contenere almeno 8 caratteri, una maiuscola, una minuscola e un numero.");
        if (!firstErrorField) firstErrorField = password;
        isValid = false;
    }

    if (!isValid && firstErrorField) {
        firstErrorField.focus();
    }

    return isValid;
}

function checkEmailAvailability(emailValue) {
    const emailErrorSpan = document.getElementById("email-error");
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!emailRegex.test(emailValue.trim())) {
        isEmailAvailable = false;
        return;
    }

    const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf('/', 2));
    const url = `${contextPath}/CheckEmailServlet?email=${encodeURIComponent(emailValue.trim())}`;

    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error("Errore di rete durante la verifica email");
            }
            return response.json(); 
        })
        .then(data => {
            if (data.exists) {
                showError("email-error", "Questa email è già registrata!");
                isEmailAvailable = false;
            } else {
                emailErrorSpan.innerText = "Email disponibile.";
                emailErrorSpan.style.color = "green"; 
                isEmailAvailable = true;
            }
        })
        .catch(error => {
            console.error("Errore AJAX:", error);
            isEmailAvailable = true; 
        });
}

function showError(spanId, message) {
    const errorSpan = document.getElementById(spanId);
    if (errorSpan) {
        errorSpan.innerText = message;
        errorSpan.style.color = "red";
    }
}

function clearErrors() {
    const errorSpans = document.querySelectorAll(".error-message");
    errorSpans.forEach(span => {
        span.innerText = "";
    });
}

function debounce(func, delay) {
    let timeoutId;
    return function (...args) {
        if (timeoutId) clearTimeout(timeoutId);
        timeoutId = setTimeout(() => {
            func.apply(this, args);
        }, delay);
    };
}