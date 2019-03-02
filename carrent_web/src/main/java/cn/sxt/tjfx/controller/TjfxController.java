package cn.sxt.tjfx.controller;

import cn.sxt.tjfx.domian.ColumnEntity;
import cn.sxt.tjfx.domian.PieEntity;
import cn.sxt.tjfx.service.TjfxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/22 15:04
 * @Author: Mr.Wen
 * @Description:
 */
@Controller
@RequestMapping("tjfx")
public class TjfxController {
    @Autowired
    private TjfxService tjfxService;

    @RequestMapping("totjfx")
    public String totjfx() {
        return "tjfx/tjfxCustormArea";
    }

    @RequestMapping("loadAllCustomerArea")
    @ResponseBody
    public List<PieEntity> loadAllCustomerArea() {
        return this.tjfxService.queryCustomer();
    }

    /**
     * @param
     * @Description: 跳转到折线图
     * @Return:
     * @Author: Mr.Wen
     * @Date: 2019/1/22 17:58
     */
    @RequestMapping("toTjYearMonthLine")
    public String toTjYearMonthLine() {
        return "tjfx/jYearMonthLine";
    }
    /**
    * @Description: 加载年度月份销售额度曲线
    * @param year
    * @Return: cn.sxt.tjfx.domian.ColumnEntity
    * @Author: Mr.Wen
    * @Date: 2019/1/22 22:25
    */
    @RequestMapping("loadjYearMonthLine")
    @ResponseBody
    public ColumnEntity loadjYearMonthLine(String year) {
        return this.tjfxService.queryjYearMonthLineForJchen(year);
    }

    /**
     * @param
     * @Description: 跳转到柱状图
     * @Return:
     * @Author: Mr.Wen
     * @Date: 2019/1/22 17:58
     */
    @RequestMapping("toTjOpernameSalMoneyYear")
    public String toTjOpernameSalMoneyYear() {
        return "tjfx/jYearMonthColumn";
    }

    @RequestMapping("loadjYearMonthColumn")
    @ResponseBody
    public ColumnEntity loadjYearMonthColumn(String year) {
        return this.tjfxService.queryjYearMonthColumn(year);
    }
}
