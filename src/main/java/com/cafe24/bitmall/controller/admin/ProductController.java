package com.cafe24.bitmall.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.interceptor.Auth;
import com.cafe24.bitmall.interceptor.Auth.Role;
import com.cafe24.bitmall.service.CategoryService;
import com.cafe24.bitmall.service.ItemOptionService;
import com.cafe24.bitmall.service.ItemService;
import com.cafe24.bitmall.service.OptionService;
import com.cafe24.bitmall.vo.CategoryVo;
import com.cafe24.bitmall.vo.ItemOptionVo;
import com.cafe24.bitmall.vo.ItemVo;
import com.cafe24.bitmall.vo.OptionVo;

@Controller("adminProductController")
@RequestMapping("/admin/product")
public class ProductController {
	
	@Autowired private CategoryService categoryService;
	@Autowired private OptionService optionService;
	@Autowired private ItemService itemService;
	@Autowired private ItemOptionService itemOptionService;
	
	@Auth(role=Role.ADMIN)
	@RequestMapping("")
	public String product(Model model) {
		List<ItemVo> list = itemService.getList();
		model.addAttribute("list", list);
		return "admin/product/list";
	}
	
	@Auth(role=Role.ADMIN)
	@RequestMapping("/new")
	public String productNew(Model model) {
		List<CategoryVo> categorylist = categoryService.getList();
		List<OptionVo> optionList = optionService.getList();
		model.addAttribute("categoryList", categorylist);
		model.addAttribute("optionList", optionList);	
		return "admin/product/add";
	}
	
	@Auth(role=Role.ADMIN)
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insert(
			@ModelAttribute ItemVo vo,
			@ModelAttribute ItemOptionVo itemOptionList,
			@RequestParam("file") MultipartFile multipartFile) {
		System.out.println("itemOptionList = " + itemOptionList);
		itemService.addItem(vo, itemOptionList.getItemOptionList(), multipartFile);
		return "redirect:/admin/product";
	}
	
	@Auth(role=Role.ADMIN)
	@ResponseBody
	@RequestMapping(value="/option_menu", method=RequestMethod.POST)
	public OptionVo optionMenu(@ModelAttribute OptionVo vo) {
		OptionVo option = optionService.get(vo);
		return option;
	}
	
	@Auth(role=Role.ADMIN)
	@RequestMapping("/modify")
	public String itemModifyForm(
			@RequestParam("no") long itemNo,
			Model model) {
		List<CategoryVo> categorylist = categoryService.getList();
		List<ItemOptionVo> itemOptionList = itemOptionService.get(itemNo);
		ItemVo item = itemService.getOneItem(itemNo);
		model.addAttribute("categoryList", categorylist);
		model.addAttribute("itemOptionList", itemOptionList);	
		model.addAttribute("vo", item);
		return "admin/product/modify";
	}
	
	@Auth(role=Role.ADMIN)
	@RequestMapping("/delete")
	public String itemDelete(
			@RequestParam("no") long itemNo) {
		itemService.delete(itemNo);
		return "redirect:/admin/product";
	}
	
}
