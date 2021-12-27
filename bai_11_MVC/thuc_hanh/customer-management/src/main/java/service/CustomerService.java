package service;

import bean.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAll();
    Customer findById(Integer id);
    void save (Customer customer);
    void update(int id, Customer customer);
    void remove(int id);
}
