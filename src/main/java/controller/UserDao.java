package controller;

import java.util.UUID;

import exception.ExceptionMessage;
import mapper.UserMapper;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import pojo.QueryVo;
import pojo.Student;
import pojo.User;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

/**
 * @author ME
 * @creat 2020/10/5
 */
@Controller
public class UserDao {

    @Autowired(required = false)
    private UserMapper userMapper;

    @RequestMapping(value = "userlist.action")
    // public ModelAndView userlist() {
    public String userlist(Model model) throws ExceptionMessage {
        List<Student> list = userMapper.findAll();
        if (null == list) {
            throw new ExceptionMessage("列表为空");

        }

        /*
         * ModelAndView modelAndView = new ModelAndView();
         * modelAndView.addObject("allstu", list); modelAndView.setViewName("allstu");
         */
        model.addAttribute("allstu", list);
        return "allstu";
    }

    @RequestMapping(value = "updatestu.action")
    public String updateUser(Integer id, Model model) {
        // RestFull风格开发
        // @RequestMapping(value = "{id}.action")
        // public String updateUser(@PathVariable Integer id, Model model) {
        // int id = Integer.parseInt(request.getParameter("id"));
        Student findOneByid = userMapper.findOneByid(id);
        model.addAttribute("stu", findOneByid);
        return "updatestu";
    }

    /*
     * @RequestMapping(value = "submitstu.action") public ModelAndView
     * submitUser(Student student) {
     *
     * userMapper.submitStu(student);
     *
     * ModelAndView modelAndView = new ModelAndView();
     *
     * modelAndView.setViewName("success"); return modelAndView;
     *
     * }
     */
    @RequestMapping(value = "submitstu.action")
    public String submitUser(QueryVo vo, MultipartFile multipartResolver) throws Exception {
        // 保存图片
        String name = UUID.randomUUID().toString().replace("-", "");
        String extension = FilenameUtils.getExtension(multipartResolver.getOriginalFilename());
        // File file = new File("F:\\upload\\" + name + "." + extension);

        multipartResolver.transferTo(new File("F:\\upload\\" + name + "." + extension));
        vo.getStudent().setPic(name + "." + extension);

        userMapper.submitStu(vo.getStudent());

        // return "redirect:/updatestu.action?id=" + vo.getStudent().getId();
        return "redirect:userlist.action";
    }

    @RequestMapping(value = "deletes.action")
    public String deleteUser(QueryVo vo) throws Exception {
        Integer[] ids = vo.getIds();
        if (null == ids) {
            throw new ExceptionMessage("请选择");
        } else {
            userMapper.deleteStu(vo.getIds());
        }
        return "redirect:userlist.action";
    }
    @RequestMapping(value = "login.action", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "login.action",method = RequestMethod.POST)
    public String login(User user, HttpSession session) {
        Integer login = userMapper.login(user);

        if (login > 0) {
            session.setAttribute("USER_SESSION", user);
        }
        return "redirect:userlist.action";

    }

    @RequestMapping(value = "addstu.action", method = RequestMethod.GET)
    public String addStu() {
        return "addstu";
    }

    @RequestMapping(value = "addstu.action", method = RequestMethod.POST)
    public String addstu(QueryVo vo, MultipartFile multipartResolver) throws Exception {
        // 保存图片
        String name = UUID.randomUUID().toString().replace("-", "");
        String extension = FilenameUtils.getExtension(multipartResolver.getOriginalFilename());
        // File file = new File("F:\\upload\\" + name + "." + extension);

        multipartResolver.transferTo(new File("F:\\upload\\" + name + "." + extension));
        vo.getStudent().setPic(name + "." + extension);
        userMapper.addStu(vo.getStudent());
        return "redirect:userlist.action";
    }

    @RequestMapping(value = "checkquery.action")
    public String query(QueryVo vo, Model model) {
        List<Student> querylist = userMapper.query(vo.getConditions());
        model.addAttribute("querylist", querylist);
        return "check";
    }

    @RequestMapping(value = "back.action")
    public String back() {
        return "redirect:userlist.action";
    }

    @RequestMapping(value = "exit.action")
    public String exit(HttpServletResponse response, HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:login.action";
    }

    @RequestMapping(value = "logintest.action")
    public void test(User user, HttpServletResponse response, HttpServletRequest request) throws Exception {
        Integer integer = userMapper.checkUsername(user);
        response.getWriter().println(integer);
    }
}

