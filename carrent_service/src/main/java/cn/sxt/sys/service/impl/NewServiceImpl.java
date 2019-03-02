package cn.sxt.sys.service.impl;

import cn.sxt.sys.domain.New;
import cn.sxt.sys.mapper.NewMapper;
import cn.sxt.sys.service.NewService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.NewVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 13:19
 * @Author: Mr.Wen
 * @Description:
 */
@Service
public class NewServiceImpl implements NewService {
    @Autowired
    private NewMapper newsMapper;

    @Override
    public DataGridView queryNews(NewVo newsVo) {
        Page<Object> page = PageHelper.startPage(newsVo.getPage(), newsVo.getRows());
        List<New> newss = this.newsMapper.queryAllNew(newsVo);
        return new DataGridView(page.getTotal(),newss);
    }

    @Override
    public void deleteNew(Integer id) {
        this.newsMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void addNew(New news) {
        this.newsMapper.insertSelective(news);
    }

    @Override
    public void updateNew(NewVo newsVo) {
        this.newsMapper.updateByPrimaryKeySelective(newsVo);
    }
}
