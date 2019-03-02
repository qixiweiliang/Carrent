package cn.sxt.bus.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.util.EnumMap;

/**
 * 生成二维码的工具类
 * 
 * @author LJH
 * 
 */
public class ZXingEncodeUtils {

	// 二维码颜色
	private static final int BLACK = 0xFF000000; // RGB red green blue
													// 255*255*255 #FFF 15*15*15
	// 二维码背景颜色
	private static final int WHITE = 0xFFFFFFFF;

	// 二维码格式参数
	private static final EnumMap<EncodeHintType, Object> hints = new EnumMap<EncodeHintType, Object>(
			EncodeHintType.class);
	static {
		/*
		 * 二维码的纠错级别(排错率),4个级别： L (7%)、 M (15%)、 Q (25%)、 H (30%)(最高H)
		 * 纠错信息同样存储在二维码中，纠错级别越高，纠错信息占用的空间越多，那么能存储的有用讯息就越少；共有四级； 选择M，扫描速度快。
		 */
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
		// 二维码边界空白大小 1,2,3,4 (4为默认,最大)
		hints.put(EncodeHintType.MARGIN, 1);
		hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
	}

	/**
	 * 生成二维码
	 * 
	 * @param content
	 * @param width
	 * @param height
	 * @param path
	 * @param type
	 */
	public static void createNormalToDisk(String content, Integer width,
			Integer height, String path, String type) {
		try {
			// 3、将二维码放入缓冲流
			BufferedImage image = createNormal(content, width, height, type);
			File outPutImage = new File(path);
			// 如果图片不存在创建图片
			if (!outPutImage.exists()){
				outPutImage.createNewFile();
			}
			// 5、将二维码写入图片
			ImageIO.write(image, type, outPutImage);
			System.out.println("生成成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 生成一个二维码的图片流对象  
	 * @param content
	 *
	 */
	public static BufferedImage createNormal(String content, Integer width,
			Integer height, String type){
		try {
			// 1、生成二维码
			BitMatrix encode = new MultiFormatWriter().encode(content,
					BarcodeFormat.QR_CODE, width, height, hints);
			// 2、获取二维码宽高
			int codeWidth = encode.getWidth();
			int codeHeight = encode.getHeight();
			// 3、将二维码放入缓冲流
			BufferedImage image = new BufferedImage(codeWidth, codeHeight, BufferedImage.TYPE_INT_RGB);
			for (int i = 0; i < codeWidth; i++) {
				for (int j = 0; j < codeHeight; j++) {
					// 4、循环将二维码内容定入图片
					image.setRGB(i, j, encode.get(i, j) ? BLACK : WHITE);
				}
			}
			return image;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 生成带LOGO的二维码显示到网页
	 * @param logoStream
	 */
	public static BufferedImage  createLogoCode(String content, Integer width,
			Integer height, String type,InputStream logoStream){
		try {
			// 1,得到二维码的图片对象
			BufferedImage image =createNormal(content, width, height, type);
			if(null==image){
				System.out.println("生成二维码异常");
				return null;
			}
			if(null==logoStream){
				System.out.println("logo流为空返回原始二维码");
				return image;
			}
			//2 把logoStream的流转成图片对象
			BufferedImage logo=ImageIO.read(logoStream);
			int code_width = image.getWidth();
			int code_height=image.getHeight();
			
			int fact_logo_width = logo.getWidth();
			int fact_logo_height = logo.getHeight();
			
			int max_logo_width=code_width/5;
			int max_logo_height=code_height/5;
			
			int logo_width=fact_logo_width>max_logo_width?max_logo_width:fact_logo_width;
			int logo_heigth=fact_logo_height>max_logo_height?max_logo_height:fact_logo_height;
			
			//确定中间开始画logo的坐标
			int x=(code_width-logo_width)/2;
			int y=(code_height-logo_heigth)/2;
			
			// 获取二维码画笔
			Graphics2D g = image.createGraphics();
			// 开始合并绘制图片
			g.drawImage(logo, x, y, logo_width, logo_heigth, null);
			//画一个圆角的矩形
			g.drawRoundRect(x, y, logo_width, logo_heigth, 15, 15);
			// logo边框大小
			g.setStroke(new BasicStroke(2));
			g.setColor(Color.WHITE);
			g.drawRect(x, y, logo_width, logo_heigth);
			g.dispose();//生效
			logo.flush();
			image.flush();
			return image;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	

	/*public static void main(String[] args) {
		String content = "老雷";
		String path = "D:/laolei.gif";
		String type = "gif";
		Integer width = 400;
		Integer height = 400;
		createNormalToDisk(content, width, height, path, type);
	}*/

}
