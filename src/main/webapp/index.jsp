<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<main class="main-content">
    <section class="slider-container">
        <div class="slider">
            
            <div class="slide">
                <img src="https://images.unsplash.com/photo-1543466835-00a7907e9de1?auto=format&fit=crop&w=1200&q=80" alt="Sconti Cani">
                <div class="slide-content">
                    <span class="badge">-20% SU TUTTO</span>
                    <h2>Speciale Amici Cani</h2>
                    <p>Croccantini, snack e giochi in super offerta questa settimana!</p>
                </div>
            </div>
            

            <div class="slide">
                <img src="https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?auto=format&fit=crop&w=1200&q=80" alt="Sconti Gatti">
                <div class="slide-content">
                    <span class="badge">PROMO APRILE</span>
                    <h2>Il Mese del Gatto</h2>
                    <p>Fino al 30% di sconto su tiragraffi e lettiere premium.</p>
                </div>
            </div>

            <div class="slide">
                <img src="https://images.unsplash.com/photo-1516734212186-a967f81ad0d7?auto=format&fit=crop&w=1200&q=80" alt="Sconti Accessori">
                <div class="slide-content">
                    <span class="badge">PREZZI PAZZI</span>
                    <h2>Accessori &amp; Comfort</h2>
                    <p>Cucce morbide e guinzagli hi-tech a prezzi mai visti.</p>
                </div>
            </div>
           

        </div>
    </section>

    <section class="prodotti-sezione">
        <h2>I Nostri Prodotti in Evidenza</h2>
        <div class="products-grid">
            <div class="product-card">
                <h3>Croccantini Premium Cane</h3>
                <p>Cibo secco bilanciato - Sacco da 10kg</p>
                <span class="price">€ 39.90</span>
                <button class="btn-add">Aggiungi al carrello</button>
            </div>
            <div class="product-card">
                <h3>Tiragraffi a Torre Gatto</h3>
                <p>Gioco interattivo in corda h 120cm</p>
                <span class="price">€ 19.99</span>
                <button class="btn-add">Aggiungi al carrello</button>
            </div>
        </div>
    </section>
</main>

<%@ include file="fragments/footer.jsp" %>