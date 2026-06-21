<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">

    <h2 style="margin-bottom: 25px;">Il tuo carrello</h2>

    <c:if test="${not empty errorMessage}">
        <div style="color: var(--error-red); background: #fdf2f2; padding: 12px 18px; border-radius: 10px; margin-bottom: 20px;">
            ${errorMessage}
        </div>
    </c:if>

    <c:choose>
        <c:when test="${not empty sessionScope.cart and not empty sessionScope.cart.items}">

            <div style="background: var(--white); padding: 30px; border-radius: 16px; border: 1px solid var(--border-color);">
                <table style="width: 100%; border-collapse: collapse;">
                    <thead>
                        <tr style="border-bottom: 2px solid var(--border-color);">
                            <th style="text-align: left; padding: 12px;">Prodotto</th>
                            <th style="text-align: right; padding: 12px;">Prezzo</th>
                            <th style="text-align: center; padding: 12px;">Quantità</th>
                            <th style="text-align: right; padding: 12px;">Subtotale</th>
                            <th style="text-align: center; padding: 12px;">Azioni</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${sessionScope.cart.items}">
                            <tr style="border-bottom: 1px solid var(--border-color);">
                                <td style="padding: 12px; font-weight: 600;">
                                    <a href="${pageContext.request.contextPath}/Product?action=detail&id=${item.product.id}"
                                       style="color: var(--dark-green); text-decoration: none;">
                                        ${item.product.name}
                                    </a>
                                </td>
                                <td style="text-align: right; padding: 12px;">
                                    € <fmt:formatNumber value="${item.product.price}" pattern="#,##0.00"/>
                                </td>
                                <td style="text-align: center; padding: 12px;">

                                    <form action="${pageContext.request.contextPath}/Cart" method="POST"
                                          style="display: inline-flex; gap: 6px; align-items: center;">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="id" value="${item.product.id}">
                                        <input type="number" name="quantity" value="${item.quantity}" min="0"
                                               style="width: 64px; padding: 6px; border: 1px solid var(--border-color); border-radius: 6px; text-align: center;">
                                        <button type="submit" class="btn-submit" style="width: auto; padding: 6px 12px; font-size: 13px;">Aggiorna</button>
                                    </form>
                                </td>
                                <td style="text-align: right; padding: 12px;">
                                    € <fmt:formatNumber value="${item.product.price * item.quantity}" pattern="#,##0.00"/>
                                </td>
                                <td style="text-align: center; padding: 12px;">

                                    <form action="${pageContext.request.contextPath}/Cart" method="POST" style="display: inline;">
                                        <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="id" value="${item.product.id}">
                                        <button type="submit" style="background: none; border: none; color: var(--error-red); cursor: pointer; font-weight: 600;">
                                            Rimuovi
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div style="text-align: right; margin-top: 25px; font-size: 22px; font-weight: 700; color: var(--dark-green);">
                    Totale: € <fmt:formatNumber value="${sessionScope.cart.totalPrice}" pattern="#,##0.00"/>
                </div>

                <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 30px; flex-wrap: wrap; gap: 15px;">
                    <a href="${pageContext.request.contextPath}/Product?action=list"
                       class="btn-submit" style="width: auto; padding: 12px 25px; background: #7f8c8d; text-decoration: none; display: inline-block;">
                        ← Continua lo shopping
                    </a>
                    <a href="${pageContext.request.contextPath}/checkout.jsp"
                       class="btn-submit" style="width: auto; padding: 12px 30px; text-decoration: none; display: inline-block;">
                        Procedi al checkout →
                    </a>
                </div>
            </div>

        </c:when>
        <c:otherwise>
            <div style="text-align: center; padding: 60px 20px; background: var(--white); border-radius: 16px; border: 1px solid var(--border-color);">
                <p style="font-size: 18px; color: #7f8c8d; margin-bottom: 20px;">Il tuo carrello è vuoto.</p>
                <a href="${pageContext.request.contextPath}/Product?action=list"
                   class="btn-submit" style="display: inline-block; width: auto; padding: 12px 30px; text-decoration: none;">
                    Scopri i prodotti
                </a>
            </div>
        </c:otherwise>
    </c:choose>

</main>

<%@ include file="fragments/footer.jsp" %>
