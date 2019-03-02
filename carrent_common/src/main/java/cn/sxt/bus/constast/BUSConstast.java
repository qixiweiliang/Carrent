package cn.sxt.bus.constast;

public interface BUSConstast {
	
	/**
	 * 出租单的前缀
	 */
	String PROFIX_CZ="CZ";
	/**
	 * 检查单的前缀
	 */
	String PROFIX_JC="JC";
	
	/**
	 * 出租单状态
	 * 1 是已归还
	 * 0 未归还
	 */
	Integer RENT_FLAG_TRUE=1;
	Integer RENT_FLAG_FALSE=0;
	
	/**
	 * 汽车状态状态
	 * 1 是已出租
	 * 0 是未出租
	 */
	Integer ISRENT_FLAG_TRUE=1;
	Integer ISRENT_FLAG_FALSE=0;

}
