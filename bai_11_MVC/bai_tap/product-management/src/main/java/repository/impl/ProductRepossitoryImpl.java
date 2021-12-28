package repository.impl;

import bean.Product;
import org.omg.PortableServer.LIFESPAN_POLICY_ID;
import repository.ProductRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class ProductRepossitoryImpl implements ProductRepository {
    private static Map<Integer, Product> products;

    static {
        products = new TreeMap<>();
        products.put(1, new Product(1, "Iphone X", 12000000, "100% NEW", "U.S"));
        products.put(2, new Product(2, "Iphone 11", 21000000, "100% NEW", "U.S"));
        products.put(3, new Product(3, "Iphone 12", 28000000, "100% NEW", "U.S"));
        products.put(4, new Product(4, "Iphone 12 Pro", 36000000, "100% NEW", "U.S"));
        products.put(5, new Product(5, "Iphone 13", 40000000, "100% NEW", "U.S"));
    }


    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());

    }


    @Override
    public Product findByid(int id) {
        return products.get(id);
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> products = this.findAll();
        List<Product> productResult = new ArrayList<>();
        String productName;
        name = name.toLowerCase();
        for (Product product:products) {
            productName = product.getName().toLowerCase();
            if (productName.contains(name)){
                productResult.add(product);
            }
        }
        return productResult;

    }


}
