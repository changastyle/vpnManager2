package ws;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControladorRedireccion
{
    @RequestMapping(value = "/")
    public ModelAndView redireccionamiento()
    {
        return new ModelAndView("redireccionamiento");
    }
}
