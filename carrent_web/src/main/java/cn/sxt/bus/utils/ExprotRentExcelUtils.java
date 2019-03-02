package cn.sxt.bus.utils;

import cn.sxt.bus.domain.Customer;
import cn.sxt.bus.domain.Rents;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.util.CellRangeAddress;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Date;

import static cn.sxt.bus.utils.ExportExeclForRentCellStyleUtils.*;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/23 15:22
 * @Author: Mr.Wen
 * @Description:
 */
public class ExprotRentExcelUtils {
    public static void ExportExcl(Rents rent, Customer customer, String fileName, String sheetName, HttpServletResponse response) {
//创建工作簿
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook();
        // 创建sheet并制定名字
        HSSFSheet sheet = hssfWorkbook.createSheet(sheetName);
        // 设置sheet相关的属性
        sheet.setDefaultColumnWidth(50);/*设置默认列宽为width*/
        sheet.setColumnWidth(1, 50 * 256);


        // 合并单元格
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 3));  /*合并第一行中的一到第六列*/
        /*标题样式*/
        HSSFCellStyle titleCellStyle = createTitleCellStyle(hssfWorkbook);
        /*小标题  设置行高 列宽*/
        HSSFCellStyle secondCellStyle = createSecondTitleCellStyle(hssfWorkbook);
        /*表体*/
        HSSFCellStyle tableBodyCellStyle = createTableBodyCellStyle(hssfWorkbook);

        int row = 0;
        HSSFRow row1 = sheet.createRow(row); /*第一行*/
        HSSFCell cell = row1.createCell(0); /*第一行的第一列*/
        cell.setCellStyle(titleCellStyle);
        cell.setCellValue(fileName);

        // 第二行
        row++;
        HSSFRow row2 = sheet.createRow(row);
        HSSFCell cell1 = row2.createCell(0);
        cell1.setCellStyle(secondCellStyle);
        cell1.setCellValue("出租单号:");

        HSSFCell cell2 = row2.createCell(1);
        cell2.setCellStyle(secondCellStyle);
        cell2.setCellValue(rent.getRentid());

        HSSFCell cell3 = row2.createCell(2);
        cell3.setCellStyle(secondCellStyle);
        cell3.setCellValue("二维码:");

        HSSFCell cell4 = row2.createCell(3);
        row2.setHeightInPoints(170);
        cell4.setCellStyle(secondCellStyle);
        /* 放置二维码 */

        InputStream logoStream = ExprotRentExcelUtils.class.getClassLoader()
                .getResourceAsStream("/logo.jpg");
        System.out.println(logoStream);
        // 生成二维码
        BufferedImage image = ZXingEncodeUtils.createLogoCode(rent.getRentid(),
                200, 200, "gif", logoStream);
        //创建一个内存流
        ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
        try {
            // 把图片流写入内存流
            ImageIO.write(image, "jpg", byteArrayOut);
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        // 画图的顶级管理器，一个sheet只能获取一个（一定要注意这点）
        HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
        // anchor主要用于设置图片的属性
        /**
         * dx1：起始单元格的x偏移量，如例子中的255表示直线起始位置距A1单元格左侧的距离；
         * dy1：起始单元格的y偏移量，如例子中的125表示直线起始位置距A1单元格上侧的距离；
         * dx2：终止单元格的x偏移量，如例子中的1023表示直线起始位置距C3单元格左侧的距离；
         * dy2：终止单元格的y偏移量，如例子中的150表示直线起始位置距C3单元格上侧的距离； col1：起始单元格列序号，从0开始计算；
         * row1：起始单元格行序号，从0开始计算，如例子中col1=0,row1=0就表示起始单元格为A1；
         * col2：终止单元格列序号，从0开始计算；
         * row2：终止单元格行序号，从0开始计算，如例子中col2=2,row2=2就表示起始单元格为C3；
         */
        HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0, 0, 255, (short) 3,
                1, (short) 4, 1);
        anchor.setAnchorType(ClientAnchor.AnchorType.DONT_MOVE_AND_RESIZE);
        patriarch.createPicture(anchor, hssfWorkbook.addPicture(
                byteArrayOut.toByteArray(), HSSFWorkbook.PICTURE_TYPE_JPEG));



        // 第三行
        row++;
        HSSFRow row3 = sheet.createRow(row);
        HSSFCell row3_cell1 = row3.createCell(0);
        row3_cell1.setCellStyle(tableBodyCellStyle);
        row3_cell1.setCellValue("客户身份证号:");

        HSSFCell row3_cell2 = row3.createCell(1);
        row3_cell2.setCellStyle(tableBodyCellStyle);
        row3_cell2.setCellValue(customer.getIdentity());

        HSSFCell row3_cell3 = row3.createCell(2);
        row3_cell3.setCellStyle(tableBodyCellStyle);
        row3_cell3.setCellValue("出租价格:");

        HSSFCell row3_cell4 = row3.createCell(3);
        row3_cell4.setCellStyle(tableBodyCellStyle);
        row3_cell3.setCellValue(rent.getPrice());

        // 第四行
        row++;
        HSSFRow row4 = sheet.createRow(row);
        HSSFCell row4_cell1 = row4.createCell(0);
        row4_cell1.setCellStyle(tableBodyCellStyle);
        row4_cell1.setCellValue("开始时间:");

        HSSFCell row4_cell2 = row4.createCell(1);
        row4_cell2.setCellStyle(tableBodyCellStyle);
        row4_cell2.setCellValue(rent.getBegindate().toLocaleString());

        HSSFCell row4_cell3 = row4.createCell(2);
        row4_cell3.setCellStyle(tableBodyCellStyle);
        row4_cell3.setCellValue("结束时间:");

        HSSFCell row4_cell4 = row4.createCell(3);
        row4_cell4.setCellStyle(tableBodyCellStyle);
        row4_cell3.setCellValue(rent.getReturndate().toLocaleString());


        // 第五行
        row++;
        HSSFRow row5 = sheet.createRow(row);
        HSSFCell row5_cell1 = row5.createCell(0);
        row5_cell1.setCellStyle(tableBodyCellStyle);
        row5_cell1.setCellValue("车辆编号:");

        HSSFCell row5_cell2 = row5.createCell(1);
        row5_cell2.setCellStyle(tableBodyCellStyle);
        row5_cell2.setCellValue(rent.getCarnumber());

        HSSFCell row5_cell3 = row5.createCell(2);
        row5_cell3.setCellStyle(tableBodyCellStyle);
        row5_cell3.setCellValue("操作员:");

        HSSFCell row5_cell4 = row5.createCell(3);
        row5_cell4.setCellStyle(tableBodyCellStyle);
        row5_cell3.setCellValue(rent.getOpername());


        row++; // 第六行

        // 第七行
        row++;
        HSSFRow row6 = sheet.createRow(row);
        HSSFCell row6_cell3 = row6.createCell(2);
        row6_cell3.setCellStyle(tableBodyCellStyle);
        row6_cell3.setCellValue("打印时间:");

        HSSFCell row6_cell4 = row6.createCell(3);
        row6_cell4.setCellStyle(tableBodyCellStyle);
        row6_cell4.setCellValue(new Date().toLocaleString());

        // 第六行
        row++;
        HSSFRow row7 = sheet.createRow(row);
        HSSFCell row7_cell3 = row7.createCell(2);
        row7_cell3.setCellStyle(tableBodyCellStyle);
        row7_cell3.setCellValue("客户签名:");
        try {
            response.reset();
            fileName = URLEncoder.encode(fileName, "utf-8");
            response.setContentType("application/x-msdownload");
            response.addHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            ServletOutputStream stream = response.getOutputStream();
            hssfWorkbook.write(stream);
            stream.flush();
            stream.close();
            hssfWorkbook.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
