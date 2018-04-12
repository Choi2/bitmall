package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.service.ItemService;
import com.cafe24.bitmall.service.OptionValueService;
import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.ItemVo;
import com.cafe24.bitmall.vo.MemberVo;
import com.cafe24.bitmall.vo.OptionValueVo;

@Controller
@RequestMapping("/product")
@SessionAttributes("authMember")
public class ProductController {
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private OptionValueService optionValueService;
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping("/detail")
	public String detail(
			@RequestParam("no") long no,
			Model model) {
		ItemVo vo = itemService.getOneItem(no);
		List<OptionValueVo> optionValueList = optionValueService.get(vo.getNo());
		model.addAttribute("vo", vo);
		model.addAttribute("optionList", optionValueList);
		return "product/detail"; 
	}
	
	@RequestMapping(value="/cart", method=RequestMethod.POST)
	public String cart(
			@RequestParam("itemNo") long no,
			@ModelAttribute("itemCount") int itemCount,
			@ModelAttribute("authMember") MemberVo member,
			Model model) {
		ItemVo vo = itemService.getOneItem(no);
		vo.setItemCount(itemCount);
		cartService.addItem(vo, member.getNo());
		List<CartVo> cartList = cartService.getList(member.getNo());
		List<ItemVo> newItemList = itemService.getRenewList(cartList);
		model.addAttribute("list", newItemList);
		return "product/cart"; 
	}

}
