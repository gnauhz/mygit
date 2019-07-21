package cn.itcast.test;

import cn.itcast.dao.DepartmentMapper;
import cn.itcast.dao.EmployeeMapper;
import cn.itcast.domain.Department;
import cn.itcast.domain.Employee;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//测试dao层的工作
//推荐Spring的项目可以使用Spring的单元测试，可以自动注入我们需要的组件
//1.导入SpringTest模块
//2.@ContextConfiguration指定Spring配置文件的位置
//3.直接autowired使用组件即可
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={ "classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    /*
    * 测试DepartmentMapper
    * */
    @Test
    public void testCRUD(){
//        //1.创建SpringIOC容器
//        ClassPathXmlApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//        //2.从容器中获取mapper
//        DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);
        System.out.println(departmentMapper);
        //1.插入几个部门
       //departmentMapper.insertSelective(new Department(null,"销售部"));
       employeeMapper.insertSelective(new Employee(null,"zsa","M","ss@.com",1));
    }
}
