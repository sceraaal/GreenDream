<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer>
    <p>&copy; 2026 PetHouse. Tutti i diritti riservati.</p>
</footer>

<div id="toast-container" class="toast-container"></div>

<div id="confirm-modal" class="modal-overlay">
    <div class="modal-box">
        <h3 id="modal-title">Attenzione</h3>
        <p id="modal-message">Sei sicuro di voler procedere?</p>
        <div class="modal-buttons">
            <button class="btn-cancel" onclick="closeModal()">Annulla</button>
            <button id="modal-confirm-btn" class="btn-danger">Conferma</button>
        </div>
    </div>
</div>

<script>
function showToast(message) {
    const container = document.getElementById('toast-container');
    const toast = document.createElement('div');
    toast.className = 'toast';
    toast.innerHTML = '✓ ' + message;
    
    container.appendChild(toast);
    
    setTimeout(() => toast.classList.add('show'), 10);
    
    setTimeout(() => {
        toast.classList.remove('show');
        setTimeout(() => toast.remove(), 300);
    }, 3000);
}

let confirmAction = null;

function showConfirmModal(title, message, onConfirm) {
    document.getElementById('modal-title').innerText = title;
    document.getElementById('modal-message').innerText = message;
    
    confirmAction = onConfirm;
    document.getElementById('confirm-modal').classList.add('active');
}

function closeModal() {
    document.getElementById('confirm-modal').classList.remove('active');
    confirmAction = null;
}

document.getElementById('modal-confirm-btn').addEventListener('click', () => {
    if (confirmAction) confirmAction();
    closeModal();
});
</script>
