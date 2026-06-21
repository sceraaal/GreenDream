<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <c:choose>
        <c:when test="${not empty product}">
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 40px; background: var(--white); padding: 40px; border-radius: 16px; border: 1px solid var(--border-color);">

                <div style="display: flex; justify-content: center; align-items: center;">
                    <c:choose>
                        <c:when test="${empty product.image}">
                            <div style="width: 100%; max-width: 400px; height: 300px; background: #f0f0f0; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 14px; color: #7f8c8d; font-weight: 500; text-transform: uppercase; letter-spacing: 0.5px;">Nessuna immagine</div>
                        </c:when>
                        <c:when test="${fn:startsWith(product.image, 'http')}">
                            <img src="${product.image}" alt="${product.name}"
                                 style="width: 100%; max-width: 400px; border-radius: 12px;">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/${product.image}" alt="${product.name}"
                                 style="width: 100%; max-width: 400px; border-radius: 12px;">
                        </c:otherwise>
                    </c:choose>
                </div>

                <div>
                    <h2 style="font-size: 32px; color: var(--dark-green); margin-bottom: 10px;">${product.name}</h2>
                    <p style="font-size: 16px; color: #7f8c8d; margin-bottom: 8px;">
                        Disponibilità:
                        <c:choose>
                            <c:when test="${product.quantity > 0}">
                                <span style="color: var(--primary-green); font-weight: 600;">${product.quantity} pezzi disponibili</span>
                            </c:when>
                            <c:otherwise>
                                <span style="color: var(--error-red); font-weight: 600;">Esaurito</span>
                            </c:otherwise>
                        </c:choose>
                    </p>
                    <p style="font-size: 14px; color: #7f8c8d; margin-bottom: 20px;">IVA inclusa: ${product.iva}%</p>

                    <p style="font-size: 18px; line-height: 1.6; margin-bottom: 30px;">
                        ${product.description}
                    </p>

                    <div style="margin-bottom: 30px;">
                        <span style="display:block; font-size: 13px; color: #7f8c8d; text-transform: uppercase; letter-spacing: 0.5px;">Prezzo al pezzo</span>
                        <span style="font-size: 36px; font-weight: 700; color: var(--primary-green);">
                            € <fmt:formatNumber value="${product.price}" pattern="#,##0.00"/>
                        </span>
                    </div>

                    <c:if test="${product.quantity > 0}">
                        <form action="${pageContext.request.contextPath}/Cart" method="POST">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="id" value="${product.id}">
                            <div class="form-group" style="max-width: 150px;">
                                <label for="quantita">Quantità</label>
                                <input type="number" id="quantita" name="quantity"
                                       value="1" min="1" max="${product.quantity}">
                            </div>
                            <button type="submit" class="btn-submit" style="max-width: 300px;">
                                Aggiungi al carrello
                            </button>
                        </form>
                    </c:if>

                    <div style="margin-top: 20px;">
                        <a href="${pageContext.request.contextPath}/Product?action=list"
                           style="color: var(--primary-green); text-decoration: none; font-weight: 600;">
                            ← Torna al catalogo
                        </a>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div style="text-align: center; padding: 60px;">
                <p style="font-size: 18px; color: #7f8c8d; margin-bottom: 20px;">Prodotto non trovato.</p>
                <a href="${pageContext.request.contextPath}/Product?action=list" class="btn-submit"
                   style="display: inline-block; width: auto; padding: 12px 30px; text-decoration: none;">
                    Torna al catalogo
                </a>
            </div>
        </c:otherwise>
    </c:choose>
</main>

<%@ include file="fragments/footer.jsp" %>
