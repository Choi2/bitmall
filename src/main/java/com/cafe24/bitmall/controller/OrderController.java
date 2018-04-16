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

import com.cafe24.bitmall.service.OrderItemService;
import com.cafe24.bitmall.service.ItemService;
import com.cafe24.bitmall.service.MemberOptionService;
import com.cafe24.bitmall.service.OrderService;
import com.cafe24.bitmall.vo.BankVo;
import com.cafe24.bitmall.vo.CardVo;
import com.cafe24.bitmall.vo.OrderItemVo;
import com.cafe24.bitmall.vo.ItemVo;
import com.cafe24.bitmall.vo.MemberOptionVo;
import com.cafe24.bitmall.vo.MemberVo;
import com.cafe24.bitmall.vo.OrderVo;

@Controller
@RequestMapping("/order")
@SessionAttributes("authMember")
public class OrderController {
	
	@Autowired
	private ItemService itemService;

	@Autowired
	private OrderItemService orderItemService;
	
	@Autowired
	private OrderService orderService;
	
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
		
		List<OrderItemVo> orderItem = orderItemService.getListByMemberNo(member.getNo());
		
		List<ItemVo> newItemList = itemService.getRenewList(orderItem);
		List<MemberOptionVo> options = memberOptionService.get(orderItem);
		List<List<MemberOptionVo>> optionResult = memberOptionService.makeResult(orderItem, options);
		
		model.addAttribute("cartList", orderItem);
		model.addAttribute("list", newItemList);
		model.addAttribute("optionResult", optionResult);
		
		return "order/order";
	} //주문 폼 페이지
	

	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String addOrder(
			@ModelAttribute OrderVo order,
			@ModelAttribute("authMember") MemberVo authMember,
			@ModelAttribute BankVo bank,
			@ModelAttribute CardVo card,
			@ModelAttribute OrderItemVo orderItem,
			@ModelAttribute MemberOptionVo memberOption,
			@RequestParam("pay_type") String payType,
			@RequestParam(value="type", required=false, defaultValue="cart") String type) {

		long payNo = orderService.pay(payType, bank, card); // 결제방식 나눠야 함
		if(payType.equals("bank")) {
			order.setBankNo(payNo);
		} else {
			order.setCardNo(payNo);
		}
		orderService.registerItem(orderItem, type, memberOption, order); // 장바구니/바로 결제 나눠야 함

		return "order/order_ok";
	} // 주문 및 결제할때
	
}
