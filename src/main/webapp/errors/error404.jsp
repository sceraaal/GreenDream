<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina Non Trovata - 404</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            text-align: center; 
            background-color: #f4fbf7; /* Sfondo verdino chiarissimo */
            color: #1e392a; /* Testo verde scuro */
            padding: 50px; 
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(39, 174, 96, 0.1); /* Ombra con riflesso verde */
            border-top: 5px solid #27ae60; /* Linea superiore verde principale */
        }
        h1 { 
            color: #27ae60; /* Verde principale */
            font-size: 45px; 
            margin-top: 0;
        }
        p { 
            font-size: 18px; 
            color: #2c5d41; /* Verde intermedio per il testo */
            line-height: 1.6;
        }
        .btn-home { 
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #2ecc71; /* Verde brillante per il bottone */
            color: white;
            text-decoration: none; 
            font-weight: bold; 
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .btn-home:hover {
            background-color: #27ae60; /* Verde più scuro al passaggio del mouse */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Errore 404</h1>
        <p>Ops! La pagina che stai cercando non esiste o è stata spostata.</p>
        <a href="<%= request.getContextPath() %>/index.jsp" class="btn-home">Torna alla Home</a>
    </div>
</body>
</html>