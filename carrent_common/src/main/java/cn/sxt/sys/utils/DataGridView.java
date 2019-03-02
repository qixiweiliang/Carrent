package cn.sxt.sys.utils;

import java.util.List;

/**
* @Description: 对easyui datagrid数据的封装
* @param
* @Return:
* @Author: Mr.Wen
* @Date: 2019/1/16 13:18
*/

public class DataGridView {
	
	private Long total;

	private List<?> rows;
	
	public DataGridView(Long total, List<?> rows) {
		super();
		this.total = total;
		this.rows = rows;
	}
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	

}
