package cn.sxt.bus.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
* @Description:
* @param
* @Return:
* @Author: Mr.Wen
* @Date: 2019/1/18 15:50
*/
public class CarrentRandomUtils {
	

	private static SimpleDateFormat sdf1=new SimpleDateFormat("yyyyMMdd_HHmmss_SSS");
	private static Random random=new Random();
	
	/**
	 * 生成出租单和检查单的ID
	 * @param prefix 前缀
	 */
	public static String createRandomStringId(String prefix){
		String time=sdf1.format(new Date());
		Integer num=random.nextInt(9000)+1000;
		return prefix+"_"+time+"_"+num;
		
	}
	
	
	
}
