<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 40px; background: var(--white); padding: 40px; border-radius: 16px; border: 1px solid var(--border-color);">
        
        <div style="display: flex; justify-content: center; align-items: center;">
            <img src="${pageContext.request.contextPath}/images/prodotto-esempio.jpg" alt="Prodotto" style="width: 100%; max-width: 400px; border-radius: 12px;">
        </div>

        <div>
            <h2 style="font-size: 32px; color: var(--dark-green); margin-bottom: 10px;">Nome del Prodotto</h2>
            <p style="font-size: 16px; color: #7f8c8d; margin-bottom: 20px;">Categoria: Cane / Cibo Secco</p>
            
            <p style="font-size: 18px; line-height: 1.6; margin-bottom: 30px;">
                Descrizione dettagliata del prodotto. Qui verranno inserite tutte le caratteristiche tecniche, gli ingredienti e i benefici per l'animale.
            </p>

            <div style="font-size: 32px; font-weight: 700; color: var(--primary-green); margin-bottom: 30px;">
                € 39,90
            </div>

            <form action="${pageContext.request.contextPath}/CartServlet" method="POST">
                <input type="hidden" name="id" value="123">
                <div class="form-group" style="max-width: 150px;">
                    <label for="quantita">Quantità</label>
                    <input type="number" id="quantita" name="quantita" value="1" min="1" max="99">
                </div>
                <button type="submit" class="btn-submit" style="max-width: 300px;">Aggiungi al carrello</button>
            </form>
        </div>
    </div>
</main>

<%@ include file="fragments/footer.jsp" %>