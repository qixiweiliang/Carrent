package cn.sxt.sys.controller;

import cn.sxt.sys.constast.SYSConstast;
import cn.sxt.sys.domain.ResultObj;
import cn.sxt.sys.domain.User;
import cn.sxt.sys.service.NewService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.WebUtils;
import cn.sxt.sys.vo.NewVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 13:30
 * @Author: Mr.Wen
 * @Description:
 */
@Controller
@RequestMapping("news")
public class NewController {
    @Autowired
    private NewService newsService;
    @RequestMapping("toNewsManager")
    public String toNew(){
        return "system/NewManager";
    }

    @RequestMapping("loadAllNew")
    @ResponseBody
    public DataGridView loadAllNew(NewVo newsVo){
        DataGridView dataGridView = this.newsService.queryNews(newsVo);
        return dataGridView;
    }

    @RequestMapping("deleteNew")
    @ResponseBody
    public ResultObj deleteNew(NewVo newsVo){
        ResultObj rsob =null;
        try {
          this.newsService.deleteNew(newsVo.getId());
            rsob=new ResultObj(SYSConstast.CODE_SUCCESS,SYSConstast.OPERATION_DELETE_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
            rsob=new ResultObj(SYSConstast.CODE_ERROR,SYSConstast.OPERATION_DELETE_ERROR);
        }

        return rsob;
    }

    @RequestMapping("addNews")
    @ResponseBody
    public ResultObj addNews(NewVo newsVo) {
        ResultObj obj = null;
        try {
            User login = WebUtils.getCurrentUser(User.class, "login");
            newsVo.setCreatetime(new Date());
            newsVo.setOpername(login.getRealname());
            this.newsService.addNew(newsVo);
            obj= new ResultObj(SYSConstast.CODE_SUCCESS,SYSConstast.OPERATION_ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj= new ResultObj(SYSConstast.CODE_ERROR,SYSConstast.OPERATION_ADD_ERROR);
        }
        return obj;
    }
    @RequestMapping("updateNew")
    @ResponseBody
    public ResultObj updateNew(NewVo newsVo) {
        ResultObj obj = null;
        try {
            newsVo.setCreatetime(new Date());
            this.newsService.updateNew(newsVo);
            obj= new ResultObj(SYSConstast.CODE_SUCCESS,SYSConstast.OPERATION_UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            obj= new ResultObj(SYSConstast.CODE_ERROR,SYSConstast.OPERATION_UPDATE_ERROR);
        }
        return obj;
    }

}
