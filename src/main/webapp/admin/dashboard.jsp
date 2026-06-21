<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/fragments/header.jsp" %>
<%@ include file="/fragments/nav.jsp" %>

<main class="main-content">

    <c:if test="${not empty sessionScope.successMessage}">
        <div style="color: var(--primary-green); background: #eef9f1; padding: 10px 15px; border-radius: 8px; margin-bottom: 20px;">
            ${sessionScope.successMessage}
            <c:remove var="successMessage" scope="session"/>
        </div>
    </c:if>
    <c:if test="${not empty sessionScope.errorMessage}">
        <div style="color: var(--error-red); background: #fdf2f2; padding: 10px 15px; border-radius: 8px; margin-bottom: 20px;">
            ${sessionScope.errorMessage}
            <c:remove var="errorMessage" scope="session"/>
        </div>
    </c:if>

    <div style="background: var(--white); padding: 40px; border-radius: 16px; border: 1px solid var(--border-color); margin-bottom: 40px;">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
            <h2>Gestione Prodotti</h2>
            <button onclick="toggleForm('form-nuovo-prodotto')"
                    class="btn-submit" style="width: auto; padding: 10px 20px;">+ Nuovo Prodotto</button>
        </div>

        <div id="form-nuovo-prodotto" style="display:none; background: #f9f9f9; padding: 30px; border-radius: 12px; margin-bottom: 30px; border: 1px solid var(--border-color);">
            <h3 style="margin-bottom: 20px;">Inserisci nuovo prodotto</h3>
            <form action="${pageContext.request.contextPath}/Product" method="POST">
                <input type="hidden" name="action" value="insert">
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                    <div class="form-group">
                        <label>Nome</label>
                        <input type="text" name="name" placeholder="Nome del prodotto" required>
                    </div>
                    <div class="form-group">
                        <label>Prezzo (€)</label>
                        <input type="number" name="price" step="0.01" min="0" placeholder="es. 12.99" required>
                    </div>
                    <div class="form-group">
                        <label>IVA (%)</label>
                        <input type="number" name="iva" value="22" min="0" max="100" required>
                    </div>
                    <div class="form-group">
                        <label>Quantità disponibile</label>
                        <input type="number" name="quantity" min="0" placeholder="es. 50" required>
                    </div>
                    <div class="form-group">
                        <label>Categoria</label>
                        <select name="category" required style="padding:11px 14px; border:1px solid var(--border-color); border-radius:10px;">
                            <option value="cane">Cane</option>
                            <option value="gatto">Gatto</option>
                            <option value="piccoli-animali">Piccoli animali</option>
                        </select>
                    </div>
                    <div class="form-group" style="grid-column: 1 / -1;">
                        <label>Descrizione</label>
                        <input type="text" name="description" placeholder="Descrizione breve del prodotto">
                    </div>
                    <div class="form-group" style="grid-column: 1 / -1;">
                        <label>Immagine (percorso relativo)</label>
                        <input type="text" name="image" placeholder="es. images/prodotto.jpg">
                    </div>
                </div>
                <div style="display: flex; gap: 10px; margin-top: 10px;">
                    <button type="submit" class="btn-submit" style="width: auto; padding: 10px 20px;">Salva prodotto</button>
                    <button type="button" onclick="toggleForm('form-nuovo-prodotto')"
                            class="btn-submit" style="width: auto; padding: 10px 20px; background: #7f8c8d;">Annulla</button>
                </div>
            </form>
        </div>

        <div id="form-modifica-prodotto" style="display:none; background: #fff8e1; padding: 30px; border-radius: 12px; margin-bottom: 30px; border: 1px solid #f0c040;">
            <h3 style="margin-bottom: 20px;">Modifica prodotto</h3>
            <form action="${pageContext.request.contextPath}/Product" method="POST">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" id="edit-id">
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                    <div class="form-group">
                        <label>Nome</label>
                        <input type="text" name="name" id="edit-name" required>
                    </div>
                    <div class="form-group">
                        <label>Prezzo (€)</label>
                        <input type="number" name="price" id="edit-price" step="0.01" min="0" required>
                    </div>
                    <div class="form-group">
                        <label>IVA (%)</label>
                        <input type="number" name="iva" id="edit-iva" min="0" max="100" required>
                    </div>
                    <div class="form-group">
                        <label>Quantità disponibile</label>
                        <input type="number" name="quantity" id="edit-quantity" min="0" required>
                    </div>
                    <div class="form-group">
                        <label>Categoria</label>
                        <select name="category" id="edit-category" required style="padding:11px 14px; border:1px solid var(--border-color); border-radius:10px;">
                            <option value="cane">Cane</option>
                            <option value="gatto">Gatto</option>
                            <option value="piccoli-animali">Piccoli animali</option>
                        </select>
                    </div>
                    <div class="form-group" style="grid-column: 1 / -1;">
                        <label>Descrizione</label>
                        <input type="text" name="description" id="edit-description">
                    </div>
                    <div class="form-group" style="grid-column: 1 / -1;">
                        <label>Immagine (percorso relativo)</label>
                        <input type="text" name="image" id="edit-image" placeholder="es. images/prodotto.jpg">
                    </div>
                </div>
                <div style="display: flex; gap: 10px; margin-top: 10px;">
                    <button type="submit" class="btn-submit" style="width: auto; padding: 10px 20px;">Salva modifiche</button>
                    <button type="button" onclick="toggleForm('form-modifica-prodotto')"
                            class="btn-submit" style="width: auto; padding: 10px 20px; background: #7f8c8d;">Annulla</button>
                </div>
            </form>
        </div>

        <table style="width: 100%; border-collapse: collapse;">
            <thead>
                <tr style="border-bottom: 2px solid var(--border-color);">
                    <th style="text-align: left; padding: 12px;">ID</th>
                    <th style="text-align: left; padding: 12px;">Nome</th>
                    <th style="text-align: right; padding: 12px;">Prezzo</th>
                    <th style="text-align: center; padding: 12px;">IVA</th>
                    <th style="text-align: center; padding: 12px;">Qtà</th>
                    <th style="text-align: center; padding: 12px;">Azioni</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty products}">
                        <c:forEach var="p" items="${products}">
                            <tr style="border-bottom: 1px solid var(--border-color);">
                                <td style="padding: 12px; color: #7f8c8d;">#${p.id}</td>
                                <td style="padding: 12px; font-weight: 600;">${p.name}</td>
                                <td style="text-align: right; padding: 12px;">
                                    € <fmt:formatNumber value="${p.price}" pattern="#,##0.00"/>
                                </td>
                                <td style="text-align: center; padding: 12px;">${p.iva}%</td>
                                <td style="text-align: center; padding: 12px;">${p.quantity}</td>
                                <td style="text-align: center; padding: 12px;">

                                    <button type="button"
                                            data-id="${p.id}" data-name="${p.name}" data-price="${p.price}"
                                            data-iva="${p.iva}" data-quantity="${p.quantity}"
                                            data-description="${p.description}" data-image="${p.image}" data-category="${p.category}"
                                            onclick="apriModifica(this)"
                                            style="background: none; border: none; color: #2980b9; cursor: pointer; font-weight: 600; margin-right: 12px;">
                                        Modifica
                                    </button>

                                    <button type="button"
                                            data-id="${p.id}" data-name="${p.name}"
                                            onclick="confermaEliminazione(this)"
                                            style="background: none; border: none; color: var(--error-red); cursor: pointer; font-weight: 600;">
                                        Cancella
                                    </button>

                                    <form id="delete-form-${p.id}"
                                          action="${pageContext.request.contextPath}/Product" method="POST"
                                          style="display: none;">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="${p.id}">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="6" style="text-align: center; padding: 30px; color: #7f8c8d;">
                                Nessun prodotto presente nel catalogo.
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

    <div style="background: var(--white); padding: 40px; border-radius: 16px; border: 1px solid var(--border-color);">
        <h2 style="margin-bottom: 25px;">Gestione Ordini</h2>

        <form action="${pageContext.request.contextPath}/admin/Dashboard" method="GET"
              style="display: flex; gap: 15px; flex-wrap: wrap; align-items: flex-end; margin-bottom: 30px; padding: 20px; background: #f9f9f9; border-radius: 12px; border: 1px solid var(--border-color);">
            <div class="form-group" style="margin: 0;">
                <label style="display: block; margin-bottom: 6px;">Dal</label>
                <input type="date" name="dataInizio" value="${param.dataInizio}"
                       style="padding: 10px; border: 1px solid var(--border-color); border-radius: 8px;">
            </div>
            <div class="form-group" style="margin: 0;">
                <label style="display: block; margin-bottom: 6px;">Al</label>
                <input type="date" name="dataFine" value="${param.dataFine}"
                       style="padding: 10px; border: 1px solid var(--border-color); border-radius: 8px;">
            </div>
            <div class="form-group" style="margin: 0; flex: 1; min-width: 200px;">
                <label style="display: block; margin-bottom: 6px;">Cliente (email)</label>
                <input type="text" name="cliente" value="${param.cliente}"
                       placeholder="es. mario@email.com"
                       style="width: 100%; padding: 10px; border: 1px solid var(--border-color); border-radius: 8px;">
            </div>
            <button type="submit" class="btn-submit" style="width: auto; padding: 10px 20px; margin: 0;">
                Filtra
            </button>
            <a href="${pageContext.request.contextPath}/admin/Dashboard"
               class="btn-submit" style="width: auto; padding: 10px 20px; background: #7f8c8d; text-decoration: none; display: inline-block;">
                Reset
            </a>
        </form>

        <table style="width: 100%; border-collapse: collapse;">
            <thead>
                <tr style="border-bottom: 2px solid var(--border-color);">
                    <th style="text-align: left; padding: 12px;">Ordine #</th>
                    <th style="text-align: left; padding: 12px;">Cliente (ID)</th>
                    <th style="text-align: center; padding: 12px;">Data</th>
                    <th style="text-align: right; padding: 12px;">Totale</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty orders}">
                        <c:forEach var="order" items="${orders}">
                            <tr style="border-bottom: 1px solid var(--border-color);">
                                <td style="padding: 12px; font-weight: 600;">#ORD-${order.id}</td>
                                <td style="padding: 12px;">${order.userId}</td>
                                <td style="text-align: center; padding: 12px;">
                                    <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/>
                                </td>
                                <td style="text-align: right; padding: 12px;">
                                    € <fmt:formatNumber value="${order.total}" pattern="#,##0.00"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="4" style="text-align: center; padding: 30px; color: #7f8c8d;">
                                Nessun ordine trovato.
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

</main>

<script>
function toggleForm(id) {
    const form = document.getElementById(id);
    form.style.display = (form.style.display === 'none') ? 'block' : 'none';
}

function apriModifica(btn) {
    const d = btn.dataset;
    document.getElementById('edit-id').value = d.id;
    document.getElementById('edit-name').value = d.name;
    document.getElementById('edit-price').value = d.price;
    document.getElementById('edit-iva').value = d.iva;
    document.getElementById('edit-quantity').value = d.quantity;
    document.getElementById('edit-description').value = d.description;
    document.getElementById('edit-image').value = d.image;
    document.getElementById('edit-category').value = d.category || 'cane';

    document.getElementById('form-nuovo-prodotto').style.display = 'none';
    document.getElementById('form-modifica-prodotto').style.display = 'block';
    document.getElementById('form-modifica-prodotto').scrollIntoView({ behavior: 'smooth' });
}

function confermaEliminazione(btn) {
    const id = btn.dataset.id;
    const nome = btn.dataset.name;
    showConfirmModal(
        'Conferma eliminazione',
        'Sei sicuro di voler eliminare il prodotto "' + nome + '"? Questa azione non può essere annullata.',
        function() {
            document.getElementById('delete-form-' + id).submit();
        }
    );
}
</script>

<%@ include file="/fragments/footer.jsp" %>
