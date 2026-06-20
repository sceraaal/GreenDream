<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <div style="background: var(--white); padding: 40px; border-radius: 16px; border: 1px solid var(--border-color); margin-bottom: 40px;">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
            <h2>Gestione Prodotti</h2>
            <button class="btn-submit" style="width: auto; padding: 10px 20px;">+ Nuovo Prodotto</button>
        </div>
        
        <table style="width: 100%; border-collapse: collapse;">
            <thead>
                <tr style="border-bottom: 2px solid var(--border-color);">
                    <th style="text-align: left; padding: 15px;">ID</th>
                    <th style="text-align: left; padding: 15px;">Nome</th>
                    <th style="text-align: right; padding: 15px;">Prezzo</th>
                    <th style="text-align: center; padding: 15px;">Azioni</th>
                </tr>
            </thead>
            <tbody>
                <tr style="border-bottom: 1px solid var(--border-color);">
                    <td style="padding: 15px;">1</td>
                    <td style="padding: 15px;">Croccantini Premium</td>
                    <td style="text-align: right; padding: 15px;">€ 39,90</td>
                    <td style="text-align: center; padding: 15px;">
                        <button style="background: none; border: none; color: #f39c12; cursor: pointer; margin-right: 10px;">Modifica</button>
                        <button onclick="showConfirmModal('Attenzione', 'Vuoi davvero cancellare questo prodotto?', () => { showToast('Prodotto cancellato!'); })" style="background: none; border: none; color: var(--error-red); cursor: pointer;">Cancella</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div style="background: var(--white); padding: 40px; border-radius: 16px; border: 1px solid var(--border-color);">
        <h2 style="margin-bottom: 30px;">Gestione Ordini</h2>
        <table style="width: 100%; border-collapse: collapse;">
            <thead>
                <tr style="border-bottom: 2px solid var(--border-color);">
                    <th style="text-align: left; padding: 15px;">Ordine #</th>
                    <th style="text-align: left; padding: 15px;">Cliente</th>
                    <th style="text-align: right; padding: 15px;">Totale</th>
                </tr>
            </thead>
            <tbody>
                <tr style="border-bottom: 1px solid var(--border-color);">
                    <td style="padding: 15px;">#ORD-9982</td>
                    <td style="padding: 15px;">Mario Rossi</td>
                    <td style="text-align: right; padding: 15px;">€ 39,90</td>
                </tr>
            </tbody>
        </table>
    </div>
</main>

<%@ include file="fragments/footer.jsp" %>