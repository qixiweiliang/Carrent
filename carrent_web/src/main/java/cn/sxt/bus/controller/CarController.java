package cn.sxt.bus.controller;

import cn.sxt.bus.service.CarService;
import cn.sxt.bus.vo.CarVo;
import cn.sxt.sys.constast.SYSConstast;
import cn.sxt.sys.domain.ResultObj;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.WebUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 16:20
 * @Author: Mr.Wen
 * @Description:
 */
@Controller
@RequestMapping("car")
public class CarController {
    @Autowired
    private CarService carService;

    /**
     *  跳转到车辆管理界面
     * @return "business/carManager.jsp"
     */
    @RequestMapping("toCarManager")
    public String toCar() {
        return "business/carManager";
    }
    /**
     * 加载车辆信息 加模糊查询加分页
     * @param carVo 接收页面传参 page(pageNumber) rows(PageSize)
     * @return DataGradeView 封装模糊查询结果集 PageHelper分页
     *
     */
    @RequestMapping("loadAllCar")
    @ResponseBody
    public DataGridView loadAllCar(CarVo carVo) {
        DataGridView gridView = this.carService.queryAllCar(carVo);
        return gridView;
    }

    /**
     * 添加车辆
     * @param carVo
     * @return
     */
    @RequestMapping("addCar")
    @ResponseBody
    public ResultObj addCar(CarVo carVo) {
        ResultObj obj = null;
        try {
            this.carService.insertCar(carVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_ADD_ERROR);
        }
        return obj;
    }

    /**
     * 修改车辆信息
     * @param carVo
     * @return
     */
    @RequestMapping("updateCar")
    @ResponseBody
    public ResultObj uploadCar(CarVo carVo) {
        ResultObj obj = null;
        try {
            this.carService.uploadCar(carVo);
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_UPDATE_ERROR);
        }
        return obj;
    }

    /**
     *  删除车辆的同时需要删除 对应的车辆图片
     * @param carVo
     * @return 返回处理结果
     */
    @RequestMapping("deleteCar")
    @ResponseBody
    public ResultObj deleteCar(CarVo carVo) {
        ResultObj obj = null;
        // 判断文件是否存在
        if (StringUtils.isNotBlank(carVo.getCarimg())) {  //判断传入文件路径是否为空或是""
            String path = carVo.getCarimg().replace("../", "");
            // 文件在硬盘的路径
            System.out.println(WebUtils.getServletContext().getRealPath("/"));
            String realPath = WebUtils.getServletContext().getRealPath("/") + path;
            File file = new File(realPath);
            if (file.exists()) {
                file.delete();
            }else {
                System.out.println("文件不存在");
            }
        }
        try {
            this.carService.deleteCar(carVo.getCarnumber());
            obj = new ResultObj(SYSConstast.CODE_SUCCESS, SYSConstast.OPERATION_DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj = new ResultObj(SYSConstast.CODE_ERROR, SYSConstast.OPERATION_DELETE_ERROR);
        }
        return obj;
    }

}
