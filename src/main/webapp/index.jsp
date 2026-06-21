<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

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
                <img src="https://images.unsplash.com/photo-1516734212186-a967f81ad0d7?auto=format&fit=crop&w=1200&q=80" alt="Accessori">
                <div class="slide-content">
                    <span class="badge">PREZZI PAZZI</span>
                    <h2>Accessori &amp; Comfort</h2>
                    <p>Cucce morbide e guinzagli hi-tech a prezzi mai visti.</p>
                </div>
            </div>
        </div>
    </section>

    <c:if test="${not empty sessionScope.successMessage}">
        <div style="background: #eef9f1; color: var(--primary-green); padding: 14px 20px; border-radius: 10px; margin-bottom: 20px; font-weight: 600;">
            ${sessionScope.successMessage}
            <c:remove var="successMessage" scope="session"/>
        </div>
    </c:if>

    <section class="prodotti-sezione">
        <h2>I Nostri Prodotti in Evidenza</h2>

        <div class="products-grid">
            <c:choose>
                <c:when test="${not empty products}">

                    <c:forEach var="p" items="${products}" end="3">
                        <div class="product-card">
                            <a href="${pageContext.request.contextPath}/Product?action=detail&id=${p.id}" style="text-decoration:none; color:inherit;">
                                <c:choose>
                                    <c:when test="${empty p.image}">
                                        <div style="width:100%; height:160px; background:#eef3f0; border-radius:8px; margin-bottom:10px; display:flex; align-items:center; justify-content:center; font-size:13px; color:#7f8c8d; font-weight:500; text-transform:uppercase; letter-spacing:0.5px;">Nessuna immagine</div>
                                    </c:when>
                                    <c:when test="${fn:startsWith(p.image, 'http')}">
                                        <img src="${p.image}" alt="${p.name}"
                                             style="width:100%; height:160px; object-fit:cover; border-radius:8px; margin-bottom:10px;">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/${p.image}" alt="${p.name}"
                                             style="width:100%; height:160px; object-fit:cover; border-radius:8px; margin-bottom:10px;">
                                    </c:otherwise>
                                </c:choose>
                                <h3>${p.name}</h3>
                            </a>
                            <p>${p.description}</p>
                            <span class="price">€ <fmt:formatNumber value="${p.price}" pattern="#,##0.00"/></span>

                            <form action="${pageContext.request.contextPath}/Cart" method="POST" style="margin-bottom: 8px;">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="id" value="${p.id}">
                                <button type="submit" class="btn-add">Aggiungi al carrello</button>
                            </form>

                            <a href="${pageContext.request.contextPath}/Product?action=detail&id=${p.id}"
                               style="display:block; text-align:center; color:var(--primary-green); text-decoration:none; font-weight:600; font-size:14px;">
                                Dettagli →
                            </a>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p style="color: #7f8c8d;">Nessun prodotto disponibile al momento.</p>
                </c:otherwise>
            </c:choose>
        </div>

        <div style="text-align: center; margin-top: 30px;">
            <a href="${pageContext.request.contextPath}/Product?action=list"
               class="btn-submit" style="display: inline-block; width: auto; padding: 12px 35px; text-decoration: none;">
                Vedi tutti i prodotti →
            </a>
        </div>
    </section>

</main>

<%@ include file="fragments/footer.jsp" %>
