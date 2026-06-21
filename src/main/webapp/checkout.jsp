<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">

    <c:if test="${empty sessionScope.cart or empty sessionScope.cart.items}">
        <div style="text-align: center; padding: 60px 20px;">
            <p style="font-size: 18px; color: #7f8c8d; margin-bottom: 20px;">Il tuo carrello è vuoto. Aggiungi qualche prodotto prima di procedere!</p>
            <a href="${pageContext.request.contextPath}/Product?action=list" class="btn-submit" style="display: inline-block; width: auto; padding: 12px 30px;">
                Vai ai prodotti
            </a>
        </div>
    </c:if>

    <c:if test="${not empty sessionScope.cart and not empty sessionScope.cart.items}">

        <div class="fattura-container">

            <div class="fattura-header">
                <div>
                    <h2>Riepilogo Ordine / Fattura</h2>
                    <p style="margin-top: 6px; color: #7f8c8d;">Verifica i tuoi prodotti prima di confermare</p>
                </div>
                <div style="text-align: right;">
                    <h3 style="color: var(--dark-green);">PetHouse S.r.l.</h3>
                    <p>Via degli Animali, 123</p>
                    <p>P.IVA 1234567890</p>
                    <c:if test="${not empty sessionScope.user}">
                        <p style="margin-top: 8px; font-weight: 600;">
                            Cliente: ${sessionScope.user.firstName} ${sessionScope.user.lastName}
                        </p>
                        <p style="color: #7f8c8d;">${sessionScope.user.email}</p>
                    </c:if>
                </div>
            </div>

            <table class="fattura-table">
                <thead>
                    <tr>
                        <th>Descrizione Prodotto</th>
                        <th style="text-align: center;">Quantità</th>
                        <th style="text-align: right;">Prezzo Unitario</th>
                        <th style="text-align: right;">IVA</th>
                        <th style="text-align: right;">Totale</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${sessionScope.cart.items}">
                        <tr>
                            <td>${item.product.name}</td>
                            <td style="text-align: center;">${item.quantity}</td>
                            <td style="text-align: right;">
                                € <fmt:formatNumber value="${item.product.price}" pattern="#,##0.00"/>
                            </td>
                            <td style="text-align: right;">${item.product.iva}%</td>
                            <td style="text-align: right;">
                                € <fmt:formatNumber value="${item.product.price * item.quantity}" pattern="#,##0.00"/>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="fattura-totale">
                Totale ordine: € <fmt:formatNumber value="${sessionScope.cart.totalPrice}" pattern="#,##0.00"/>
            </div>

            <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 40px; flex-wrap: wrap; gap: 15px;" class="no-print">

                <a href="${pageContext.request.contextPath}/Cart?action=view"
                   class="btn-submit" style="width: auto; padding: 12px 25px; background: #7f8c8d; display: inline-block; text-decoration: none;">
                    ← Torna al carrello
                </a>

                <div style="display: flex; gap: 15px; flex-wrap: wrap;">
                    <button onclick="window.print()" class="btn-submit" style="width: auto; padding: 12px 25px; background: #2980b9;">
                        Stampa / Salva PDF
                    </button>

                    <form action="${pageContext.request.contextPath}/Checkout" method="POST">
                        <button type="submit" class="btn-submit" style="width: auto; padding: 12px 30px;">
                            Conferma ordine
                        </button>
                    </form>
                </div>
            </div>

        </div>
    </c:if>

</main>

<%@ include file="fragments/footer.jsp" %>
