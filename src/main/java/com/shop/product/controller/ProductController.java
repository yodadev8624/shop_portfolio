package com.shop.product.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.product.domain.ProductDTO;
import com.shop.product.service.ProductService;


@Controller
public class ProductController {
	
	@Autowired
	Properties fileUploadProperty;

	@Autowired
	ProductService productService;
		
	/**
	 * 상품 리스트로 이동
	 */
	@GetMapping("/products/list")
 	public String productList() throws Exception {
		return "product/list";
	}
	
	/**
	 * 상품 상세 페이지로 이동
	 */
	@GetMapping("/products/view")
 	public String productView(@RequestParam(value="pd_code")String pd_code, Model model) throws Exception {
		ProductDTO product = productService.selectProduct(pd_code);
		ProductDTO product2 = productService.selectProductCount(pd_code);
		model.addAttribute("product", product);
		model.addAttribute("product2", product2);
		return "product/view";
	}
	
	/**
	 * 상품 이미지
	 */
	@GetMapping("/product/image")
	public ResponseEntity<byte[]> imageshow(HttpServletRequest request, ModelMap model) throws Exception {
		request.setCharacterEncoding("UTF-8");

		String fileName = "";
		fileName = request.getParameter("file").toString();

		String uploadPath = fileUploadProperty.getProperty("file.uploadImg.path");

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		if (fileName.equals("") || fileName == null) {
			return null;
		}

		try {
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);

			// 알려지지 않은 파일 타입.
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition",
					"attatchment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}

		return entity;
	}
	
}
