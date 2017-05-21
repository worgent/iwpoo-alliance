package iwpoo.alliance.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import iwpoo.alliance.dao.AllianceHotArticleMapper;
import iwpoo.alliance.dao.AlliancePictureMapper;
import iwpoo.alliance.dao.MediaMapper;
import iwpoo.alliance.dao.StatisticsMediaMapper;
import iwpoo.alliance.model.AllianceHotArticle;
import iwpoo.alliance.model.AllianceHotArticleExample;
import iwpoo.alliance.model.AlliancePicture;
import iwpoo.alliance.model.AlliancePictureExample;
import iwpoo.alliance.model.Media;
import iwpoo.alliance.model.MediaExample;
import iwpoo.alliance.model.StatisticsMedia;
import iwpoo.alliance.model.StatisticsMediaExample;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;


@Controller
@RequestMapping("/alliance")
public class AllianceAdminController {
	private static Log log = LogFactory.getLog(AllianceAdminController.class);
	@Autowired
	private MediaMapper mediaMapper;
	@Autowired
	private StatisticsMediaMapper statisticsMediaMapper;
	@Autowired
	private AllianceHotArticleMapper allianceHotArticleMapper;
	@Autowired
	private AlliancePictureMapper alliancePictureMapper;
	
	
	@RequestMapping("/toAllianceAdminPage.do")
	public String toIndex(HttpServletRequest request,Model model){
		
		//后台
		String weight = null;
		//首页->查询媒体信息按照权重拍讯
		MediaExample mexa = new MediaExample();
		mexa.setOrderByClause("weight desc");
		List<Media> mediaList = mediaMapper.selectByExampleWithBLOBs(mexa);
		
		model.addAttribute("mediaList", mediaList);
		
		return "alliance_admin/media_list_manage";
	}
	
	//添加媒体
	@RequestMapping("/saveMedia.do")
	public void saveMedia(/*@ModelAttribute Media media,*/HttpServletRequest request,Model model,PrintWriter out) throws Exception{
		//int mediaName = Integer.parseInt(request.getParameter("mediaName"));
		request.setCharacterEncoding("UTF-8");
		String mediaName = request.getParameter("mediaName");
		String phone = request.getParameter("phone");
		String identityCard = request.getParameter("identityCard");
		String materials = request.getParameter("mediaMaterials");
		String weixinPublic = request.getParameter("weixinPublic");
		//String twoDimensionCode = request.getParameter("twoDimensionCode");
		int status = Integer.parseInt(request.getParameter("status"));
		int weight = Integer.parseInt(request.getParameter("weight"));
		//System.out.println("ssssssssssssssssssss: "+mediaName);
		
		
		//创建一个通用的多部分解析器  
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext()); 
        int in = 0;
        String portraitPath = "/images/media-images/";
        String twoDimensionCodePath = "/images/media-images/";
        //判断 request 是否有文件上传,即多部分请求  
        if(multipartResolver.isMultipart(request)){
			//强制转换request
			MultipartHttpServletRequest multiRequest =  (MultipartHttpServletRequest) request;
			//取得request中的所有文件名  
	        Iterator<String> iter = multiRequest.getFileNames();  
	        
	        while(iter.hasNext()){  
	        	in++;
	            //取得上传文件  
	            MultipartFile file =   multiRequest.getFile(iter.next());
	            if(file != null){  
	                //取得当前上传文件的文件名称  
	                String myFileName = file.getOriginalFilename();  
	                //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
	                if(myFileName.trim() !=""){  
	                   // System.out.println(myFileName);  
	                    //重命名上传后的文件名  
	                    String fileName = "";
	            		fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
	            		Random random = new Random();
	            		for(int i = 0 ; i < 3 ;i++){
	            			fileName = fileName + random.nextInt(10);
	            		}
	            		String suffix = myFileName.substring(myFileName.lastIndexOf("."));
	            		String newFileName = fileName+suffix;
	                    //定义上传路径  
	            		String realPath = request.getSession().getServletContext().getRealPath("/images/media-images");
	                   // System.out.println(realPath);
	                    File localFile = new File(realPath,newFileName);  
	                    file.transferTo(localFile);
	                   // String picPath = localFile.toString();
	                    
	                    
	                    if(in==1){
	                    	portraitPath = portraitPath + newFileName;
	    		        }
	                    if(in==2){
	                    	twoDimensionCodePath = twoDimensionCodePath + newFileName;
	                    }
	                }  
	            } 
	            
	        }
	        
        }
       // D:\comcat7.0.47\apache-tomcat-7.0.47\mywebs\iwpoo-alliance\images\media-images\20150714103553462274.png
        log.info("媒体头像Path: "+portraitPath);
        log.info("媒体二维码Path: "+twoDimensionCodePath);
        Media media = new Media();
		media.setIdentityCard(identityCard);;
		media.setMediaMaterials(materials);
		media.setMediaName(mediaName);
		media.setPhone(phone);
		media.setStatus(status);
		media.setWeight(weight);
		media.setWeixinPubilc(weixinPublic);
		/*String s = portraitPath.substring(5);
		System.out.println(s);*/
		media.setMediaPortrait(portraitPath);
		media.setTwoDimensionCode(twoDimensionCodePath);
		int i = mediaMapper.insertSelective(media);
		//得到 新添加的媒体 ID
		int mediaID = media.getMediaId();
		if(i==1){
			//
			StatisticsMedia statisticsMedia = new StatisticsMedia();
			statisticsMedia.setMediaId(mediaID);
			statisticsMediaMapper.insertSelective(statisticsMedia);
				
			out.write("1");
		}else{
			out.write("0");
		}
		
	}
	
	//删除媒体
	@RequestMapping("/deleteMedia.do")
	public void deleteMedia(HttpServletRequest request,PrintWriter out){
		int mediaId = Integer.parseInt(request.getParameter("mediaId"));
		int r = mediaMapper.deleteByPrimaryKey(mediaId);
		if(r==1){
			out.write("1");
		}else{
			out.write("0");
		}
		
		//System.out.println(mediaId);
	}
	
	//修改媒体信息
	@RequestMapping("/updateMedia.do")
	public void updateMedia(HttpServletRequest request,PrintWriter out) throws Exception{
		int mediaId = Integer.parseInt(request.getParameter("id"));
		String mediaName = request.getParameter("mediaName");
		String phone = request.getParameter("phone");
		String identityCard = request.getParameter("identityCard");
		String materials = request.getParameter("mediaMaterials");
		String weixinPublic = request.getParameter("weixinPublic");
		int status = Integer.parseInt(request.getParameter("status"));
		int weight = Integer.parseInt(request.getParameter("weight"));
		//查询出修改前的 头像和二维码路径
		Media medias = mediaMapper.selectByPrimaryKey(mediaId);
		String mediaPortrait = medias.getMediaPortrait();
		String twoDimensionCode = medias.getTwoDimensionCode();
		
		//创建一个通用的多部分解析器  
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext()); 
        int in = 0;
        String portraitPath = "/images/media-images/";
        String twoDimensionCodePath = "/images/media-images/";
        //判断 request 是否有文件上传,即多部分请求  
        if(multipartResolver.isMultipart(request)){
			//强制转换request
			MultipartHttpServletRequest multiRequest =  (MultipartHttpServletRequest) request;
			//取得request中的所有文件名  
	        Iterator<String> iter = multiRequest.getFileNames();  
	        
	        while(iter.hasNext()){  
	        	in++;
	            //取得上传文件  
	            MultipartFile file =   multiRequest.getFile(iter.next());
	            if(file != null){  
	                //取得当前上传文件的文件名称  
	                String myFileName = file.getOriginalFilename();  
	                //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
	                if(myFileName.trim() !=""){  
	                   // System.out.println(myFileName);  
	                    //重命名上传后的文件名  
	                    String fileName = "";
	            		fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
	            		Random random = new Random();
	            		for(int i = 0 ; i < 3 ;i++){
	            			fileName = fileName + random.nextInt(10);
	            		}
	            		String suffix = myFileName.substring(myFileName.lastIndexOf("."));
	            		String newFileName = fileName+suffix;
	                    //定义上传路径  
	            		String realPath = request.getSession().getServletContext().getRealPath("/images/media-images");
	                   // System.out.println(realPath);
	                    File localFile = new File(realPath,newFileName);  
	                    file.transferTo(localFile);
	                   // String picPath = localFile.toString();
	                    
	                    
	                    if(in==1){
	                    	portraitPath = portraitPath + newFileName;
	    		        }
	                    if(in==2){
	                    	twoDimensionCodePath = twoDimensionCodePath + newFileName;
	                    }
	                }else if(in == 1){
	                	portraitPath = mediaPortrait;
	                }else if(in == 2){
	                	twoDimensionCodePath = twoDimensionCode;
	                }
	            } 
	            
	        }
	        
        }
		
		
		Media media = new Media();
		media.setMediaName(mediaName);
		media.setPhone(phone);
		media.setIdentityCard(identityCard);
		media.setMediaMaterials(materials);
		media.setWeixinPubilc(weixinPublic);
		media.setStatus(status);
		media.setWeight(weight);
		media.setMediaPortrait(portraitPath);
		media.setTwoDimensionCode(twoDimensionCodePath);
		
		MediaExample mexa2 = new MediaExample();
		mexa2.createCriteria().andMediaIdEqualTo(mediaId);
		int i = mediaMapper.updateByExampleSelective(media, mexa2);
		if(i == 1){
		out.write("1");
		}else{
			out.write("0");
		}
	}
	
	
	@RequestMapping("/toHotArticlePage.do")
	public String toHotArticlePage(HttpServletRequest request,Model model){
		
		int mediaId = Integer.parseInt(request.getParameter("mediaId"));
		AllianceHotArticleExample ahaexa = new AllianceHotArticleExample();
		ahaexa.createCriteria().andMediaIdEqualTo(mediaId);
		List<AllianceHotArticle> allianceHotArticleList = allianceHotArticleMapper.selectByExample(ahaexa);
		
		model.addAttribute("allianceHotArticleList", allianceHotArticleList);
		return "alliance_admin/hot_article_admin";
	}
	
	@RequestMapping("/saveHotArticle.do")
	public void saveHotArticle(HttpServletRequest request,Model model,PrintWriter out){
        
		int mediaId = Integer.parseInt(request.getParameter("mediaId"));
		String hotArticleName = request.getParameter("hotArticleName");
		String hotArticleLink = request.getParameter("hotArticleLink");
		int exposureNum = Integer.parseInt(request.getParameter("exposureNum"));
		int readNum = Integer.parseInt(request.getParameter("readNum"));
		
		
		AllianceHotArticle allianceHotArticle = new AllianceHotArticle();
		allianceHotArticle.setMediaId(mediaId);
		allianceHotArticle.setExposureNum(exposureNum);
		allianceHotArticle.setHotArticleLink(hotArticleLink);
		allianceHotArticle.setHotArticleName(hotArticleName);
		allianceHotArticle.setReadNum(readNum);
		
		
		int i = allianceHotArticleMapper.insertSelective(allianceHotArticle);
		if(i == 1){
			out.write("1");
		}else{
			out.write("0");
		}
		
	}
	

	@RequestMapping("/updateHotArticle.do")
	public void updateHotArticle(HttpServletRequest request,Model model,PrintWriter out){
        
		int mediaId = Integer.parseInt(request.getParameter("mediaId"));
		int id = Integer.parseInt(request.getParameter("id"));
		String hotArticleName = request.getParameter("hotArticleName");
		String hotArticleLink = request.getParameter("hotArticleLink");
		int exposureNum = Integer.parseInt(request.getParameter("exposureNum"));
		int readNum = Integer.parseInt(request.getParameter("readNum"));
		
		
		AllianceHotArticle allianceHotArticle = new AllianceHotArticle();
		allianceHotArticle.setMediaId(mediaId);
		allianceHotArticle.setExposureNum(exposureNum);
		allianceHotArticle.setHotArticleLink(hotArticleLink);
		allianceHotArticle.setHotArticleName(hotArticleName);
		allianceHotArticle.setReadNum(readNum);
		
		AllianceHotArticleExample ahaexa = new AllianceHotArticleExample();
		ahaexa.createCriteria().andMediaIdEqualTo(mediaId).andIdEqualTo(id);
		int i = allianceHotArticleMapper.updateByExampleSelective(allianceHotArticle, ahaexa);
		if(i == 1){
			out.write("1");
		}else{
			out.write("0");
		}
		
	}
	
	
	@RequestMapping("/deleteHotArticle.do")
	public void deleteHotArticle(HttpServletRequest request,Model model,PrintWriter out){
        
		int id = Integer.parseInt(request.getParameter("hotArticleId"));
		
		int i = allianceHotArticleMapper.deleteByPrimaryKey(id);
		if(i == 1){
			out.write("1");
		}else{
			out.write("0");
		}
		
		
	}
	
	
	@RequestMapping("/toAlliancePicturePage.do")
	public String toAlliancePicturePage(HttpServletRequest request,Model model){
		int mediaId = Integer.parseInt(request.getParameter("mediaId"));
		AlliancePictureExample apexa = new AlliancePictureExample();
		apexa.createCriteria().andMediaIdEqualTo(mediaId);
		apexa.setOrderByClause("weight desc");
		List<AlliancePicture> alliancePictureList = alliancePictureMapper.selectByExample(apexa);
		model.addAttribute("alliancePictureList", alliancePictureList);
		return "alliance_admin/alliance_picture";
	}
	
	//添加图片
	@RequestMapping("/saveAlliancePicture.do")
	public void saveAlliancePicture(HttpServletRequest request,Model model,PrintWriter out) throws Exception{
		int mediaId = Integer.parseInt(request.getParameter("mediaId"));
		String description = request.getParameter("description");
		int weight = Integer.parseInt(request.getParameter("weight"));
		int status = Integer.parseInt(request.getParameter("status"));
		
		//图片上传
		//创建一个通用的多部分解析器  
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext()); 
        String alliancePicturePath = "/images/prove-images/";
        //判断 request 是否有文件上传,即多部分请求  
        if(multipartResolver.isMultipart(request)){
			//强制转换request
			MultipartHttpServletRequest multiRequest =  (MultipartHttpServletRequest) request;
			//取得request中的所有文件名  
	        Iterator<String> iter = multiRequest.getFileNames();  
	        
	        while(iter.hasNext()){  
	            //取得上传文件  
	            MultipartFile file =   multiRequest.getFile(iter.next());
	            if(file != null){  
	                //取得当前上传文件的文件名称  
	                String myFileName = file.getOriginalFilename();  
	                //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
	                if(myFileName.trim() !=""){  
	                   // System.out.println(myFileName);  
	                    //重命名上传后的文件名  
	                    String fileName = "";
	            		fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
	            		Random random = new Random();
	            		for(int i = 0 ; i < 3 ;i++){
	            			fileName = fileName + random.nextInt(10);
	            		}
	            		String suffix = myFileName.substring(myFileName.lastIndexOf("."));
	            		String newFileName = fileName+suffix;
	                    //定义上传路径  
	            		String realPath = request.getSession().getServletContext().getRealPath("/images/prove-images");
	                   // System.out.println(realPath);
	                    File localFile = new File(realPath,newFileName);  
	                    file.transferTo(localFile);
	                   // String picPath = localFile.toString();
	                    
	                    alliancePicturePath = alliancePicturePath + newFileName;
	                }  
	            } 
	            
	        }
	        
        }
        
        AlliancePicture alliancePicture = new AlliancePicture();
		alliancePicture.setMediaId(mediaId);
		alliancePicture.setDescription(description);
		alliancePicture.setPictureUrl(alliancePicturePath);
		alliancePicture.setStatus(status);
		alliancePicture.setWeight(weight);
		
		int i = alliancePictureMapper.insertSelective(alliancePicture);
		if(i == 1){
			out.write("1");
		}else{
			out.write("0");
		}
	}
	
	//修改图片信息
		@RequestMapping("/updateAlliancePicture.do")
		public void updateAlliancePicture(HttpServletRequest request,PrintWriter out) throws Exception{
			int mediaId = Integer.parseInt(request.getParameter("mediaId"));
			int alliancePicId = Integer.parseInt(request.getParameter("alliancePicId"));
			String description = request.getParameter("description");
			int weight = Integer.parseInt(request.getParameter("weight"));
			int status = Integer.parseInt(request.getParameter("status"));
			
			AlliancePictureExample apexa = new AlliancePictureExample();
			apexa.createCriteria().andMediaIdEqualTo(mediaId).andIdEqualTo(alliancePicId);
			List<AlliancePicture> alliancePictureList = alliancePictureMapper.selectByExample(apexa);
			String pictureUrl = alliancePictureList.get(0).getPictureUrl();
			
			//图片上传
			//创建一个通用的多部分解析器  
	        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext()); 
	        String alliancePicturePath = "/images/prove-images/";
	        //判断 request 是否有文件上传,即多部分请求  
	        if(multipartResolver.isMultipart(request)){
				//强制转换request
				MultipartHttpServletRequest multiRequest =  (MultipartHttpServletRequest) request;
				//取得request中的所有文件名  
		        Iterator<String> iter = multiRequest.getFileNames();  
		        
		        while(iter.hasNext()){  
		            //取得上传文件  
		            MultipartFile file =   multiRequest.getFile(iter.next());
		            if(file != null){  
		                //取得当前上传文件的文件名称  
		                String myFileName = file.getOriginalFilename();  
		                //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
		                if(myFileName.trim() !=""){  
		                   // System.out.println(myFileName);  
		                    //重命名上传后的文件名  
		                    String fileName = "";
		            		fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		            		Random random = new Random();
		            		for(int i = 0 ; i < 3 ;i++){
		            			fileName = fileName + random.nextInt(10);
		            		}
		            		String suffix = myFileName.substring(myFileName.lastIndexOf("."));
		            		String newFileName = fileName+suffix;
		                    //定义上传路径  
		            		String realPath = request.getSession().getServletContext().getRealPath("/images/prove-images");
		                   // System.out.println(realPath);
		                    File localFile = new File(realPath,newFileName);  
		                    file.transferTo(localFile);
		                   // String picPath = localFile.toString();
		                   
		                    alliancePicturePath = alliancePicturePath + newFileName;
		                }else{
		    	        	alliancePicturePath = pictureUrl;
		    	        }  
		            } 
		            
		        }
		        
	        }
			
	      //修改图片信息
			AlliancePicture alliancePicture = new AlliancePicture();
			alliancePicture.setDescription(description);
			
			alliancePicture.setPictureUrl(alliancePicturePath);
			alliancePicture.setStatus(status);
			alliancePicture.setWeight(weight);
			
			//AlliancePictureExample apexa = new AlliancePictureExample();
			//apexa.createCriteria().andMediaIdEqualTo(mediaId).andIdEqualTo(alliancePicId);
			int i = alliancePictureMapper.updateByExampleSelective(alliancePicture, apexa);
			if(i == 1){
				out.write("1");
			}else{
				out.write("0");
			}
		}
	

		@RequestMapping("/deleteAlliancePicture.do")
		public void deleteAlliancePicture(HttpServletRequest request,Model model,PrintWriter out){
	        
			int id = Integer.parseInt(request.getParameter("alliancePictureId"));
			
			//删除图片
			int i = alliancePictureMapper.deleteByPrimaryKey(id);
			
			if(i == 1){
				out.write("1");
			}else{
				out.write("0");
			}
			
			
		}
		
		@RequestMapping("/selectStatisticsMedia.do")
		public @ResponseBody List<StatisticsMedia> selectStatisticsMedia(HttpServletRequest request,Model model){
			int meidaId = Integer.parseInt(request.getParameter("mediaId"));
			StatisticsMediaExample smexa = new StatisticsMediaExample();
			smexa.createCriteria().andMediaIdEqualTo(meidaId);
			List<StatisticsMedia> statisticsMediaList = statisticsMediaMapper.selectByExample(smexa);
			
			//model.addAttribute("statisticsMediaList", statisticsMediaList);
			
			return statisticsMediaList;
		}
		
		@RequestMapping("/updateStatisticsMedia.do")
		public void updateStatisticsMedia(HttpServletRequest request,Model model,PrintWriter out){
			
			int mediaId = Integer.parseInt(request.getParameter("staMediaId"));
			int readNum = Integer.parseInt(request.getParameter("staReadNum"));
			int newReadNum = Integer.parseInt(request.getParameter("staNewReadNum"));
			
			StatisticsMedia statisticsMedia = new StatisticsMedia();
			statisticsMedia.setNewReadNum(newReadNum);
			statisticsMedia.setReadNum(readNum);
			
			
			StatisticsMediaExample smexa = new StatisticsMediaExample();
			smexa.createCriteria().andMediaIdEqualTo(mediaId);
			
			int i = statisticsMediaMapper.updateByExampleSelective(statisticsMedia, smexa);		
			if(i == 1){
				out.write("1");
			}else{
				out.write("0");
			}
			
			
		}
		
	
}

