<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="fragments/header.jsp" %>
<%@ include file="fragments/nav.jsp" %>

<main class="main-content">
    <div class="prodotti-sezione">
        <h2 id="category-title">Prodotti per i tuoi amici</h2>
        
        <div class="products-grid">
            <div class="product-card">
                <h3>Esempio Prodotto</h3>
                <p>Descrizione breve</p>
                <span class="price">€ 0,00</span>
                <a href="${pageContext.request.contextPath}/productDetails.jsp" class="btn-add">Dettagli</a>
            </div>
            <div class="product-card">
                <h3>Esempio Prodotto</h3>
                <p>Descrizione breve</p>
                <span class="price">€ 0,00</span>
                <a href="${pageContext.request.contextPath}/productDetails.jsp" class="btn-add">Dettagli</a>
            </div>
        </div>
    </div>
</main>

<%@ include file="fragments/footer.jsp" %>