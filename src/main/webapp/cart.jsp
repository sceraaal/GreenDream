<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <div style="background: var(--white); padding: 40px; border-radius: 16px; border: 1px solid var(--border-color);">
        <h2 style="margin-bottom: 30px;">Il tuo carrello 🛒</h2>
        
        <table style="width: 100%; border-collapse: collapse; margin-bottom: 30px;">
            <thead>
                <tr style="border-bottom: 2px solid var(--border-color);">
                    <th style="text-align: left; padding: 15px;">Prodotto</th>
                    <th style="text-align: center; padding: 15px;">Quantità</th>
                    <th style="text-align: right; padding: 15px;">Prezzo</th>
                    <th style="text-align: center; padding: 15px;">Azioni</th>
                </tr>
            </thead>
            <tbody>
                <tr style="border-bottom: 1px solid var(--border-color);">
                    <td style="padding: 15px;">Croccantini Premium (10kg)</td>
                    <td style="text-align: center; padding: 15px;">
                        <input type="number" value="1" min="1" style="width: 50px;">
                    </td>
                    <td style="text-align: right; padding: 15px;">€ 39,90</td>
                    <td style="text-align: center; padding: 15px;">
                        <button style="background: none; border: none; color: var(--error-red); cursor: pointer;">Rimuovi</button>
                    </td>
                </tr>
            </tbody>
        </table>

        <div style="text-align: right; font-size: 20px; font-weight: 700; margin-bottom: 30px;">
            Totale: € 39,90
        </div>

        <div style="display: flex; justify-content: space-between;">
            <a href="${pageContext.request.contextPath}/index.jsp" class="btn-submit" style="background: #7f8c8d;">Continua lo shopping</a>
            <a href="${pageContext.request.contextPath}/checkout.jsp" class="btn-submit">Procedi al checkout</a>
        </div>
    </div>
</main>

<%@ include file="fragments/footer.jsp" %>