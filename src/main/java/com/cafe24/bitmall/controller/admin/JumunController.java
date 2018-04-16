package com.cafe24.bitmall.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.interceptor.Auth;
import com.cafe24.bitmall.interceptor.Auth.Role;
import com.cafe24.bitmall.service.OrderItemService;
import com.cafe24.bitmall.service.ItemService;
import com.cafe24.bitmall.service.MemberOptionService;
import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.service.OrderService;
import com.cafe24.bitmall.vo.BankVo;
import com.cafe24.bitmall.vo.CardVo;
import com.cafe24.bitmall.vo.OrderItemVo;
import com.cafe24.bitmall.vo.ItemVo;
import com.cafe24.bitmall.vo.MemberOptionVo;
import com.cafe24.bitmall.vo.MemberVo;
import com.cafe24.bitmall.vo.OrderVo;

@Controller
@RequestMapping("/admin/jumun")
public class JumunController {
	
	@Autowired private OrderService orderService;
	@Autowired private MemberService memberService;
	@Autowired private OrderItemService cartService;
	@Autowired private ItemService itemService;
	@Autowired private MemberOptionService memberOptionService;

	@Auth(role=Role.ADMIN)
	@RequestMapping("")
	public String jumun(Model model) {
		List<OrderVo> list= orderService.getList();
		model.addAttribute("list", list);
		return "admin/order/list";
	}
	
	@Auth(role=Role.ADMIN)
	@RequestMapping("/info")
	public String info(Model model, @RequestParam("no") long orderNo) {
		OrderVo order = orderService.getOne(orderNo);
		MemberVo member = memberService.getMember(order.getMemberNo());
		
		if(order.getBankNo()!=0) {
			BankVo bank = orderService.getBank(order.getBankNo());
			model.addAttribute("bank", bank);
		} else {
			CardVo card = orderService.getCard(order.getCardNo());
			model.addAttribute("card", card);
		}
		
		List<OrderItemVo> cartList = cartService.getListByOrderNo(orderNo);
		List<ItemVo> newItemList = itemService.getRenewList(cartList);
		List<MemberOptionVo> options = memberOptionService.get(cartList);
		List<List<MemberOptionVo>> optionResult = memberOptionService.makeResult(cartList, options);
		
		System.out.println("cartList : " + cartList);
		System.out.println("newItemList : " + newItemList);
		System.out.println("optionResult : " + optionResult);

		model.addAttribute("list", newItemList); //상품리스트
		model.addAttribute("optionResult", optionResult); //옵션
		model.addAttribute("order", order); //받는자 정보
		model.addAttribute("member", member); //주문자 정보
		return "admin/order/info";
	}
	
	
	@Auth(role=Role.ADMIN)
	@ResponseBody
	@RequestMapping(value="/modifyStatus", method=RequestMethod.POST)
	public boolean modifyStatus(
			@RequestParam("no") long orderNo,
			@RequestParam("status") String status) {
		boolean result = false;
		result = orderService.modifyStatus(orderNo, status);
		return result;
	} //주문 상태 수정하기
	
	
	@Auth(role=Role.ADMIN)
	@RequestMapping("/delete")
	public String memberDelete(
			@RequestParam("no") long orderNo) {
		orderService.delete(orderNo);
		return "redirect:/admin/jumun";
	} //주문 관리 - 지우기
	
}
