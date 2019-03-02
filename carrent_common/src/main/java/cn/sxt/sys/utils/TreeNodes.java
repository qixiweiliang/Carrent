package cn.sxt.sys.utils;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @program: Carrent_SSM
 * @Date: 2019/1/16 10:02
 * @Author: Mr.Wen
 * @Description:
 */
public class TreeNodes {
    private Integer id;
    @JsonProperty("pId")
    private Integer pid;
    private String name;

    @JsonProperty("isParent")
    private Boolean isParent;
    private Boolean open;
    private String href;
    private String icon;
    private String tabicon;
    /*aesyui tree 的属性*/
    private String text;
    private List<TreeNodes> children = new ArrayList<>();

    /*菜单分配 默认选中*/
    private Boolean checked;

    /*菜单分配 所需的构造器*/
    public TreeNodes(Integer id, Integer pid, String name, Boolean isParent, Boolean open, String icon, Boolean checked) {
        this.id = id;
        this.pid = pid;
        this.name = name;
        this.isParent = isParent;
        this.open = open;
        this.icon = icon;
        this.checked = checked;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<TreeNodes> getChildren() {
        return children;
    }

    public void setChildren(List<TreeNodes> children) {
        this.children = children;
    }

    /**
     * easyui Tree json对象构造方法
     */
    public TreeNodes(Integer id, Integer pid, String text) {
        this.id = id;
        this.pid = pid;
        this.text = text;
    }

    /**
     * zTree非checkbox树的json对象构造方法
     */
    public TreeNodes(Integer id, Integer pid, String name, Boolean isParent, Boolean open, String href, String icon, String tabicon) {
        this.id = id;
        this.pid = pid;
        this.name = name;
        this.isParent = isParent;
        this.open = open;
        this.href = href;
        this.icon = icon;
        this.tabicon = tabicon;
    }

    public TreeNodes() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getParent() {
        return isParent;
    }

    public void setParent(Boolean parent) {
        isParent = parent;
    }

    public Boolean getOpen() {
        return open;
    }

    public void setOpen(Boolean open) {
        this.open = open;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getTabicon() {
        return tabicon;
    }

    public void setTabicon(String tabicon) {
        this.tabicon = tabicon;
    }
}
