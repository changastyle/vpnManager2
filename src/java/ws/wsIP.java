package ws;

import org.springframework.web.bind.annotation.*;


@RestController
public class wsIP
{
    @RequestMapping(value = "existeIP")
    public boolean existeIP(@RequestParam(value = "ip")String ip)
    {
        return daos.ModemsDAO.existeIP(ip);
    }
}
