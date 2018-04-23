package com.cafe24.bitmall.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cafe24.bitmall.service.CategoryService;
import com.cafe24.bitmall.service.ItemOptionService;
import com.cafe24.bitmall.service.ItemService;
import com.cafe24.bitmall.service.MemberOptionService;
import com.cafe24.bitmall.service.OrderItemService;
import com.cafe24.bitmall.vo.CategoryVo;
import com.cafe24.bitmall.vo.ItemOptionVo;
import com.cafe24.bitmall.vo.ItemVo;
import com.cafe24.bitmall.vo.MemberOptionVo;
import com.cafe24.bitmall.vo.MemberVo;
import com.cafe24.bitmall.vo.OrderItemVo;

@Controller
@RequestMapping("/product")
@SessionAttributes("authMember")
public class ProductController {
	
	static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired private ItemService itemService;
	@Autowired private ItemOptionService itemOptionService;
	@Autowired private OrderItemService orderItemService;
	@Autowired private MemberOptionService memberOptionService;
	@Autowired private CategoryService categoryService;

	@RequestMapping("/detail")
	public String detail(
			@RequestParam("no") long no,
			Model model) {
		ItemVo vo = itemService.getOneItem(no);
		List<ItemOptionVo> itemOptionList = itemOptionService.get(vo.getNo());
		List<CategoryVo> categoryList = categoryService.getList();
		model.addAttribute("vo", vo);
		model.addAttribute("itemOptionList", itemOptionList);
		model.addAttribute("categoryList", categoryList);
		return "product/detail"; 
	} //상품 자세히 보기
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public String cartPage(@ModelAttribute("authMember") MemberVo member,
			Model model) {
		
		List<OrderItemVo> cartList = orderItemService.getListByMemberNo(member.getNo());
		
		List<ItemVo> newItemList = itemService.getRenewList(cartList);
		List<MemberOptionVo> options = memberOptionService.get(cartList);
		List<List<MemberOptionVo>> optionResult = memberOptionService.makeResult(cartList, options);
		model.addAttribute("list", newItemList);
		model.addAttribute("optionResult", optionResult);
		
		return "product/cart"; 
	}
	
	@RequestMapping(value="/cart", method=RequestMethod.POST)
	@Transactional
	public String cart(
			@RequestParam("itemNo") long itemNo,
			@ModelAttribute("itemCount") int itemCount,
			@ModelAttribute MemberOptionVo memberOption,
			@ModelAttribute("authMember") MemberVo member,
			Model model) {
		
		ItemVo item = itemService.getOneItem(itemNo);
		item.setItemCount(itemCount);
		logger.debug("ID : {}", "productController");
		orderItemService.addItem(item, member.getNo(), memberOption);
		List<OrderItemVo> cartList = orderItemService.getListByMemberNo(member.getNo());
		
		List<ItemVo> newItemList = itemService.getRenewList(cartList);
		List<MemberOptionVo> options = memberOptionService.get(cartList);
		List<List<MemberOptionVo>> optionResult = memberOptionService.makeResult(cartList, options);
		model.addAttribute("list", newItemList);
		model.addAttribute("optionResult", optionResult);
		
		return "product/cart"; 
	}

}
