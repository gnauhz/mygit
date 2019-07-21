package cn.itcast.service;

import cn.itcast.dao.EmployeeMapper;
import cn.itcast.domain.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;
    public List<Employee> getAll(){
        return employeeMapper.selectByExampleWithDept(null);
    }
}
