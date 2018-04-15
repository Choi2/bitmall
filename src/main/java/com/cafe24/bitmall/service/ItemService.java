package com.cafe24.bitmall.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.repository.ImageDao;
import com.cafe24.bitmall.repository.ItemDao;
import com.cafe24.bitmall.repository.ItemOptionDao;
import com.cafe24.bitmall.util.FileUploadService;
import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.ImageVo;
import com.cafe24.bitmall.vo.ItemVo;
import com.cafe24.bitmall.vo.ItemOptionVo;

@Service
public class ItemService {

	@Autowired
	private ItemDao itemDao;
	
	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private ItemOptionDao itemOptionDao;
	
	public void addItem(
			ItemVo vo, 
			List<ItemOptionVo> itemOptionList,
			MultipartFile multipartFile) {
		
		System.out.println(itemOptionList);
		ImageVo image = new ImageVo();

		String imagePath = new FileUploadService().restore(multipartFile);
		vo.setImagePath(imagePath);
		
		if(vo.getIcon().charAt(2) == '1') {
			double discountPrice = vo.getSellingPrice() * ((double)((100 - vo.getDiscount())/100.0));
			vo.setDiscountPrice((int) discountPrice);
		} else {
			vo.setDiscountPrice(vo.getSellingPrice());
		}
		
		itemDao.insert(vo);
		
		image.setPath(imagePath);
		image.setItemNo(vo.getNo());
		imageDao.insert(image);
		
		System.out.println(itemOptionList);
		
		if(itemOptionList!=null && itemOptionList.size() != 0) {
			for(ItemOptionVo values : itemOptionList) {
				values.setItemNo(vo.getNo());
				itemOptionDao.insert(values);
			}
		}
	}

	public List<ItemVo> getList() {
		return itemDao.getList();
	}

	public ItemVo getOneItem(long no) {
		return itemDao.getByNo(no);
	}

	public List<ItemVo> getRenewList(List<CartVo> cartList) {
		
		List<ItemVo> itemList = new ArrayList<>();
		
		for(CartVo cart : cartList) {
			ItemVo vo = itemDao.getByNo(cart.getItemNo());
			vo.setItemCount(cart.getItemCount());
			itemList.add(vo);
		}
			
		return itemList;
	}

	public void delete(long itemNo) {
		
	}
	
}
