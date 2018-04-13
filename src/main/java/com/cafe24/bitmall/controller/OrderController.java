package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.service.ItemService;
import com.cafe24.bitmall.service.MemberOptionService;
import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.ItemVo;
import com.cafe24.bitmall.vo.MemberOptionVo;
import com.cafe24.bitmall.vo.MemberVo;

@Controller
@RequestMapping("/order")
@SessionAttributes("authMember")
public class OrderController {
	
	@Autowired
	private ItemService itemService;

	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberOptionService memberOptionService;
	
	@RequestMapping("")
	public String orderForm(
			@RequestParam(value="itemNo", required=false, defaultValue="0") long no,
			@RequestParam(value="type", required=false, defaultValue="1") String type,  
			@ModelAttribute("itemCount") int itemCount,
			@ModelAttribute("authMember") MemberVo member,
			@ModelAttribute MemberOptionVo memberOption,
			Model model) {
			
		if(type.equals("one")) {
			ItemVo vo = itemService.getOneItem(no);
			vo.setItemCount(itemCount);
			model.addAttribute("optionResult", memberOption.getMemberOptionList());
			model.addAttribute("list", vo);
			return "order/order";
		}
		
		List<CartVo> cartList = cartService.getList(member.getNo());
		
		List<ItemVo> newItemList = itemService.getRenewList(cartList);
		List<MemberOptionVo> options = memberOptionService.get(cartList);
		List<List<MemberOptionVo>> optionResult = memberOptionService.makeResult(cartList, options);
		
		model.addAttribute("list", newItemList);
		model.addAttribute("optionResult", optionResult);
		
		return "order/order";
	}
	
	
}
