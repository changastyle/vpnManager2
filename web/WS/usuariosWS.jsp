<%@page import="java.util.List"%>
<%@page import="model.Usuario"%>
<%
    List<Usuario> arr = new java.util.ArrayList<Usuario>();
    
    String salida = "[";
    for(Usuario usuario : daos.UsuariosDAO.findAll())
    {
        salida += usuario.toJSON() + ",";
    }
    
    salida = salida.substring(0, (salida.length() - 1) );
    salida += "]";
    
    out.print(salida);
%>