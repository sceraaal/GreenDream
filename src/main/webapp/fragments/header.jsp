<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetHouse - Tutto per i tuoi animali</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/logo.png">
</head>
<body>

<div id="side-menu" class="sidebar">
    <div class="sidebar-header">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="PetHouse Logo" class="sidebar-img-logo">
        <button class="close-btn" onclick="toggleMenu()">&times;</button>
    </div>
    
    <div class="sidebar-content">
        <h3 class="sidebar-title">Tutte le categorie</h3>
        
        <div class="sidebar-links">
            <a href="${pageContext.request.contextPath}/index.jsp" class="sidebar-item" onclick="toggleMenu()">
                <span class="sidebar-emoji">🏠</span>
                <span class="sidebar-text">
                    <strong>Home</strong>
                    <span>Ritorna alla vetrina</span>
                </span>
            </a>
            
            <hr class="sidebar-divider">
            
            <a href="${pageContext.request.contextPath}/ProductServlet?categoria=cane" class="sidebar-item" onclick="toggleMenu()">
                <span class="sidebar-emoji">🐶</span>
                <span class="sidebar-text">
                    <strong>Cane</strong>
                </span>
                <span class="sidebar-arrow">❯</span>
            </a>
            
            <a href="${pageContext.request.contextPath}/ProductServlet?categoria=gatto" class="sidebar-item" onclick="toggleMenu()">
                <span class="sidebar-emoji">🐱</span>
                <span class="sidebar-text">
                    <strong>Gatto</strong>
                </span>
                <span class="sidebar-arrow">❯</span>
            </a>
            
            <a href="${pageContext.request.contextPath}/ProductServlet?categoria=piccoli-animali" class="sidebar-item" onclick="toggleMenu()">
                <span class="sidebar-emoji">🐹</span>
                <span class="sidebar-text">
                    <strong>Piccoli animali</strong>
                    <span>Roditori, Uccelli, Pesci...</span>
                </span>
                <span class="sidebar-arrow">❯</span>
            </a>
            
            <hr class="sidebar-divider">
            
            <a href="${pageContext.request.contextPath}/register.jsp" class="sidebar-item highlight-item" onclick="toggleMenu()">
                <span class="sidebar-emoji">👤</span>
                <span class="sidebar-text">
                    <strong>Area Personale</strong>
                </span>
                <span class="sidebar-arrow">❯</span>
            </a>
        </div>
    </div>
</div>

<div id="menu-overlay" class="menu-overlay" onclick="toggleMenu()"></div>

<header>
    <div class="header-container">
        
        <div class="header-left">
            <div class="hamburger-wrapper" onclick="toggleMenu()" title="Apri Menu">
                <button class="menu-hamburger-btn">
                    <svg xmlns="http://www.w3.org/2000/svg" class="hamburger-svg" width="22" height="22" viewBox="0 0 24 24" version="1.1">
                        <path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"></path>
                    </svg>
                </button>
                <span class="hamburger-text">Categorie</span>
            </div>
            
            <a href="${pageContext.request.contextPath}/index.jsp" class="logo">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="PetHouse Logo">
            </a>
        </div>

        <div class="search-container">
            <input type="text" id="search-bar" placeholder="Cerca tra tutti i nostri prodotti...">
            <div id="search-results" class="suggestions-box" style="display: none;"></div>
        </div>

        <div class="header-right">
            
            <a href="${pageContext.request.contextPath}/index.jsp" class="header-action-item" title="Home">
                <span class="icon-circle">
                    <svg xmlns="http://www.w3.org/2000/svg" class="action-svg" width="24" height="24" viewBox="0 0 24 24" version="1.1">
                        <path d="M12 2.69l-9.38 7.5a1.5 1.5 0 0 0 .94 2.68H5v6.63A1.5 1.5 0 0 0 6.5 21h3a1.5 1.5 0 0 0 1.5-1.5v-3.5a1 1 0 0 1 2 0v3.5A1.5 1.5 0 0 0 14.5 21h3a1.5 1.5 0 0 0 1.5-1.5v-6.63h1.44a1.5 1.5 0 0 0 .94-2.68z"></path>
                    </svg>
                </span>
            </a>

            <a href="${pageContext.request.contextPath}/register.jsp" class="header-action-item">
                <span class="icon-circle">
                    <svg xmlns="http://www.w3.org/2000/svg" class="action-svg" width="26" height="26" viewBox="0 0 24 24" version="1.1">
                        <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path>
                    </svg>
                </span>
                <span class="action-text">
                    <strong>Accedi o registrati</strong>
                </span>
            </a>

            <a href="${pageContext.request.contextPath}/cart.jsp" class="header-action-item">
                <span class="icon-circle cart-circle">
                    <span class="cart-badge">0</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="action-svg" width="24" height="24" viewBox="0 0 24 24" version="1.1">
                        <path d="M7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.58-6.49c.08-.14.12-.31.12-.48 0-.55-.45-1-1-1H5.21l-.94-2H1zm16 16c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2z"></path>
                    </svg>
                </span>
                <span class="action-text">
                    <span>Il tuo carrello</span>
                    <strong>€ 0,00</strong>
                </span>
            </a>

        </div> </div> </header> <script>
function toggleMenu() {
    const menu = document.getElementById("side-menu");
    const overlay = document.getElementById("menu-overlay");
    menu.classList.toggle("open");
    overlay.classList.toggle("active");
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

document.addEventListener("DOMContentLoaded", () => {
    const searchBar = document.getElementById("search-bar");
    const resultsBox = document.getElementById("search-results");

    if (searchBar && resultsBox) {
        searchBar.addEventListener("input", debounce(() => {
            const query = searchBar.value.trim();
            
            if (query.length < 2) {
                resultsBox.innerHTML = "";
                resultsBox.style.display = "none";
                return;
            }

            const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf('/', 2));
            const url = contextPath + "/SearchServlet?query=" + encodeURIComponent(query);

            fetch(url)
                .then(response => {
                    if (!response.ok) throw new Error("Errore recupero suggerimenti");
                    return response.json(); 
                })
                .then(prodotti => {
                    resultsBox.innerHTML = "";

                    if (prodotti.length === 0) {
                        resultsBox.innerHTML = '<div class="suggestion-item" style="color: #7f8c8d; cursor: default;">Nessun prodotto trovato per "' + query + '"</div>';
                        resultsBox.style.display = "block";
                        return;
                    }

                    prodotti.forEach(prodotto => {
                        const item = document.createElement("div");
                        item.className = "suggestion-item";
                        
                        const prezzoHtml = prodotto.prezzo ? ' - <span style="color: #27ae60;">€' + prodotto.prezzo + '</span>' : '';
                        item.innerHTML = '🐾 <strong>' + prodotto.nome + '</strong>' + prezzoHtml;
                        
                        item.addEventListener("click", () => {
                            window.location.href = contextPath + "/ProductServlet?action=detail&id=" + prodotto.id;
                        });

                        resultsBox.appendChild(item);
                    });

                    resultsBox.style.display = "block";
                })
                .catch(error => console.error("Errore AJAX ricerca:", error));
        }, 300)); 

        document.addEventListener("click", (e) => {
            if (e.target !== searchBar && e.target !== resultsBox) {
                resultsBox.style.display = "none";
            }
        });
    }
});
</script>