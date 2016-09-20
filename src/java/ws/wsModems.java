package ws;

import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.List;
import model.Modem;
import org.springframework.web.bind.annotation.*;

@RestController()
public class wsModems
{
    @RequestMapping(value = "findModems")
    public List<Modem> findModems()
    {
        List<Modem> lista = daos.ModemsDAO.findAll();
        
        return lista;
    }
    @RequestMapping(value = "addModem")
    public boolean addModem( @RequestParam(value = "modem") String jsonRaw)
    {
        boolean inserto = false;

        if(jsonRaw != null)
        {
            Modem modemRecibido = new Gson().fromJson(jsonRaw, Modem.class);
            System.out.println("modem recibido:" + modemRecibido);
            //Modem aux = new Modem(modemRecibido.getNombreADSL(), modemRecibido.getDireccionIP(), modemRecibido.getReintentos(), modemRecibido.getObservaciones());
            inserto = daos.ModemsDAO.save(modemRecibido);
        }
        
        return inserto;
    }
    @RequestMapping(value = "updateModem")
    public boolean updateModem(@RequestParam(value = "modem") String jsonRaw)
    {
        boolean modifico = false;

        System.out.println("update:" + jsonRaw);
        Gson gson = new Gson();
        Modem modemRecibido = gson.fromJson(jsonRaw, Modem.class);

        Modem modemDB = daos.ModemsDAO.findByName(modemRecibido.getNombreADSL()).get(0);
        modemDB.setObservaciones(modemRecibido.getObservaciones());
        modemDB.setReintentos(modemRecibido.getReintentos());
        modemDB.setDireccionIP(modemRecibido.getDireccionIP());

        modifico = daos.ModemsDAO.update2(modemDB);
        
        return modifico;
    }
    @RequestMapping(value = "rmModem")
    public boolean rmModem(@RequestParam(value = "modem") String modem)
    {
        boolean borro = false;
        System.out.println("remove:" + modem);

        ArrayList<Modem> arrModemsDB = daos.ModemsDAO.findByName(new Gson().fromJson(modem, Modem.class).getNombreADSL());
        
        borro = daos.ModemsDAO.delete(arrModemsDB.get(0));
        
        return borro;
    }
    
    
}
