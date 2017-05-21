package iwpoo.alliance.test;

import java.util.List;

import iwpoo.alliance.model.Media;
import iwpoo.alliance.model.MediaExample;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by tianbaochao on 2015/5/13.
 */
public class IndexTest {
	ApplicationContext context;
    @Before
    public void before(){
        //@SuppressWarnings("resource")
        context = new ClassPathXmlApplicationContext(new String[]{"classpath:conf/spring.xml"
                ,"classpath:conf/spring-mybatis.xml"});
        //userService = (UserService) context.getBean("userServiceImpl");
    }

    @Test
    public void toIndex(){
    	/*MediaService mediaService = (MediaService) context.getBean("mediaServiceImpl");
    	int status = 0;
    	String weight = null;
    	MediaExample mexa = new MediaExample();
    	mexa.createCriteria().andStatusEqualTo(status);
    	mexa.setOrderByClause(weight);
    	List<Media> mediaList = mediaService.getMediaByStatus(mexa);
    	System.out.println(mediaList.get(0).getContacts()+"   "+mediaList.get(0).getMediaMaterials());*/
    	
    }
}
