package cn.itcast.controller;

import cn.itcast.domain.Employee;
import cn.itcast.domain.Msg;
import cn.itcast.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/*
* 处理员工CRUD请求
* */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;
    /*
    * 导入jackson
    *
    * */

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        //这不是一个分页查询
        //引入PageHelper分页插件
        //在查询前只需要调用,传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAll();
        //使用PageInfo包装查询后的结果，只需要将PageInfo交给页面就行了，它封装了详细的分页信息，包括有我们查询出来的数据
        PageInfo page = new PageInfo(emps,5);//连续显示5页
        return Msg.success().add("pageInfo",page);
    }

    //获取所有员工信息(分页查询)
    //@RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        //这不是一个分页查询
        //引入PageHelper分页插件
        //在查询前只需要调用,传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAll();
        //使用PageInfo包装查询后的结果，只需要将PageInfo交给页面就行了，它封装了详细的分页信息，包括有我们查询出来的数据
        PageInfo page = new PageInfo(emps,5);//连续显示5页
        model.addAttribute("pageInfo",page);
        return "list";
    }
}
