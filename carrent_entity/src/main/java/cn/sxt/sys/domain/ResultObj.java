package cn.sxt.sys.domain;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 15:52
 * @Author: Mr.Wen
 * @Description:
 */
public class ResultObj {
    private Integer code =1;
    private String mssage;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMssage() {
        return mssage;
    }

    public void setMssage(String mssage) {
        this.mssage = mssage;
    }

    public ResultObj() {
    }

    public ResultObj(Integer code, String mssage) {
        this.code = code;
        this.mssage = mssage;
    }
}
