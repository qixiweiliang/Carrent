package cn.sxt.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/15 20:37
 * @Author: Mr.Wen
 * @Description:
 */
@Controller
@RequestMapping("desk")
public class DeskController {
    @RequestMapping("toDeskManager")
    public String toDesk(){
        String str =null;
        return "system/main/deskManager";
    }
}





