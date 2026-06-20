// Gestione della barra di ricerca asincrona tramite AJAX nativo
document.addEventListener("DOMContentLoaded", function() {
    const searchBar = document.getElementById("search-bar");
    const resultsBox = document.getElementById("search-results");

    if (searchBar) {
        searchBar.addEventListener("input", function() {
            const query = searchBar.value.trim();

            // Se la query è più corta di 2 caratteri svuota e nasconde il box
            if (query.length < 2) {
                resultsBox.innerHTML = "";
                resultsBox.style.display = "none";
                return;
            }

            // Istanza nativa XMLHttpRequest (No jQuery, coerente con le slide)
            const xhr = new XMLHttpRequest();
            
            // Configurazione della richiesta in GET verso la Servlet dell'amica
            xhr.open("GET", "SearchServlet?q=" + encodeURIComponent(query), true);

            xhr.onreadystatechange = function() {
                // readyState 4 = completato, status 200 = OK
                if (xhr.readyState === 4 && xhr.status === 200) {
                    const products = JSON.parse(xhr.responseText);
                    renderResults(products);
                }
            };

            xhr.send();
        });
    }

    function renderResults(products) {
        resultsBox.innerHTML = "";
        
        if (products.length === 0) {
            resultsBox.style.display = "none";
            return;
        }

        // Manipolazione del DOM per inserire i suggerimenti
        products.forEach(product => {
            const div = document.createElement("div");
            div.className = "suggestion-item";
            div.innerText = product.name;
            
            div.addEventListener("click", function() {
                // Reindirizzamento alla Servlet del dettaglio prodotto
                window.location.href = "ProductServlet?id=" + product.id;
            });
            
            resultsBox.appendChild(div);
        });

        resultsBox.style.display = "block";
    }

    // Chiude i suggerimenti se si clicca fuori dalla barra
    document.addEventListener("click", function(e) {
        if (e.target !== searchBar) {
            resultsBox.style.display = "none";
        }
    });
});