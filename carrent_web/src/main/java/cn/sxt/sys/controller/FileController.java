package cn.sxt.sys.controller;


import cn.sxt.sys.utils.RandomUtils;
import cn.sxt.sys.utils.WebUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/18 10:30
 * @Author: Mr.Wen
 * @Description:
 */
@RestController
@RequestMapping("upload")

public class FileController {
    @RequestMapping("uploadImg")
    public String uploadImg(MultipartFile mf) {

        String realPath = WebUtils.getServletContext().getRealPath("/upload/");
        String dirName = RandomUtils.createDirNameUseTime();
        File dirFile = new File(realPath, dirName);

        if (!dirFile.exists()) {
            dirFile.mkdirs(); //创建文件夹
        }

        String oldName = mf.getOriginalFilename();
        String newName = RandomUtils.createFileNameUseTime(oldName);
        File dest = new File(realPath + "/" + dirName, newName);
        try {
            mf.transferTo(dest);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "../upload/" + dirName + "/"+newName;
    }


}
