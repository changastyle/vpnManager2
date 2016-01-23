<%@page import="model.Modem"%>
<%
    String nombreSugerido = controller.Controller.nombreAdslSugerido();
    String ipSugerida = controller.Controller.ipSugerida();
    
    Modem modemRespuesta = new Modem("adsl_" + nombreSugerido , "172.36.200." + ipSugerida , 0, "");
    out.print(modemRespuesta.toJSON());
%>