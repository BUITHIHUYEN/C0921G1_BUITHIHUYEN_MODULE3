package service.impl;

import bean.Product;
import repository.ProductRepository;
import repository.impl.ProductRepossitoryImpl;
import service.ProductService;

import java.util.List;

public class ProductServiceImpl implements ProductService {

    private ProductRepository productRepository = new ProductRepossitoryImpl();


    @Override

    public List<Product> findAll() {
        return this.productRepository.findAll();
    }

    @Override
    public Product findByid(int id  ) {
        return this.productRepository.findByid(id);
    }

    @Override
    public void save(Product product) {
        this.productRepository.save(product);
    }

    @Override
    public void update(int id, Product product) {
        this.productRepository.update(id, product);
    }

    @Override
    public void remove(int id) {
        this.productRepository.remove(id);
    }

    @Override
    public Product searchByName(String name) {
        return this.productRepository.searchByName(name);
    }
}
