package com.mycompany.spring_project_final.controller;

import com.mycompany.spring_project_final.entities.AccountEntity;
import com.mycompany.spring_project_final.entities.ColorEntity;
import com.mycompany.spring_project_final.entities.FavoriteEntity;
import com.mycompany.spring_project_final.entities.OrderDetailEntity;
import com.mycompany.spring_project_final.entities.OrderEntity;
import com.mycompany.spring_project_final.entities.ProductDetailEntity;
import com.mycompany.spring_project_final.entities.ProductEntity;
import com.mycompany.spring_project_final.entities.SizeEntity;
import com.mycompany.spring_project_final.entities.VerificationOrderToken;
import com.mycompany.spring_project_final.entities.VerificationToken;
import com.mycompany.spring_project_final.entities.VoteEntity;
import com.mycompany.spring_project_final.model.Item;
import com.mycompany.spring_project_final.service.AccountService;
import com.mycompany.spring_project_final.service.CategoryService;
import com.mycompany.spring_project_final.service.ColorService;
import com.mycompany.spring_project_final.service.EmailSenderService;
import com.mycompany.spring_project_final.service.FavouriteService;
import com.mycompany.spring_project_final.service.ImageService;
import com.mycompany.spring_project_final.service.ObjectService;
import com.mycompany.spring_project_final.service.OrderDetailService;
import com.mycompany.spring_project_final.service.OrderService;
import com.mycompany.spring_project_final.service.ProductDetailService;
import com.mycompany.spring_project_final.service.ProductService;
import com.mycompany.spring_project_final.service.RestFB;
import com.mycompany.spring_project_final.service.SizeService;
import com.mycompany.spring_project_final.service.VerificationOrderTokenService;
import com.mycompany.spring_project_final.service.VerificationTokenService;
import com.mycompany.spring_project_final.service.VoteService;
import com.mycompany.spring_project_final.utils.HashPassword;
import com.mycompany.spring_project_final.utils.ProductExist;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private ProductDetailService productDetailService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private SizeService sizeService;

    @Autowired
    private ColorService colorService;

    @Autowired
    private VerificationTokenService verificationTokenService;

    @Autowired
    private VerificationOrderTokenService verificationOrderTokenService;

    @Autowired
    private EmailSenderService emailSenderService;

    @Autowired
    private VoteService voteService;

    @Autowired
    private FavouriteService favouriteService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ObjectService objectService;
    @Autowired
    private RestFB restFB;

    //View trang home
    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String viewHome(Model model, HttpSession session,
            @RequestParam(required = false, value = "message") String message) {
        model.addAttribute("products", productService.getProducts());
        model.addAttribute("newProducts", productService.getNewProducts());
        model.addAttribute("saleProducts", productService.getSaleProducts());
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        model.addAttribute("message", message);
        model.addAttribute("sessionCart", session.getAttribute("cart"));
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if (cart != null) {
            model.addAttribute("totalProduct", cart.size());
        }
        model.addAttribute("account", session.getAttribute("account"));
        return "home";
    }

    @RequestMapping(value = {"/women"}, method = RequestMethod.GET)
    public String viewWomen(Model model, HttpSession session) {
        model.addAttribute("products", productService.getProductsByObjectWomen());
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if (cart != null) {
            model.addAttribute("totalProduct", cart.size());
            model.addAttribute("sessionCart", session.getAttribute("cart"));
        }
        return "women";
    }

    @RequestMapping(value = {"/men"}, method = RequestMethod.GET)
    public String viewMen(Model model, HttpSession session) {
        model.addAttribute("products", productService.getProductsByObjectMen());
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if (cart != null) {
            model.addAttribute("totalProduct", cart.size());
            model.addAttribute("sessionCart", session.getAttribute("cart"));
        }
        return "men";
    }

    @RequestMapping(value = {"/about-us"}, method = RequestMethod.GET)
    public String viewAboutUs(Model model, HttpSession session) {
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if (cart != null) {
            model.addAttribute("totalProduct", cart.size());
            model.addAttribute("sessionCart", session.getAttribute("cart"));
        }
        return "about-us";
    }

    @RequestMapping(value = {"/search"}, method = RequestMethod.POST)
    public String searchBook(Model model, HttpSession session,
            @ModelAttribute("categoryName") String strCategory,
            @ModelAttribute("strProductName") String strProductName,
            @ModelAttribute("strObjectName") String strObjectName) {
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        model.addAttribute("products", productService.searchProduct(strCategory, strProductName, strObjectName));
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if (cart != null) {
            model.addAttribute("totalProduct", cart.size());
            model.addAttribute("sessionCart", session.getAttribute("cart"));
        }
        return "search";
    }

    //view chi tiet san pham
    @RequestMapping(value = {"/view-detail/{productId}"}, method = RequestMethod.GET)
    public String viewDetail(Model model,
            @PathVariable("productId") int productId, HttpSession session) {
        model.addAttribute("products", productService.getProducts());
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        model.addAttribute("product", productService.findProductById(productId));
        model.addAttribute("images", imageService.getImageByProductId(productId));
        model.addAttribute("colors", productDetailService.getColorByProductId(productId));
        model.addAttribute("sizes", productDetailService.getSizeByProductId(productId));
        model.addAttribute("votes", voteService.getVoteByProductId(productId));
        model.addAttribute("reviewTotal", voteService.countReview(productId));
        model.addAttribute("sessionCart", session.getAttribute("cart"));
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if (cart != null) {
            model.addAttribute("totalProduct", cart.size());
        }
        AccountEntity accountEntity = (AccountEntity) session.getAttribute("account");
        if (accountEntity != null) {
            FavoriteEntity favorite = favouriteService.getFavouritesByAccountIdAndProductId(accountEntity.getId(), productId);
            if (favorite != null) {
                model.addAttribute("status", "liked");
            } else {
                model.addAttribute("status", "notyetlike");
            }
        }
        model.addAttribute("account", session.getAttribute("account"));
        return "view-detail";
    }

    //đánh giá sản phẩm
    @RequestMapping(value = {"/review/{productId}"}, method = RequestMethod.POST)
    public String reviewProduct(Model model,
            @PathVariable("productId") int productId, HttpSession session, @ModelAttribute("vote") VoteEntity vote) {
        AccountEntity accountEntity = (AccountEntity) session.getAttribute("account");
        ProductEntity productEntity = productService.findProductById(productId);
        vote.setAccount(accountEntity);
        vote.setProduct(productEntity);
        vote.setVoteDate(new Date());
        voteService.save(vote);
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        return "redirect:/view-detail/" + productId;
    }

    //Login vào trang home
    @RequestMapping("/login")
    public String viewLogin(Model model,
            @RequestParam(value = "error", required = false) boolean isError,
            @RequestParam(required = false, value = "message") String message, HttpSession session) {
        if (isError) {
            model.addAttribute("errorEmailOrPass", "Email or password error!!!");
        }
        model.addAttribute("message", message);
        return "login";
    }

    @RequestMapping("/login-facebook")
    public String loginFacebook(HttpServletRequest request) {
        String code = request.getParameter("code");
        String accessToken = "";
        try {
            accessToken = restFB.getToken(code);
        } catch (IOException e) {
            return "login?facebook=error";
        }
        com.restfb.types.User user = restFB.getUserInfo(accessToken);
        UserDetails userDetail = restFB.buildUser(user);
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
                userDetail.getAuthorities());
        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return "redirect:/user/home";
    }

    //Đăng ký
    @RequestMapping("/registration")
    public String viewRegister(Model model,
            @RequestParam(value = "error", required = false) boolean isError,
            @RequestParam(required = false, value = "message") String message) {
        model.addAttribute("message", message);
        return "registration";
    }

    //Đăng ký thành công
    @RequestMapping(value = "/registration-success", method = RequestMethod.POST)
    public String result(Model model,
            @ModelAttribute("account") AccountEntity accountEntity) {
        AccountEntity existingUser = accountService.findAccountByEmail(accountEntity.getEmail());
        if (existingUser != null) {
            return "redirect:/registration?message=This email already exists!!!";
        } else {
            accountService.save(accountEntity);
            VerificationToken verificationToken = new VerificationToken(accountEntity);

            verificationTokenService.save(verificationToken);

            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setTo(accountEntity.getEmail());
            mailMessage.setSubject("Confirm Register!");
            mailMessage.setText("To confirm your account, please click here : "
                    + "http://localhost:8080/Spring_Project_Final/confirm-account?token=" + verificationToken.getToken());
            emailSenderService.sendEmail(mailMessage);
            accountEntity.setPassword(HashPassword.hashPass(accountEntity.getPassword()));
            accountService.save(accountEntity);

            return "redirect:/login?message=Please confirm email!!!";

        }

    }

    @RequestMapping(value = "/confirm-account", method = {RequestMethod.GET, RequestMethod.POST})
    public String confirmAccount(Model model, @RequestParam("token") String confirmationToken, @RequestParam(required = false, value = "message") String message) {
        VerificationToken token = verificationTokenService.findByToken(confirmationToken);

        if (token != null) {
            AccountEntity account = accountService.findAccountByEmail(token.getAccount().getEmail());
            account.setStatus("confirmed");
            accountService.save(account);
            return "redirect:/login?message=You have successfully registered!!!";
        } else {
            model.addAttribute("message", message);
            return "redirect:/register?message=I'm sorry the link broken!!!";
        }
    }

    @RequestMapping("/cart/{productId}")
    public String addToCart(Model model,
            @ModelAttribute("sizeId") int sizeId, @PathVariable("productId") int productId, HttpSession session,
            @ModelAttribute("colorId") int colorId) {
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        ProductEntity product = productService.findProductById(productId);
        if (product.getQuantity() <= 0) {
            return "redirect:/home?message=The product is out of stock, please come back later !!!";
        }
        SizeEntity size = sizeService.getSize(sizeId);
        ColorEntity color = colorService.getColor(colorId);
        ProductDetailEntity productDetail = new ProductDetailEntity();
        productDetail.setSize(size);
        productDetail.setColor(color);
        product.setProductDetailInOrder(productDetail);
        if (session.getAttribute("cart") == null) {
            List<Item> cart = new ArrayList<Item>();
            cart.add(new Item(product, 1));
            session.setAttribute("cart", cart);
        } else {
            List<Item> cart = (List<Item>) session.getAttribute("cart");

            int index = ProductExist.exists(productId, colorId, sizeId, cart);

            if (index == -1) {
                cart.add(new Item(product, 1));
            } else {
                int quantity = cart.get(index).getQuantity() + 1;
                cart.get(index).setQuantity(quantity);
            }
            session.setAttribute("cart", cart);
        }
        if (product != null && product.getId() > 0) {
            model.addAttribute("sessionCart", session.getAttribute("cart"));
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            model.addAttribute("totalProduct", cart.size());
            return "cart";
        } else {
            return "redirect:/home?message=Product Not Found&messageType=info";
        }
    }

    //trả về trang giỏ hàng
    @RequestMapping("/cart")
    public String addToCart(Model model,
            HttpSession session,
            @RequestParam(required = false, value = "message") String message) {
        model.addAttribute("message", message);
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if (cart != null) {
            model.addAttribute("totalProduct", cart.size());
            model.addAttribute("sessionCart", session.getAttribute("cart"));
        }
        return "cart";
    }

    //Xóa 1 sản phẩm trong giỏ hàng
    @RequestMapping(value = "remove-product/{productId}", method = RequestMethod.GET)
    public String remove(@PathVariable("productId") int productId, HttpSession session) {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        int i = ProductExist.existsPro(productId, cart);
        cart.remove(i);
        session.setAttribute("cart", cart);
        return "redirect:/cart";
    }

    //update lại số lượng trong giỏ
    @RequestMapping(value = "update-quantity/{productId}", method = RequestMethod.POST)
    public String updateQuantity(Model model, @ModelAttribute("quantity") int quantity, @PathVariable("productId") int productId, HttpSession session) {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        int index = ProductExist.existsPro(productId, cart);
        if (quantity <= 0 || quantity > cart.get(index).getProduct().getQuantity()) {
            cart.get(index).setQuantity(1);
        } else {
            cart.get(index).setQuantity(quantity);
        }
        session.setAttribute("cart", cart);
        return "redirect:/cart";
    }

    //order product
    @RequestMapping("/order")
    public String viewOrder(Model model,
            HttpSession session) {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if (cart == null || cart.size() <= 0) {
            return "redirect:/cart?message=You have no items in your shopping cart";
        } else {
            model.addAttribute("categories", categoryService.getCategories());
            model.addAttribute("objects", objectService.getObjects());
            model.addAttribute("sessionCart", session.getAttribute("cart"));
            model.addAttribute("totalProduct", cart.size());
            model.addAttribute("order", new OrderEntity());
            model.addAttribute("account", session.getAttribute("account"));
            return "order";
        }
    }

    //order thành công
    @RequestMapping(value = "/order-sucess", method = {RequestMethod.POST})
    public String orderSuccess(Model model,
            @ModelAttribute("order") OrderEntity orderEntity, HttpSession session, @ModelAttribute("totalPrice") double totalPriceOrder) throws MessagingException {
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if (cart != null) {
            AccountEntity account = (AccountEntity) session.getAttribute("account");
            if (account != null) {
                orderEntity.setAccount(account);
                orderEntity.setDateOfBirth(account.getDateOfBirth());
                orderService.save(orderEntity);
            }
            orderEntity.setTotalPrice(totalPriceOrder);
            orderService.save(orderEntity);
            for (int i = 0; i < cart.size(); i++) {
                OrderDetailEntity orderDetailEntity = new OrderDetailEntity();
                orderDetailEntity.setOrder(orderEntity);
                orderDetailEntity.setProduct(productService.findProductById(cart.get(i).getProduct().getId()));
                orderDetailEntity.setPrice(cart.get(i).getProduct().getPrice() - cart.get(i).getProduct().getPrice() * cart.get(i).getProduct().getPromotion().getDiscount());
                orderDetailEntity.setQuantity(cart.get(i).getQuantity());
                orderDetailEntity.setColorName(cart.get(i).getProduct().getProductDetailInOrder().getColor().getName());
                orderDetailEntity.setSizeName(cart.get(i).getProduct().getProductDetailInOrder().getSize().getName());
                orderDetailEntity.setPromotionId(cart.get(i).getProduct().getPromotion().getId());
                ProductEntity product = productService.findProductById(cart.get(i).getProduct().getId());
                product.setQuantity(cart.get(i).getProduct().getQuantity() - cart.get(i).getQuantity());
                productService.save(product);
                orderDetailService.save(orderDetailEntity);
            }
            StringBuilder text = new StringBuilder("");
            int stt = 1;
            double totalPrice = 0;
            LocalDate orderDate = LocalDate.now();
            String orderDateStr = orderDate.format(DateTimeFormatter.ofLocalizedDate(FormatStyle.LONG));
            LocalDate delivery = orderDate.plusDays(4);
            String deliveryDateStr = delivery.format(DateTimeFormatter.ofLocalizedDate(FormatStyle.LONG));

            for (Item item : cart) {
                totalPrice += (item.getQuantity() * item.getProduct().getPrice() - item.getQuantity() * item.getProduct().getPrice() * item.getProduct().getPromotion().getDiscount());

                text.append("<tr> \n"
                        + "<td>" + stt++ + "</td>\n"
                        + "<td>" + item.getProduct().getName() + "</td>\n"
                        + "<td>" + item.getQuantity() + "</td>\n"
                        + "<td>" + item.getProduct().getPromotion().getDescription() + "</td>\n"
                        + "<td>" + "$ " + String.format("%1$,.2f", (item.getProduct().getPrice() - item.getProduct().getPrice() * item.getProduct().getPromotion().getDiscount())) + "</td>\n"
                        + "<td>" + "$ " + String.format("%1$,.2f", (item.getQuantity()) * (item.getProduct().getPrice() - item.getProduct().getPrice() * item.getProduct().getPromotion().getDiscount())) + "</td>\n"
                        + "</tr>\n");
            }
            VerificationOrderToken verificationOrderToken = new VerificationOrderToken(orderEntity);
            verificationOrderTokenService.save(verificationOrderToken);
            emailSenderService.sendOrderEmail(orderEntity.getEmail(), "BSTORE - Confirm your order!!!", "<!DOCTYPE html>\n"
                    + "<html>\n"
                    + "<head>\n"
                    + "<style>\n"
                    + "#text {\n"
                    + "color:#3A3D42;\n"
                    + "font-family: \"Trebuchet MS\", Arial, Helvetica, sans-serif;\n"
                    + "font-size: 150%; \n"
                    + "font-style: inherit\n"
                    + "}\n"
                    + "#tittle {\n"
                    + "color:#3A3D42;\n"
                    + "text-align:center; \n"
                    + "  font-family: \"Trebuchet MS\", Arial, Helvetica, sans-serif;\n"
                    + "font-size: 200%; \n"
                    + "font-style: italic\n"
                    + "}\n"
                    + "#customers {\n"
                    + "  font-family: \"Trebuchet MS\", Arial, Helvetica, sans-serif;\n"
                    + "  border-collapse: collapse;\n"
                    + "  width: 100%;\n"
                    + "}\n"
                    + "\n"
                    + "#customers td, #customers th {\n"
                    + "  border: 1px solid #ddd;\n"
                    + "  padding: 8px;\n"
                    + "}\n"
                    + "\n"
                    + "\n"
                    + "#customers th {\n"
                    + "  padding-top: 12px;\n"
                    + "  padding-bottom: 12px;\n"
                    + "  text-align: left;\n"
                    + "  background-color: #3A3D42;\n"
                    + "  color: white;\n"
                    + "}\n"
                    + "</style>\n"
                    + "</head>\n"
                    + "<body>\n"
                    + "<h2 id=\"tittle\">CONFIRM YOUR ORDER</h2>\n"
                    + "<p id=\"text\">Order date: " + orderDateStr + "</p>\n"
                    + "<p id=\"text\">Expected delivery date: " + deliveryDateStr + "</p>\n"
                    + "<br>"
                    + "<table id=\"customers\">\n"
                    + "<tr>\n"
                    + "        <th>ID</th>\n"
                    + "        <th>Product</th>\n"
                    + "        <th>Quantity</th>\n"
                    + "        <th>Discount</th>\n"
                    + "        <th>Price</th>\n"
                    + "        <th>Into money</th>\n"
                    + "</tr>\n"
                    + text
                    + "<tr>\n"
                    + "<td style=\"text-align: right ; font-weight: bold\" colspan=\"5\">Total Price</td>\n"
                    + "<td>" + "$ " + String.format("%1$,.2f", totalPrice) + "</td>"
                    + "</tr>\n"
                    + "</table>\n"
                    + "<p id=\"text\">To confirm your orders, please click here : "
                    + "http://localhost:8080/Spring_Project_Final/order-confirm?token=" + verificationOrderToken.getToken() + "</p>\n"
                    + "</body>\n"
                    + "</html>");
            cart.removeAll(cart);
            return "redirect:/home?message=Please confirm your order by email address!!!";
        } else {
            return "redirect:/home?message=Product order faild!!!";
        }
    }

    @RequestMapping(value = "/order-confirm", method = {RequestMethod.GET, RequestMethod.POST})
    public String confirmOrder(Model model, @RequestParam("token") String confirmationToken) {
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("objects", objectService.getObjects());
        VerificationOrderToken token = verificationOrderTokenService.findByToken(confirmationToken);
        if (token != null) {
            OrderEntity order = orderService.findOrderById(token.getOrder().getId());
            order.setStatus("confirmed");
            orderService.save(order);
            return "redirect:/home?message=Thank you for your purchase!!!";
        } else {
            return "redirect:/home?message=The order has been canceled!!!";
        }
    }

}
