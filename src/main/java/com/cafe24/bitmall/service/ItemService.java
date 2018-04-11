package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.repository.ImageDao;
import com.cafe24.bitmall.repository.ItemDao;
import com.cafe24.bitmall.util.FileUploadService;
import com.cafe24.bitmall.vo.ImageVo;
import com.cafe24.bitmall.vo.ItemVo;

@Service
public class ItemService {

	@Autowired
	private ItemDao itemDao;
	
	@Autowired
	private ImageDao imageDao;
	
	public void addItem(ItemVo vo, MultipartFile multipartFile) {
		String imagePath = new FileUploadService().restore(multipartFile);
		vo.setImagePath(imagePath);
		
		if(vo.getIcon().charAt(2) == '1') {
			int retailPrice = vo.getSellingPrice() * ((100 - vo.getDiscount())/100);
			vo.setRetailPrice(retailPrice);
		} 
		
		itemDao.insert(vo);
		ImageVo image = new ImageVo();
		image.setPath(imagePath);
		image.setItemNo(vo.getNo());
		imageDao.insert(image);
	}

	public List<ItemVo> getList() {
		return itemDao.getList();
	}

	public ItemVo getOneItem(long no) {
		return itemDao.getByNo(no);
	}
	
}
