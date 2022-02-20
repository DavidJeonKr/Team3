package com.itwill.dd.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter; 
import java.util.List;
import java.util.UUID;

import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.itwill.dd.domain.CategoryVO;
import com.itwill.dd.domain.ProductVO;
import com.itwill.dd.domain.ProductViewVO;
import com.itwill.dd.service.AdminService;
import com.itwill.dd.utils.UploadFileUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	// servlet-context.xml에서 설정한 uploadPath 추가
	@Resource(name="uploadPath")
	private String uploadPath;
		
	@RequestMapping(value = "/goods/main", method = RequestMethod.GET)
	public void getMain() throws Exception {
		
		log.info("getMain 호출");
	}
	
	
	// 상품 등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRegister(Model model) throws Exception {
		log.info("getGoodsRegister 호출");
		
		List<CategoryVO> category = null;
		category = adminService.category();
		
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	
	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/goods/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req,
									  HttpServletResponse res,
									  @RequestParam MultipartFile upload) throws Exception {
		log.info("post CKEditor img upload");
		
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();
		
		OutputStream out = null;
		PrintWriter printWriter = null;
				
		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		try {
			
			String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();
			
			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
			
			log.info(ckUploadPath);
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush();  // out에 저장된 데이터를 전송하고 초기화
			
			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/resources/ckUpload/" + uid + "_" + fileName;  // 작성화면
			
			log.info(fileUrl);
			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
			
			printWriter.flush();
			
		} catch (IOException e) { e.printStackTrace();
		} finally {
			try {
				if(out != null) { out.close(); }
				if(printWriter != null) { printWriter.close(); }
			} catch(IOException e) { e.printStackTrace(); }
		} 
		
		return;	
	}
	
	// 상품 등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String postGoodsRegister(ProductVO product, MultipartFile file) throws Exception {
		log.info("postGoodsRegister 호출");
		
		// 이미지 등록
		String imgUploadPath = uploadPath + File.separator + "/imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		product.setProductImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		product.setProductThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		adminService.register(product);
		
		return "redirect:/admin/goods/list";
	}
	
	// 상품 목록	
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void getGoodsList(Model model) {
		log.info("getGoodsList 호출");
		
		List<ProductViewVO> list = adminService.goodsList();
		
		model.addAttribute("list", list);
		
	}
	
	
	// 상품 조회	
	@RequestMapping(value = "/goods/detail", method = RequestMethod.GET)
	public void getGoodsDetail(@RequestParam("n") int productId, Model model) {
		log.info("getGoodsDetail 호출");
		
		ProductViewVO product = adminService.goodsDetail(productId);
		
		model.addAttribute("product", product);
	}
	
	// 상품 수정 화면
	@RequestMapping(value = "/goods/update", method = RequestMethod.GET)
	public void getGoodsUpdate(@RequestParam("n") int productId, Model model) {
		log.info("getGoodsUpdate 호출");
		
		ProductViewVO product = adminService.goodsDetail(productId);		
		model.addAttribute("product", product);
		
		List<CategoryVO> category = null;
		category = adminService.category();
		
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	// 상품 수정 완료
	@RequestMapping(value = "/goods/update", method = RequestMethod.POST)
	public String postGoodsUpdate(ProductVO product, MultipartFile file, HttpServletRequest req) throws IOException, Exception {
		log.info("POSTgoodsUpdate 호출");
		
		 // 새로운 파일이 등록되었는지 확인
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // 기존 파일을 삭제
		  new File(uploadPath + req.getParameter("productImg")).delete();
		  new File(uploadPath + req.getParameter("productThumbImg")).delete();
		  
		  // 새로 첨부한 파일을 등록
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  product.setProductImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  product.setProductThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  // 새로운 파일이 등록되지 않았다면
		  // 기존 이미지를 그대로 사용
		  product.setProductImg(req.getParameter("productImg"));
		  product.setProductThumbImg(req.getParameter("productThumbImg"));
		  
		 }
		 
		adminService.goodsUpdate(product);
		
		return "redirect:/admin/goods/list";
	}
	
	// 상품 삭제
	@RequestMapping(value = "/goods/delete", method = RequestMethod.POST)
	public String postGoodsDelete(@RequestParam("n") int productId) {
		
		adminService.goodsDelete(productId);
		
		return "redirect:/admin/goods/list";
	}
	
	

}
