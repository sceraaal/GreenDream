<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav style="background: var(--primary-green); padding: 0;">
    <div style="max-width: 1200px; margin: 0 auto; padding: 0 20px; display: flex; gap: 0; overflow-x: auto;">

        <a href="${pageContext.request.contextPath}/Product?action=list"
           style="color: white; text-decoration: none; padding: 12px 18px; font-size: 14px; font-weight: 600; white-space: nowrap; transition: background 0.2s;"
           onmouseover="this.style.background='rgba(0,0,0,0.15)'" onmouseout="this.style.background='transparent'">
            Tutti i prodotti
        </a>

        <a href="${pageContext.request.contextPath}/Product?action=list&categoria=cane"
           style="color: white; text-decoration: none; padding: 12px 18px; font-size: 14px; font-weight: 600; white-space: nowrap; transition: background 0.2s;"
           onmouseover="this.style.background='rgba(0,0,0,0.15)'" onmouseout="this.style.background='transparent'">
            Cane
        </a>

        <a href="${pageContext.request.contextPath}/Product?action=list&categoria=gatto"
           style="color: white; text-decoration: none; padding: 12px 18px; font-size: 14px; font-weight: 600; white-space: nowrap; transition: background 0.2s;"
           onmouseover="this.style.background='rgba(0,0,0,0.15)'" onmouseout="this.style.background='transparent'">
            Gatto
        </a>

        <a href="${pageContext.request.contextPath}/Product?action=list&categoria=piccoli-animali"
           style="color: white; text-decoration: none; padding: 12px 18px; font-size: 14px; font-weight: 600; white-space: nowrap; transition: background 0.2s;"
           onmouseover="this.style.background='rgba(0,0,0,0.15)'" onmouseout="this.style.background='transparent'">
            Piccoli animali
        </a>

        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <a href="${pageContext.request.contextPath}/Order"
                   style="color: white; text-decoration: none; padding: 12px 18px; font-size: 14px; font-weight: 600; white-space: nowrap; transition: background 0.2s; margin-left: auto;"
                   onmouseover="this.style.background='rgba(0,0,0,0.15)'" onmouseout="this.style.background='transparent'">
                    I miei ordini
                </a>
                <a href="${pageContext.request.contextPath}/Login?action=logout"
                   style="color: white; text-decoration: none; padding: 12px 18px; font-size: 14px; font-weight: 600; white-space: nowrap; transition: background 0.2s;"
                   onmouseover="this.style.background='rgba(0,0,0,0.15)'" onmouseout="this.style.background='transparent'">
                    Logout
                </a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/login.jsp"
                   style="color: white; text-decoration: none; padding: 12px 18px; font-size: 14px; font-weight: 600; white-space: nowrap; transition: background 0.2s; margin-left: auto;"
                   onmouseover="this.style.background='rgba(0,0,0,0.15)'" onmouseout="this.style.background='transparent'">
                    Accedi
                </a>
                <a href="${pageContext.request.contextPath}/register.jsp"
                   style="color: white; text-decoration: none; padding: 12px 18px; font-size: 14px; font-weight: 600; white-space: nowrap; transition: background 0.2s;"
                   onmouseover="this.style.background='rgba(0,0,0,0.15)'" onmouseout="this.style.background='transparent'">
                    Registrati
                </a>
            </c:otherwise>
        </c:choose>

        <c:if test="${sessionScope.isAdmin == true}">
            <a href="${pageContext.request.contextPath}/admin/Dashboard"
               style="color: #ffd700; text-decoration: none; padding: 12px 18px; font-size: 14px; font-weight: 700; white-space: nowrap; transition: background 0.2s;"
               onmouseover="this.style.background='rgba(0,0,0,0.15)'" onmouseout="this.style.background='transparent'">
                Admin
            </a>
        </c:if>

    </div>
</nav>
