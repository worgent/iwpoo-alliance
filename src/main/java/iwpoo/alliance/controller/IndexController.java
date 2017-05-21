package iwpoo.alliance.controller;


import java.util.List;

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

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/alliance")
public class IndexController {
	private static Log log = LogFactory.getLog(IndexController.class);
	@Autowired
	private MediaMapper mediaMapper;
	@Autowired
	private StatisticsMediaMapper statisticsMediaMapper;
	@Autowired
	private AllianceHotArticleMapper allianceHotArticleMapper;
	@Autowired
	private AlliancePictureMapper alliancePictureMapper;
	
	
	@RequestMapping("/toIndex.do")
	public String toIndex(HttpServletRequest request,Model model){
		//媒体是否显示的状态码
		int status = 0;
		// 媒体权重
    	String weight = null;
    	MediaExample mexa = new MediaExample();
    	//根据状态码查询媒体信息 并按照 权重weight排序
    	mexa.createCriteria().andStatusEqualTo(status);
    	mexa.setOrderByClause("weight desc");
    	List<Media> mediaList = mediaMapper.selectByExampleWithBLOBs(mexa);
    	//System.out.println("首页媒体信息："+mediaList.get(0).getMediaName()+"   "+mediaList.get(0).getMediaMaterials());
    	
    	model.addAttribute("mediaList", mediaList);
		return "alliance/alliance";
	}
	
	@RequestMapping("/toAdvertisement.do")
	public String toAdvertisement(HttpServletRequest request,Model model){
		
		return "alliance/advertisement";
		
	}
		
	@RequestMapping("/toAllianceDetailePage.do")
	public String toAllianceDetailePage(HttpServletRequest request,Model model){
		int status = 0;
		int mediaId = Integer.parseInt(request.getParameter("mediaId"));
		//根据媒体ID查询媒体媒体信息
    	Media media = mediaMapper.selectByPrimaryKey(mediaId);
    	
    	//根据媒体ID 查询媒体信息统计
    	StatisticsMediaExample sexa = new StatisticsMediaExample();
    	sexa.createCriteria().andMediaIdEqualTo(mediaId);
    	List<StatisticsMedia> statisticsMediaList = statisticsMediaMapper.selectByExample(sexa);
    	//System.out.println("媒体统计信息："+statisticsMediaList.get(0).getNewReadNum()+"  "+statisticsMediaList.get(0).getReadNum());
    	
    	//根据媒体ID 查询热门文章信息
    	AllianceHotArticleExample aaexa = new AllianceHotArticleExample();
    	aaexa.createCriteria().andMediaIdEqualTo(mediaId);
    	List<AllianceHotArticle> allianceHotArticleList = allianceHotArticleMapper.selectByExample(aaexa);
    	//System.out.println("热门文章信息："+allianceHotArticleList.get(0).getHotArticleName()+"  "+allianceHotArticleList.get(0).getExposureNum()+"  "+allianceHotArticleList.get(0).getReadNum()+"  "+allianceHotArticleList.get(0).getHotArticleLink());
    	
    	//根据媒体ID 查询证明图片 并状态为0
    	AlliancePictureExample apexa = new AlliancePictureExample();
    	apexa.createCriteria().andMediaIdEqualTo(mediaId).andStatusEqualTo(status);
    	apexa.setOrderByClause("weight desc");
    	List<AlliancePicture> alliancePictureList = alliancePictureMapper.selectByExample(apexa);
    	//System.out.println("证明图片信息： "+alliancePictureList.get(0).getPictureUrl()+" "+alliancePictureList.get(0).getDescription());
    	/*for (AlliancePicture alliancePicture : alliancePictureList) {
			log.info("证明图片权重："+alliancePicture.getWeight());
		}*/
    	model.addAttribute("media", media);
    	model.addAttribute("statisticsMediaList", statisticsMediaList);
    	model.addAttribute("allianceHotArticleList", allianceHotArticleList);
    	model.addAttribute("alliancePictureList", alliancePictureList);
		
		
		
		
		return "alliance/member";
	}
	
}

