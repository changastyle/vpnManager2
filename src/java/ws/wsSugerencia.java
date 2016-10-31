package ws;

import model.Modem;
import org.springframework.web.bind.annotation.*;

@RestController()
public class wsSugerencia
{
    @RequestMapping(value="sugerirUsuarioADSL")
    public Modem sugerirUsuarioADSL()
    {
        String nombreSugerido = controller.Controller.nombreAdslSugerido();
        String ipSugerida = controller.Controller.ipSugerida();

        Modem modemRespuesta = new Modem("adsl_" + nombreSugerido , "172.36.200." + ipSugerida , 0, "");
        
        return modemRespuesta;
    }
}
