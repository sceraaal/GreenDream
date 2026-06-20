<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <div class="fattura-container">
        
        <div class="fattura-header">
            <div>
                <h2>Riepilogo Ordine / Fattura</h2>
                <p><strong>Ordine #102938</strong></p>
                <p>Data: 19 Giugno 2026</p>
            </div>
            <div style="text-align: right;">
                <h3 style="color: var(--dark-green);">PetHouse S.r.l.</h3>
                <p>Via degli Animali, 123</p>
                <p>P.IVA 1234567890</p>
            </div>
        </div>

        <table class="fattura-table">
            <thead>
                <tr>
                    <th>Descrizione Prodotto</th>
                    <th>Quantità</th>
                    <th>Prezzo Unitario</th>
                    <th>Totale</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Croccantini per Cani Premium 10kg</td>
                    <td>1</td>
                    <td>€ 35,00</td>
                    <td>€ 35,00</td>
                </tr>
                <tr>
                    <td>Tiragraffi ad albero per Gatti (Alto)</td>
                    <td>1</td>
                    <td>€ 45,50</td>
                    <td>€ 45,50</td>
                </tr>
                <tr>
                    <td>Spedizione Corriere Espresso</td>
                    <td>1</td>
                    <td>€ 5,00</td>
                    <td>€ 5,00</td>
                </tr>
            </tbody>
        </table>

        <div class="fattura-totale">
            Totale pagato: € 85,50
        </div>

        <div style="text-align: center; margin-top: 40px;" class="no-print">
            <button onclick="window.print()" class="btn-submit" style="width: auto; padding: 12px 30px;">
                🖨️ Stampa Fattura / Salva in PDF
            </button>
            <p style="margin-top: 15px; font-size: 14px; color: #7f8c8d;">
                Premi questo bottone per testare la Media Query di stampa!
            </p>
        </div>

    </div>
</main>

<%@ include file="fragments/footer.jsp" %>