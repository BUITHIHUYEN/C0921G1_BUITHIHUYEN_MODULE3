package repository;

import bean.Product;

import java.util.Currency;
import java.util.List;

public interface ProductRepository {
    List<Product> findAll();

    Product findByid(int id);

    void save(Product product);

    void update(int id, Product product);

    void remove(int id);

   List<Product>  searchByName(String name);

}
