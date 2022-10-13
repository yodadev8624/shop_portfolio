package com.shop.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.shop.product.domain.ProductDTO;
import com.shop.product.service.ProductService;

@Controller
public class MainController {
	@Autowired
	ProductService productService;
	
	/**
	 * 메인 페이지로 이동
	 */
	@GetMapping("/")
 	public String main(Model model) throws Exception {
		List<ProductDTO> product = productService.selectProductList();
		model.addAttribute("product", product);
		return "index";
	}
	
}
