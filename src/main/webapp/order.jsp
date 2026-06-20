<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <div style="background: var(--white); padding: 40px; border-radius: 16px; border: 1px solid var(--border-color);">
        <h2 style="margin-bottom: 30px;">I tuoi ordini passati 📦</h2>
        
        <table style="width: 100%; border-collapse: collapse;">
            <thead>
                <tr style="border-bottom: 2px solid var(--border-color);">
                    <th style="text-align: left; padding: 15px;">Ordine #</th>
                    <th style="text-align: center; padding: 15px;">Data</th>
                    <th style="text-align: right; padding: 15px;">Totale</th>
                    <th style="text-align: center; padding: 15px;">Stato</th>
                    <th style="text-align: center; padding: 15px;">Dettagli</th>
                </tr>
            </thead>
            <tbody>
                <tr style="border-bottom: 1px solid var(--border-color);">
                    <td style="padding: 15px; font-weight: 600;">#ORD-9982</td>
                    <td style="text-align: center; padding: 15px;">19/06/2026</td>
                    <td style="text-align: right; padding: 15px;">€ 85,50</td>
                    <td style="text-align: center; padding: 15px;">
                        <span style="background: #eef9f1; color: var(--primary-green); padding: 5px 10px; border-radius: 4px; font-size: 12px; font-weight: 600;">Consegnato</span>
                    </td>
                    <td style="text-align: center; padding: 15px;">
                        <a href="${pageContext.request.contextPath}/checkout.jsp" style="color: var(--primary-green); text-decoration: none; font-weight: 600;">Vedi</a>
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid var(--border-color);">
                    <td style="padding: 15px; font-weight: 600;">#ORD-8841</td>
                    <td style="text-align: center; padding: 15px;">12/05/2026</td>
                    <td style="text-align: right; padding: 15px;">€ 24,90</td>
                    <td style="text-align: center; padding: 15px;">
                        <span style="background: #fdf2f2; color: var(--error-red); padding: 5px 10px; border-radius: 4px; font-size: 12px; font-weight: 600;">Annullato</span>
                    </td>
                    <td style="text-align: center; padding: 15px;">
                        <a href="#" style="color: var(--primary-green); text-decoration: none; font-weight: 600;">Vedi</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</main>

<%@ include file="fragments/footer.jsp" %>