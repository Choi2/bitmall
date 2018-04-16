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
import com.cafe24.bitmall.vo.OrderItemVo;
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

	public List<ItemVo> getRenewList(List<OrderItemVo> orderItemList) {
		
		List<ItemVo> itemList = new ArrayList<>();
		
		for(OrderItemVo orderItem : orderItemList) {
			ItemVo vo = itemDao.getByNo(orderItem.getItemNo());
			vo.setItemCount(orderItem.getItemCount());
			itemList.add(vo);
		}
			
		return itemList;
	}

	public int delete(long itemNo) {
		return itemDao.delete(itemNo);
	}

	public List<ItemVo> getListByCategoryNo(long categoryNo) {
		return itemDao.getListByCategoryNo(categoryNo);
	}

	public void modifyItem(
			ItemVo vo, 
			List<ItemOptionVo> itemOptionList, 
			MultipartFile multipartFile) {
		
		String imagePath = "";
		ImageVo image = new ImageVo();
		
		if( multipartFile.getOriginalFilename() != null && 
			multipartFile.getOriginalFilename().equals("") == false) {
			imagePath = new FileUploadService().restore(multipartFile);
			vo.setImagePath(imagePath);
		} else {
			imagePath = vo.getImagePath();
		} //그림이 이미 있는 경우에는 FileUplodaService에 갈 필요가 없다.
		
		if(vo.getIcon().charAt(2) == '1') {
			double discountPrice = vo.getSellingPrice() * ((double)((100 - vo.getDiscount())/100.0));
			vo.setDiscountPrice((int) discountPrice);
		} else {
			vo.setDiscountPrice(vo.getSellingPrice());
		}
		
		itemDao.update(vo);
		
		image.setPath(imagePath);
		image.setItemNo(vo.getNo());
		imageDao.update(image);
		
		System.out.println(itemOptionList);
		
		if(itemOptionList!=null && itemOptionList.size() != 0) {
			for(ItemOptionVo values : itemOptionList) {
				values.setItemNo(vo.getNo());
				itemOptionDao.update(values);
			}
		}
	}

	
}
