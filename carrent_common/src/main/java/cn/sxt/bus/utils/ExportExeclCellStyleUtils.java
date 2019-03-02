package cn.sxt.bus.utils;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;



/**
 * @program: Carrent_SSM
 * @Date: 2019/1/23 15:19
 * @Author: Mr.Wen
 * @Description:
 */
public class ExportExeclCellStyleUtils {
    /**
     * 创建标题样式组
     */
    public static HSSFCellStyle createTitleCellStyle(HSSFWorkbook hssfWorkbook) {
        //创建样式
        HSSFCellStyle cellStyle = hssfWorkbook.createCellStyle();

        cellStyle.setAlignment(HorizontalAlignment.CENTER); /*文字垂直居中*/
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER); /*文字水平居中*/
        //设置字体
        HSSFFont font = hssfWorkbook.createFont();
        font.setBold(true); /*文字加粗*/

        font.setFontHeightInPoints((short)30);//设置字体大小
        font.setFontName("Consolas");
        font.setColor(HSSFColorPredefined.RED.getIndex());
        cellStyle.setFont(font);
        return cellStyle;
    }
    /**
     * 创建标题样式组
     */
    public static HSSFCellStyle createSecondTitleCellStyle(HSSFWorkbook hssfWorkbook) {
        //创建样式
        HSSFCellStyle cellStyle = hssfWorkbook.createCellStyle();
        cellStyle.setAlignment(HorizontalAlignment.CENTER); /*文字垂直居中*/
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER); /*文字水平居中*/
        //设置字体
        HSSFFont font = hssfWorkbook.createFont();
        font.setBold(true); /*文字加粗*/
        font.setFontHeightInPoints((short)23); /*设置字体大小*/
        font.setFontName("微软雅黑");
        font.setColor(HSSFColorPredefined.BLACK.getIndex());
        cellStyle.setFont(font);
        return cellStyle;
    }
    /**
     * 创建表头样式组
     */
    public static HSSFCellStyle createTableTitleCellStyle(HSSFWorkbook hssfWorkbook) {
        //创建样式
        HSSFCellStyle cellStyle = hssfWorkbook.createCellStyle();
        cellStyle.setAlignment(HorizontalAlignment.CENTER); /*文字垂直居中*/
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER); /*文字水平居中*/
        //设置字体
        HSSFFont font = hssfWorkbook.createFont();
        font.setBold(true); /*文字加粗*/
        font.setFontHeightInPoints((short)18); /*设置字体大小*/
        font.setFontName("Consolas");
        font.setColor(HSSFColorPredefined.BLACK.getIndex());
        cellStyle.setFont(font);
        return cellStyle;
    }

    public static HSSFCellStyle createTableBodyCellStyle(HSSFWorkbook hssfWorkbook) {
        //创建样式
        HSSFCellStyle cellStyle = hssfWorkbook.createCellStyle();
        cellStyle.setAlignment(HorizontalAlignment.CENTER); /*文字垂直居中*/
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER); /*文字水平居中*/
        //设置字体

        HSSFFont font = hssfWorkbook.createFont();
        font.setFontHeightInPoints((short)15); /*设置字体大小*/
        font.setFontName("微软雅黑");
        cellStyle.setFont(font);

        return cellStyle;
    }

}
