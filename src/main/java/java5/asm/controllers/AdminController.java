package java5.asm.controllers;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import java5.asm.dto.ProductDTO;
import java5.asm.entity.Category;
import java5.asm.entity.Product;
import java5.asm.service.CategoryService;
import java5.asm.service.ProductService;
import java5.asm.service.RoleService;
import java5.asm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;
import java.util.Optional;

@Controller
public class AdminController {
    public static String uploadDir = System.getProperty("user.dir") + "/src/main/resources/static/productImages";

    @Autowired
    private PasswordEncoder bCryptPasswordEncoder;

    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductService productService;

    @Autowired
    UserService userService;

    @Autowired
    RoleService roleService;


    final Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "ducnv2509",
            "api_key", "959687882171424",
            "api_secret", "yoa_1l--izubACPSc3gyDXfdLCQ",
            "secure", true));

    @GetMapping("/admin/products/add")
    public String getProAdd(Model model) {
        model.addAttribute("productDTO", new ProductDTO());
        model.addAttribute("categories", categoryService.getAllCategory());
        return "addProduct";
    }// form add new product

    @PostMapping("/admin/products/add")
    public String postProAdd(@ModelAttribute("productDTO") ProductDTO productDTO,
                             @RequestParam("productImage") MultipartFile fileProductImage,
                             @RequestParam("imgName") String imgName, HttpServletRequest request) throws IOException, ServletException {
        //convert dto > entity
//        File dir = new File("/uploads");
//        if (!dir.exists()) {
//            dir.mkdirs();
//        }
//        Part photo = request.getPart("productImage");
//        File photoFile = new File(dir, photo.getSubmittedFileName());
//        photo.write(photoFile.getAbsolutePath());

        Product product = new Product();
        product.setId(productDTO.getId());
        product.setName(productDTO.getName());
        System.out.println("Test: " + categoryService.getCategoryById(productDTO.getCategoryId()));
//        product.setCategory(categoryService.getCategoryById(productDTO.getCategoryId()));
        product.setPrice(productDTO.getPrice());
        product.setWeight(productDTO.getWeight());
        product.setDescription(productDTO.getDescription());
        String imageUUID;
        if(!fileProductImage.isEmpty()){
            imageUUID = fileProductImage.getOriginalFilename();
            Path fileNameAndPath = Paths.get(uploadDir, imageUUID);
            Files.write(fileNameAndPath, fileProductImage.getBytes());
        }else {
            imageUUID = imgName;
        }//save image
        product.setImageName(imageUUID);
//        Map uploadRuslt = cloudinary.uploader().upload(photoFile, ObjectUtils.emptyMap());
//        product.setImageName(uploadRuslt.get("url").toString());
        productService.updateProduct(product);
        return "redirect:/admin/products";
    }//form add new product > do add


    //Products session
    @GetMapping("/admin/products")
    public String getPro(Model model){
        model.addAttribute("products", productService.getAllProduct());
        return "products";
    }//view all products

    @GetMapping("/admin/products/delete/{id}")
    public String deletePro(@PathVariable long id){
        productService.removeProductById(id);
        return "redirect:/admin/products";
    }//delete 1 product

    @GetMapping("/admin/products/update/{id}")
    public String updatePro(@PathVariable long id, Model model){
        Optional<Product> opProduct = productService.getProductById(id);
        if (opProduct.isPresent()){
            Product product = opProduct.get();
            //convert entity > dto
            ProductDTO productDTO = new ProductDTO();
            productDTO.setId(product.getId());
            productDTO.setName(product.getName());
            productDTO.setCategoryId(product.getCategory().getId());
            productDTO.setPrice(product.getPrice());
            productDTO.setWeight(product.getWeight());
            productDTO.setDescription(product.getDescription());
            productDTO.setImageName(product.getImageName());

            model.addAttribute("productDTO", productDTO);
            model.addAttribute("categories", categoryService.getAllCategory());
            return "addProduct";
        }else {
            return "404";
        }

    }//form edit product, fill old data into form
}
