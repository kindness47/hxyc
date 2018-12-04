package com.hxyc.ots.controller;

import com.hxyc.ots.base.Constants;
import com.hxyc.ots.base.Response;
import com.hxyc.ots.model.Menu;
import com.hxyc.ots.service.MenuService;
import com.hxyc.ots.utils.SystemUtil;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@Controller
public class MenuController extends BaseController{

    @Autowired
    private MenuService menuService;

    @RequestMapping("/menu-list")
    public ModelAndView menuList(){
        List<Menu> menuList = menuService.getAll();
        ModelAndView mav = new ModelAndView("sysManage/user-menu-list");
        mav.addObject("menuList",menuList);
        return mav;
    }
    @RequestMapping(value = "/menu-add",method = RequestMethod.GET)
    public ModelAndView menuAdd(){
        List<Menu> menus = menuService.getAllMenus();
        ModelAndView mav = new ModelAndView("sysManage/menu-add");
        mav.addObject("menus",menus);
        return mav;
    }
    @RequestMapping(value = "/menu-save",method = RequestMethod.POST)
    @ResponseBody
    public Response menuSave(Menu menu){
        if(menu.getId() == null) {
            //新增
            Menu m;
            if(!menu.getLevel().equals(Constants.LEVEL3) && menu.getMenuName()!= null) {
                m = new Menu();
                m.setMenuName(menu.getMenuName());
                if(menuService.select(m).size()>0)
                    return returnValidateError("菜单名称已存在");
            }
            if(menu.getMenuCode()!= null){
                m = new Menu();
                m.setMenuCode(menu.getMenuCode());
                if(menuService.select(m).size()>0)
                    return returnValidateError("菜单编码已存在");
            }
            if(menu.getTitle()!= null && menu.getTitle() != ""){
                m = new Menu();
                m.setTitle(menu.getTitle());
                if(menuService.select(m).size()>0)
                    return returnValidateError("显示标题已存在");
            }
            menu.setMenuClass(menu.getMenuClass() == null ? "" : (menu.getMenuClass().replace("-", "")));
            menu.setUrl(menu.getUrl() == null ? "" : menu.getUrl());
            menu.setFunctionType(menu.getFunctionType() == null ? "" : menu.getFunctionType());
            menu.setStatus(1);
            menu.setCreateBy(SystemUtil.getLoginUserName());
            menu.setCreateTime(new Date());

            //如果不是菜单目录，不存在menuclass
            if(!menu.getLevel().equals(Constants.LEVEL1))
                menu.setMenuClass("");
            //如果是不是功能菜单，不存在url
            if(!menu.getLevel().equals(Constants.LEVEL2))
                menu.setUrl("");
            //如果是菜单功能(页面级)，不存在title，如果不是，不存咋functionType
            if(menu.getLevel().equals(Constants.LEVEL3))
                menu.setTitle("");
            else
                menu.setFunctionType("");

            int opCount = menuService.insert(menu);
            return opCount > 0 ? returnSuccess("新增成功") : returnSuccess("新增失败");
        }else{
            //修改
            menu.setMenuClass(menu.getMenuClass() == null ? "" : (menu.getMenuClass().replace("-", "")));
            menu.setFunctionType(menu.getFunctionType() == null ? "" : menu.getFunctionType());
            menu.setUpdateBy(SystemUtil.getLoginUserName());
            menu.setUpdateTime(new Date());
            int opCount = menuService.updateByPrimaryKeySelective(menu);
            return opCount > 0 ? returnSuccess("修改成功") : returnSuccess("修改失败");
        }
    }

    @RequestMapping(value = "/menu-del/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Response menuDelete(@PathVariable("id") Integer id){
        int opCount = menuService.deleteByPrimaryKey(id);
        return opCount>0?returnSuccess("删除成功"):returnSuccess("删除失败");
    }

    @RequestMapping(value = "/menu/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Response menuInfo(@PathVariable("id") Integer id){
        Menu menu = menuService.selectByPrimaryKey(id);
        return returnSuccess(menu);
    }

    @RequestMapping(value = "/menu-change-status/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Response changeStatus(@PathVariable("id") Integer id){
        Menu menu = menuService.selectByPrimaryKey(id);
        menu.setStatus(menu.getStatus() == 0?1:0);
        menu.setUpdateBy(SystemUtil.getLoginUserName());
        menu.setUpdateTime(new Date());
        int opCount  = menuService.updateByPrimaryKeySelective(menu);
        return opCount>0?returnSuccess("操作成功"):returnSuccess("操作失败");
    }
}
