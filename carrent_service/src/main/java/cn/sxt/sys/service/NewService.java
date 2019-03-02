package cn.sxt.sys.service;

import cn.sxt.sys.domain.New;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.NewVo;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 13:19
 * @Author: Mr.Wen
 * @Description:
 */
public interface NewService {

    DataGridView queryNews(NewVo newsVo);


    void deleteNew(Integer id);

    void addNew(New news);

    void updateNew(NewVo newsVo);
}
