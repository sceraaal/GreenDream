<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ tagjsp:directive.include file="fragments/header.jsp" %>
<%@ tagjsp:directive.include file="fragments/nav.jsp" %>
<%@ page import="java.util.List" %>
<%-- Importa  la classe Product del modello --%>
<main class="main-content">
    <section class="prodotti-sezione">
        <h2>Tutti i Nostri Prodotti</h2>
        
        <div class="products-grid">

            <% 
                List<?> products = (List<?>) request.getAttribute("productsList");
                if (products != null && !products.isEmpty()) {
                    for (Object p : products) {
                      
            %>
                        <div class="product-card">
                           
                            <p>Descrizione breve o categoria del prodotto.</p>
                            <span class="price">€ 19.90</span>
                            
                            <form action="CartServlet" method="POST">
                                <input type="hidden" name="productId" value="1">
                                <button type="submit" class="btn-add">Aggiungi al Carrello</button>
                            </form>
                        </div>
            <% 
                    }
                } else {
            %>
                <p>Nessun prodotto disponibile nel catalogo al momento.</p>
            <% 
                }
            %>
        </div>
    </section>
</main>

