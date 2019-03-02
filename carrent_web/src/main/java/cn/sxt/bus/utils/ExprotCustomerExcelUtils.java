package cn.sxt.bus.utils;

import cn.sxt.bus.domain.Customer;
import cn.sxt.bus.domain.Rents;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import static cn.sxt.bus.utils.ExportExeclCellStyleUtils.*;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/23 15:22
 * @Author: Mr.Wen
 * @Description:
 */
public class ExprotCustomerExcelUtils {



    public static void ExportExcl(List<Customer> customers, String fileName, String sheetName, HttpServletResponse response) {
        //创建工作簿
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook();
        // 创建sheet并制定名字
        HSSFSheet sheet = hssfWorkbook.createSheet(sheetName);
        // sheet.setColumnWidth(0, 20 * 255); /*设置columnIndex所在列的宽度为width*/
        sheet.setDefaultColumnWidth(30); /*设置默认列宽为width*/

        // sheet.setDefaultRowHeight(50 * 20);//设置默认行高为50
        //  sheet.setDefaultRowHeightInPoints(50); //设置默认行高为50

        // 合并单元格
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 5));  /*合并第一行中的一到第六列*/
        sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 5));
        /*小标题*/
        HSSFCellStyle secondCellStyle = createSecondTitleCellStyle(hssfWorkbook);
        /*表体*/
        HSSFCellStyle tableBodyCellStyle = createTableBodyCellStyle(hssfWorkbook);
        /*标题样式*/
        HSSFCellStyle titleCellStyle = createTitleCellStyle(hssfWorkbook);
        /*表头样式*/
        HSSFCellStyle tableCellStyle = createTableTitleCellStyle(hssfWorkbook);

        int row = 0;
        HSSFRow row1 = sheet.createRow(row); /*第一行*/
        HSSFCell cell = row1.createCell(0); /*第一行的第一列*/
        cell.setCellStyle(titleCellStyle);
        cell.setCellValue("客户列表数据");

        // 第二行
        row++;
        HSSFRow row2 = sheet.createRow(row);
        HSSFCell cell1 = row2.createCell(0);
        cell1.setCellStyle(secondCellStyle);
        cell1.setCellValue("总数:" + customers.size() + " 导出时间:" + new Date().toLocaleString());

        String[] tableHeader = {"客户姓名", "客户性别", "客户地址", "客户电话", "客户职位"};
        row++;//第三行  表头
        HSSFRow row3 = sheet.createRow(row);
        for (int i = 0; i < tableHeader.length; i++) {
            //在行里面创建单元格
            HSSFCell row3_cell = row3.createCell(i);
            row3_cell.setCellStyle(tableCellStyle);
            row3_cell.setCellValue(tableHeader[i]);
        }
        Integer size = customers.size();
        for (int i = 0; i < size; i++) {
            row++;
            Customer customer = customers.get(i);
            HSSFRow row4 = sheet.createRow(row);
            HSSFCell cell2 = row4.createCell(0);
            cell2.setCellStyle(tableBodyCellStyle);
            cell2.setCellValue(customer.getCustname());

            HSSFCell cell3 = row4.createCell(1);
            cell3.setCellStyle(tableBodyCellStyle);
            cell3.setCellValue(customer.getSex());

            HSSFCell cell4 = row4.createCell(2);
            cell4.setCellStyle(tableBodyCellStyle);
            cell4.setCellValue(customer.getAddress());

            HSSFCell cell5 = row4.createCell(3);
            cell5.setCellStyle(tableBodyCellStyle);
            cell5.setCellValue(customer.getPhone());

            HSSFCell cell6 = row4.createCell(4);
            cell6.setCellStyle(tableBodyCellStyle);
            cell6.setCellValue(customer.getCareer());
        }
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
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

