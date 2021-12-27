package service.impl;

import bean.Customer;
import reponsitory.CustomerReponsitory;
import reponsitory.impl.CustomerReponsitoryImpl;
import service.CustomerService;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    private CustomerReponsitory customerReponsitory = new CustomerReponsitoryImpl();

    @Override
    public List<Customer> findAll() {
        return this.customerReponsitory.findAll();
    }

    @Override
    public Customer findById(Integer id) {
        return this.customerReponsitory.findById(id);
    }

    @Override
    public void save(Customer customer) {
        this.customerReponsitory.save(customer);
    }

    @Override
    public void update(int id, Customer customer) {
        this.customerReponsitory.update(id, customer);
    }

    @Override
    public void remove(int id) {
        this.customerReponsitory.remove(id);
    }


}
