package cn.sxt.sys.utils;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/20 14:46
 * @Author: Mr.Wen
 * @Description:
 */
public class TreeNodeBuilder {

    /**
     * @param treeNodes
     * @param topId     根据节点的父ID
     * @return
     * @Return: java.util.List<cn.sxt.sys.utils.TreeNodes>
     * @Author: Mr.Wen
     * @Date: 2019/1/20 15:38
     * 把简单的json集合转成标准的json集合
     */
    public static List<TreeNodes> bulid(List<TreeNodes> treeNodes, Integer topId) {
        List<TreeNodes> treeNode = new ArrayList<>();
        for (TreeNodes n1 : treeNodes) {
            if (n1.getPid() == topId) {
                treeNode.add(n1);
            }
            for (TreeNodes n2 : treeNodes) {
                if (n1.getId() == n2.getPid()) {
                    n1.getChildren().add(n2);
                }
            }
        }
        return treeNode;
    }

}
