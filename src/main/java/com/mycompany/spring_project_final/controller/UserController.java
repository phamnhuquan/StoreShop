/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.controller;

import com.mycompany.spring_project_final.entities.AccountEntity;
import com.mycompany.spring_project_final.entities.FavoriteEntity;
import com.mycompany.spring_project_final.entities.ProductEntity;
import com.mycompany.spring_project_final.entities.VerificationOrderToken;
import com.mycompany.spring_project_final.enums.Gender;
import com.mycompany.spring_project_final.model.Item;
import com.mycompany.spring_project_final.service.AccountService;
import com.mycompany.spring_project_final.service.CategoryService;
import com.mycompany.spring_project_final.service.FavouriteService;
import com.mycompany.spring_project_final.service.ObjectService;
import com.mycompany.spring_project_final.service.OrderDetailService;
import com.mycompany.spring_project_final.service.OrderService;
import com.mycompany.spring_project_final.service.ProductService;
import com.mycompany.spring_project_final.service.VerificationOrderTokenService;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    private ProductService productService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private FavouriteService favouriteService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ObjectService objectService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private VerificationOrderTokenService verificationOrderTokenService;
    @Autowired
    private OrderDetailService orderDetailService;
    
    @RequestMapping("/home")
    public String viewHome(Model model, HttpSession session,
            @RequestParam(required = false, value = "message") String message) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        AccountEntity accountEntity = (AccountEntity) authentication.getPrincipal();
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("newProducts", productService.getNewProducts());
        model.addAttribute("saleProducts", productService.getSaleProducts());
        model.addAttribute("objects", objectService.getObjects());
        model.addAttribute("products", productService.getProducts());
        model.addAttribute("message", message);
        model.addAttribute("sessionCart", session.getAttribute("cart"));
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if(cart != null){
            model.addAttribute("totalProduct", cart.size());
        }
        session.setAttribute("account", accountEntity);
        model.addAttribute("account", session.getAttribute("account"));
        return "user/home";
    }
    @RequestMapping("/profile")
    public String viewProfile(Model model, HttpSession session) {
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        if(account != null){
            model.addAttribute("getAccount", accountService.findAccountByEmail(account.getEmail()));
        }
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        model.addAttribute("gender", Gender.values());
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if(cart != null){
            model.addAttribute("totalProduct", cart.size());
            model.addAttribute("sessionCart", session.getAttribute("cart"));
        }
        return "user/profile-user";
    }
    @RequestMapping("/favourites")
    public String viewFavourites(Model model, HttpSession session) {
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        model.addAttribute("account", session.getAttribute("account"));
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        if(account != null){
            model.addAttribute("favouritesProduct", favouriteService.getFavouritesByAccountId(account.getId()));
        }
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if(cart != null){
            model.addAttribute("totalProduct", cart.size());
            model.addAttribute("sessionCart", session.getAttribute("cart"));
        }
        return "user/favourites";
    }
    @RequestMapping("/add-favourites/{productId}")
    public String addFavourites(Model model, HttpSession session,@PathVariable("productId") int productId ){
        ProductEntity productEntity = productService.findProductById(productId);
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        FavoriteEntity favorite = new FavoriteEntity();
        favorite.setAccount(account);
        favorite.setProduct(productEntity);
        favouriteService.save(favorite);
        return "redirect:/view-detail/"+productId;
    }
    
    @RequestMapping("/remove-favourites/{productId}")
    public String removeFavourites(Model model, HttpSession session,@PathVariable("productId") int productId ){
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        FavoriteEntity favorite = favouriteService.getFavouritesByAccountIdAndProductId(account.getId(), productId);
        favouriteService.delete(favorite.getId());
        return "redirect:/view-detail/"+productId;
    }
    
    @RequestMapping("/remove-favourites-user/{productId}")
    public String removeFavouritesUser(Model model, HttpSession session,@PathVariable("productId") int productId ){
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        FavoriteEntity favorite = favouriteService.getFavouritesByAccountIdAndProductId(account.getId(), productId);
        favouriteService.delete(favorite.getId());
        return "redirect:/user/favourites";
    }
    
    
//    @RequestMapping("/change-password")
//    public String viewChangePassword(Model model, HttpSession session) {
//        model.addAttribute("categories", categoryService.getCategories());
//        model.addAttribute("objects", objectService.getObjects());
//        model.addAttribute("account", session.getAttribute("account"));
//        List<Item> cart = (List<Item>) session.getAttribute("cart");
//        if(cart != null){
//            model.addAttribute("totalProduct", cart.size());
//            model.addAttribute("sessionCart", session.getAttribute("cart"));
//        }
//        return "user/change-password";
//    }
    
    @RequestMapping(value = "/update-account")
    public String updateAccount ( Model model, @ModelAttribute("account") AccountEntity account ,HttpSession session ){
        AccountEntity accountUpdate = (AccountEntity) session.getAttribute("account");
        account.setEmail(accountUpdate.getEmail());
        account.setPassword(accountUpdate.getPassword());
        account.setStatus("confirmed");
        accountService.save(account);
        session.setAttribute("account", account);
        return "redirect:/user/profile";
    }
    
    @RequestMapping(value = "/order-history" , method = RequestMethod.GET)
    public String orderHistory ( Model model ,HttpSession session){
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if(cart != null){
            model.addAttribute("totalProduct", cart.size());
            model.addAttribute("sessionCart", session.getAttribute("cart"));
        }
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("orders", orderService.findOrderByAccountId(account.getId()));       
        //model.addAttribute("orderDetails", orderDetailService.getOrderDetailsByOrderId());
        return "user/order-history";
    }
    @RequestMapping(value = "/remove-order/{orderId}" , method = RequestMethod.GET)
    public String removeOrder ( Model model ,HttpSession session,@PathVariable("orderId") int orderId ){
        orderService.delete(orderId);
        VerificationOrderToken token = verificationOrderTokenService.findTokenByOrder(orderId);
        if(token != null){
            verificationOrderTokenService.delete(token.getId());
        }
        return "redirect:/user/order-history";
    }
    @RequestMapping(value = "/view-order-detail/{orderId}" , method = RequestMethod.GET)
    public String viewOrderDetail ( Model model ,HttpSession session,@PathVariable("orderId") int orderId ){
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if(cart != null){
            model.addAttribute("totalProduct", cart.size());
            model.addAttribute("sessionCart", session.getAttribute("cart"));
        }
        model.addAttribute("orderDetails", orderDetailService.getOrderDetailsByOrderId(orderId));
        return "user/view-order-detail";
    }
}
