<%
    String ip = request.getParameter("ip");
    
    out.print(daos.ModemsDAO.existeIP(ip));
%>