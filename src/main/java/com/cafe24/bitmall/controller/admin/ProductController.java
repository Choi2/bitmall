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

import com.cafe24.bitmall.service.CategoryService;
import com.cafe24.bitmall.service.ItemService;
import com.cafe24.bitmall.service.OptionService;
import com.cafe24.bitmall.vo.CategoryVo;
import com.cafe24.bitmall.vo.ItemVo;
import com.cafe24.bitmall.vo.OptionVo;

@Controller("adminProductController")
@RequestMapping("/admin/product")
public class ProductController {
	
	@Autowired private CategoryService categoryService;
	@Autowired private OptionService optionService;
	@Autowired private ItemService itemService;
	
	@RequestMapping("")
	public String product(Model model) {
		List<ItemVo> list = itemService.getList();
		model.addAttribute("list", list);
		return "admin/product/list";
	}
	
	@RequestMapping("/new")
	public String productNew(Model model) {
		List<CategoryVo> categorylist = categoryService.getList();
		List<OptionVo> optionList = optionService.getList();
		model.addAttribute("categoryList", categorylist);
		model.addAttribute("optionList", optionList);	
		return "admin/product/add";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insert(
			@ModelAttribute ItemVo vo,
			@RequestParam("file") MultipartFile multipartFile) {
		System.out.println(vo);
		itemService.addItem(vo, multipartFile);
		return "redirect:/admin/product";
	}
	
	@ResponseBody
	@RequestMapping(value="/option_menu", method=RequestMethod.POST)
	public OptionVo optionMenu(@ModelAttribute OptionVo vo) {
		OptionVo option = optionService.get(vo);
		System.out.println(option);
		return option;
	}
	
}
