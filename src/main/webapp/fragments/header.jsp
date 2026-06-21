<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetHouse - Tutto per i tuoi animali</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64'%3E%3Cg fill='%232e9e5b'%3E%3Cellipse cx='32' cy='44' rx='14' ry='11'/%3E%3Ccircle cx='16' cy='28' r='6'/%3E%3Ccircle cx='26' cy='20' r='6'/%3E%3Ccircle cx='38' cy='20' r='6'/%3E%3Ccircle cx='48' cy='28' r='6'/%3E%3C/g%3E%3C/svg%3E">
</head>
<body>

<div id="side-menu" class="sidebar">
    <div class="sidebar-header">
        <span class="sidebar-img-logo" style="display:inline-flex; align-items:center; gap:8px; font-size:20px; font-weight:800; color:var(--dark-green);">
            <svg width="30" height="30" viewBox="0 0 64 64" aria-hidden="true"><g fill="currentColor"><ellipse cx="32" cy="44" rx="14" ry="11"/><circle cx="16" cy="28" r="6"/><circle cx="26" cy="20" r="6"/><circle cx="38" cy="20" r="6"/><circle cx="48" cy="28" r="6"/></g></svg>
            PetHouse
        </span>
        <button class="close-btn" onclick="toggleMenu()">&times;</button>
    </div>

    <div class="sidebar-content">
        <h3 class="sidebar-title">Tutte le categorie</h3>

        <div class="sidebar-links">
            <a href="${pageContext.request.contextPath}/home" class="sidebar-item" onclick="toggleMenu()">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="margin-right: 8px; color: var(--dark-green);"><path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
                <span class="sidebar-text">
                    <strong>Home</strong>
                    <span>Ritorna alla vetrina</span>
                </span>
            </a>

            <hr class="sidebar-divider">

            <a href="${pageContext.request.contextPath}/Product?action=list" class="sidebar-item" onclick="toggleMenu()">
                <span class="sidebar-text">
                    <strong>Tutti i prodotti</strong>
                </span>
                <span class="sidebar-arrow">❯</span>
            </a>

            <a href="${pageContext.request.contextPath}/Product?action=list&categoria=cane" class="sidebar-item" onclick="toggleMenu()">
                <span class="sidebar-text">
                    <strong>Cane</strong>
                </span>
                <span class="sidebar-arrow">❯</span>
            </a>

            <a href="${pageContext.request.contextPath}/Product?action=list&categoria=gatto" class="sidebar-item" onclick="toggleMenu()">
                <span class="sidebar-text">
                    <strong>Gatto</strong>
                </span>
                <span class="sidebar-arrow">❯</span>
            </a>

            <a href="${pageContext.request.contextPath}/Product?action=list&categoria=piccoli-animali" class="sidebar-item" onclick="toggleMenu()">
                <span class="sidebar-text">
                    <strong>Piccoli animali</strong>
                    <span>Roditori, Uccelli, Pesci...</span>
                </span>
                <span class="sidebar-arrow">❯</span>
            </a>

            <hr class="sidebar-divider">

            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/Order" class="sidebar-item highlight-item" onclick="toggleMenu()">
                        <span class="sidebar-text">
                            <strong>I miei ordini</strong>
                            <span>Ciao, ${sessionScope.user.firstName}!</span>
                        </span>
                        <span class="sidebar-arrow">❯</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/Login?action=logout" class="sidebar-item" onclick="toggleMenu()">
                        <span class="sidebar-text">
                            <strong>Logout</strong>
                        </span>
                        <span class="sidebar-arrow">❯</span>
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login.jsp" class="sidebar-item highlight-item" onclick="toggleMenu()">
                        <span class="sidebar-text">
                            <strong>Accedi</strong>
                            <span>Entra nel tuo account</span>
                        </span>
                        <span class="sidebar-arrow">❯</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/register.jsp" class="sidebar-item" onclick="toggleMenu()">
                        <span class="sidebar-text">
                            <strong>Registrati</strong>
                        </span>
                        <span class="sidebar-arrow">❯</span>
                    </a>
                </c:otherwise>
            </c:choose>

            <c:if test="${sessionScope.isAdmin == true}">
                <hr class="sidebar-divider">
                <a href="${pageContext.request.contextPath}/admin/Dashboard" class="sidebar-item" onclick="toggleMenu()">
                    <span class="sidebar-text">
                        <strong>Area Admin</strong>
                        <span>Gestione prodotti e ordini</span>
                    </span>
                    <span class="sidebar-arrow">❯</span>
                </a>
            </c:if>
        </div>
    </div>
</div>

<div id="menu-overlay" class="menu-overlay" onclick="toggleMenu()"></div>

<header>
    <div class="header-container">

        <div class="header-left">
            <div class="hamburger-wrapper" onclick="toggleMenu()" title="Apri Menu">
                <button class="menu-hamburger-btn">
                    <svg xmlns="http://www.w3.org/2000/svg" class="hamburger-svg" width="22" height="22" viewBox="0 0 24 24">
                        <path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"></path>
                    </svg>
                </button>
                <span class="hamburger-text">Categorie</span>
            </div>

            <a href="${pageContext.request.contextPath}/home" class="logo" style="display:inline-flex; align-items:center; gap:8px; text-decoration:none;">
                <svg width="34" height="34" viewBox="0 0 64 64" aria-hidden="true"><g fill="#2e9e5b"><ellipse cx="32" cy="44" rx="14" ry="11"/><circle cx="16" cy="28" r="6"/><circle cx="26" cy="20" r="6"/><circle cx="38" cy="20" r="6"/><circle cx="48" cy="28" r="6"/></g></svg>
                <span style="font-size:24px; font-weight:800; color:var(--dark-green);">PetHouse</span>
            </a>
        </div>

        <div class="search-container">
            <input type="text" id="search-bar" placeholder="Cerca tra tutti i nostri prodotti...">
            <div id="search-results" class="suggestions-box" style="display: none;"></div>
        </div>

        <div class="header-right">

            <a href="${pageContext.request.contextPath}/home" class="header-action-item" title="Home">
                <span class="icon-circle">
                    <svg xmlns="http://www.w3.org/2000/svg" class="action-svg" width="24" height="24" viewBox="0 0 24 24">
                        <path d="M12 2.69l-9.38 7.5a1.5 1.5 0 0 0 .94 2.68H5v6.63A1.5 1.5 0 0 0 6.5 21h3a1.5 1.5 0 0 0 1.5-1.5v-3.5a1 1 0 0 1 2 0v3.5A1.5 1.5 0 0 0 14.5 21h3a1.5 1.5 0 0 0 1.5-1.5v-6.63h1.44a1.5 1.5 0 0 0 .94-2.68z"></path>
                    </svg>
                </span>
            </a>

            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/Order" class="header-action-item">
                        <span class="icon-circle">
                            <svg xmlns="http://www.w3.org/2000/svg" class="action-svg" width="26" height="26" viewBox="0 0 24 24">
                                <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path>
                            </svg>
                        </span>
                        <span class="action-text">
                            <span>Bentornato</span>
                            <strong>${sessionScope.user.firstName}</strong>
                        </span>
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login.jsp" class="header-action-item">
                        <span class="icon-circle">
                            <svg xmlns="http://www.w3.org/2000/svg" class="action-svg" width="26" height="26" viewBox="0 0 24 24">
                                <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path>
                            </svg>
                        </span>
                        <span class="action-text">
                            <strong>Accedi o registrati</strong>
                        </span>
                    </a>
                </c:otherwise>
            </c:choose>

            <a href="${pageContext.request.contextPath}/Cart?action=view" class="header-action-item">
                <span class="icon-circle cart-circle">
                    <c:choose>
                        <c:when test="${not empty sessionScope.cart and not empty sessionScope.cart.items}">
                            <span class="cart-badge">${sessionScope.cart.items.size()}</span>
                        </c:when>
                        <c:otherwise>
                            <span class="cart-badge">0</span>
                        </c:otherwise>
                    </c:choose>
                    <svg xmlns="http://www.w3.org/2000/svg" class="action-svg" width="24" height="24" viewBox="0 0 24 24">
                        <path d="M7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.58-6.49c.08-.14.12-.31.12-.48 0-.55-.45-1-1-1H5.21l-.94-2H1zm16 16c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2z"></path>
                    </svg>
                </span>
                <span class="action-text">
                    <span>Il tuo carrello</span>
                    <c:choose>
                        <c:when test="${not empty sessionScope.cart}">
                            <strong>€ <fmt:formatNumber value="${sessionScope.cart.totalPrice}" pattern="#,##0.00"/></strong>
                        </c:when>
                        <c:otherwise>
                            <strong>€ 0,00</strong>
                        </c:otherwise>
                    </c:choose>
                </span>
            </a>

        </div>
    </div>
</header>

<script>
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
        timeoutId = setTimeout(() => func.apply(this, args), delay);
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
            fetch(contextPath + "/SearchSuggestions?q=" + encodeURIComponent(query))
                .then(r => { if (!r.ok) throw new Error(); return r.json(); })
                .then(prodotti => {
                    resultsBox.innerHTML = "";
                    if (prodotti.length === 0) {
                        resultsBox.innerHTML = '<div class="suggestion-item" style="color:#7f8c8d;cursor:default;">Nessun prodotto trovato</div>';
                        resultsBox.style.display = "block";
                        return;
                    }
                    prodotti.forEach(p => {
                        const item = document.createElement("div");
                        item.className = "suggestion-item";
                        item.innerHTML = '<strong>' + p.name + '</strong>';
                        item.addEventListener("click", () => {
                            window.location.href = contextPath + "/Product?action=detail&id=" + p.id;
                        });
                        resultsBox.appendChild(item);
                    });
                    resultsBox.style.display = "block";
                })
                .catch(() => {});
        }, 300));

        document.addEventListener("click", e => {
            if (e.target !== searchBar) resultsBox.style.display = "none";
        });
    }
});
</script>
