<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <div style="background: var(--white); padding: 40px; border-radius: 16px; border: 1px solid var(--border-color);">
        <h2 style="margin-bottom: 30px;">I tuoi ordini passati</h2>

        <c:choose>
            <c:when test="${not empty orders}">
                <table style="width: 100%; border-collapse: collapse;">
                    <thead>
                        <tr style="border-bottom: 2px solid var(--border-color);">
                            <th style="text-align: left; padding: 15px;">Ordine #</th>
                            <th style="text-align: center; padding: 15px;">Data</th>
                            <th style="text-align: right; padding: 15px;">Totale</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${orders}">
                            <tr style="border-bottom: 1px solid var(--border-color);">
                                <td style="padding: 15px; font-weight: 600;">#ORD-${order.id}</td>
                                <td style="text-align: center; padding: 15px;">

                                    <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/>
                                </td>
                                <td style="text-align: right; padding: 15px;">
                                    € <fmt:formatNumber value="${order.total}" pattern="#,##0.00"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div style="text-align: center; padding: 40px;">
                    <p style="font-size: 18px; color: #7f8c8d; margin-bottom: 20px;">Non hai ancora effettuato nessun ordine.</p>
                    <a href="${pageContext.request.contextPath}/Product?action=list"
                       class="btn-submit" style="display: inline-block; width: auto; padding: 12px 30px;">
                        Scopri i prodotti
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>

<%@ include file="fragments/footer.jsp" %>
