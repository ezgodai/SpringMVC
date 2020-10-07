package exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author ME
 * @creat 2020/10/4
 */
public class ExceptionDeal implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object obj,
                                         Exception ex) {
        // TODO Auto-generated method stub
        ModelAndView modelAndView = new ModelAndView();
        if (ex instanceof ExceptionMessage) {
            ExceptionMessage exm = (ExceptionMessage) ex;
            modelAndView.addObject("error", exm.getMessage());
        } else {
            modelAndView.addObject("error", "未知异常");
        }
        modelAndView.setViewName("error");
        return modelAndView;
    }

}
