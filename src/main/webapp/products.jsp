<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">

    <section class="prodotti-sezione">
        <h2>${not empty titoloCatalogo ? titoloCatalogo : 'Tutti i nostri prodotti'}</h2>

        <div class="products-grid">
            <c:choose>
                <c:when test="${not empty products}">
                    <c:forEach var="p" items="${products}">
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

                            <c:choose>
                                <c:when test="${p.quantity > 0}">
                                    <form action="${pageContext.request.contextPath}/Cart" method="POST" style="margin-bottom: 8px;">
                                        <input type="hidden" name="action" value="add">
                                        <input type="hidden" name="id" value="${p.id}">
                                        <button type="submit" class="btn-add">Aggiungi al carrello</button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <p style="color: var(--error-red); font-weight: 600; margin-bottom: 8px;">Esaurito</p>
                                </c:otherwise>
                            </c:choose>

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
    </section>

</main>

<%@ include file="fragments/footer.jsp" %>
