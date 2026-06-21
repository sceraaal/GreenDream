<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer class="site-footer">
    <div class="footer-container">
        <div class="footer-col">
            <h4>PetHouse</h4>
            <p>Tutto per i tuoi animali, con consegna rapida e prezzi pensati per te e il tuo pet.</p>
        </div>
        <div class="footer-col">
            <h4>Naviga</h4>
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/Product?action=list">Tutti i prodotti</a>
            <a href="${pageContext.request.contextPath}/Cart?action=view">Carrello</a>
        </div>
        <div class="footer-col">
            <h4>Contatti</h4>
            <p>Via degli Animali, 123</p>
            <p>P.IVA 1234567890</p>
            <p>info@pethouse.it</p>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2026 PetHouse S.r.l. — Tutti i diritti riservati.</p>
    </div>
</footer>

<div id="confirm-modal" class="modal-overlay" style="display:none;">
    <div class="modal-box">
        <h3 id="confirm-modal-title">Conferma</h3>
        <p id="confirm-modal-message"></p>
        <div class="modal-actions">
            <button type="button" id="confirm-modal-cancel" class="btn-submit" style="width:auto; padding:10px 20px; background:#7f8c8d;">Annulla</button>
            <button type="button" id="confirm-modal-ok" class="btn-submit" style="width:auto; padding:10px 20px; background: var(--error-red);">Conferma</button>
        </div>
    </div>
</div>

<script>
function showConfirmModal(title, message, onConfirm) {
    const modal = document.getElementById("confirm-modal");
    document.getElementById("confirm-modal-title").innerText = title;
    document.getElementById("confirm-modal-message").innerText = message;
    modal.style.display = "flex";

    const okBtn = document.getElementById("confirm-modal-ok");
    const cancelBtn = document.getElementById("confirm-modal-cancel");

    function cleanup() {
        modal.style.display = "none";
        okBtn.removeEventListener("click", okHandler);
        cancelBtn.removeEventListener("click", cleanup);
    }
    function okHandler() {
        cleanup();
        if (typeof onConfirm === "function") onConfirm();
    }

    okBtn.addEventListener("click", okHandler);
    cancelBtn.addEventListener("click", cleanup);
}
</script>

</body>
</html>
