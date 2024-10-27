
package com.controller;

import java.io.File;
import java.math.BigDecimal;
import java.net.URL;
import java.text.SimpleDateFormat;
import com.alibaba.fastjson.JSONObject;
import java.util.*;
import org.springframework.beans.BeanUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.ContextLoader;
import javax.servlet.ServletContext;
import com.service.TokenService;
import com.utils.*;
import java.lang.reflect.InvocationTargetException;

import com.service.DictionaryService;
import org.apache.commons.lang3.StringUtils;
import com.annotation.IgnoreAuth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.*;
import com.entity.view.*;
import com.service.*;
import com.utils.PageUtils;
import com.utils.R;
import com.alibaba.fastjson.*;

/**
 * 酒店预定
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/jiudianYuyue")
public class JiudianYuyueController {
    private static final Logger logger = LoggerFactory.getLogger(JiudianYuyueController.class);

    private static final String TABLE_NAME = "jiudianYuyue";

    @Autowired
    private JiudianYuyueService jiudianYuyueService;


    @Autowired
    private TokenService tokenService;

    @Autowired
    private DaoyouService daoyouService;//导游
    @Autowired
    private DictionaryService dictionaryService;//字典表
    @Autowired
    private ForumService forumService;//论坛
    @Autowired
    private JingdianService jingdianService;//旅游景点
    @Autowired
    private JingdianCollectionService jingdianCollectionService;//旅游景点收藏
    @Autowired
    private JingdianLiuyanService jingdianLiuyanService;//旅游景点留言
    @Autowired
    private JiudianService jiudianService;//酒店信息
    @Autowired
    private JiudianCollectionService jiudianCollectionService;//酒店收藏
    @Autowired
    private JiudianLiuyanService jiudianLiuyanService;//酒店留言
    @Autowired
    private LiuyanService liuyanService;//留言板
    @Autowired
    private NewsService newsService;//公告信息
    @Autowired
    private YonghuService yonghuService;//游客
    @Autowired
    private UsersService usersService;//管理员


    /**
    * 后端列表
    */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("page方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永不会进入");
        else if("游客".equals(role))
            params.put("yonghuId",request.getSession().getAttribute("userId"));
        else if("导游".equals(role))
            params.put("daoyouId",request.getSession().getAttribute("userId"));
        CommonUtil.checkMap(params);
        PageUtils page = jiudianYuyueService.queryPage(params);

        //字典表数据转换
        List<JiudianYuyueView> list =(List<JiudianYuyueView>)page.getList();
        for(JiudianYuyueView c:list){
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(c, request);
        }
        return R.ok().put("data", page);
    }

    /**
    * 后端详情
    */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("info方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        JiudianYuyueEntity jiudianYuyue = jiudianYuyueService.selectById(id);
        if(jiudianYuyue !=null){
            //entity转view
            JiudianYuyueView view = new JiudianYuyueView();
            BeanUtils.copyProperties( jiudianYuyue , view );//把实体数据重构到view中
            //级联表 游客
            //级联表
            YonghuEntity yonghu = yonghuService.selectById(jiudianYuyue.getYonghuId());
            if(yonghu != null){
            BeanUtils.copyProperties( yonghu , view ,new String[]{ "id", "createTime", "insertTime", "updateTime", "yonghuId"});//把级联的数据添加到view中,并排除id和创建时间字段,当前表的级联注册表
            view.setYonghuId(yonghu.getId());
            }
            //级联表 酒店信息
            //级联表
            JiudianEntity jiudian = jiudianService.selectById(jiudianYuyue.getJiudianId());
            if(jiudian != null){
            BeanUtils.copyProperties( jiudian , view ,new String[]{ "id", "createTime", "insertTime", "updateTime", "yonghuId"});//把级联的数据添加到view中,并排除id和创建时间字段,当前表的级联注册表
            view.setJiudianId(jiudian.getId());
            }
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view, request);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }

    }

    /**
    * 后端保存
    */
    @RequestMapping("/save")
    public R save(@RequestBody JiudianYuyueEntity jiudianYuyue, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,jiudianYuyue:{}",this.getClass().getName(),jiudianYuyue.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");
        else if("游客".equals(role))
            jiudianYuyue.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));

        Wrapper<JiudianYuyueEntity> queryWrapper = new EntityWrapper<JiudianYuyueEntity>()
            .eq("yonghu_id", jiudianYuyue.getYonghuId())
            .eq("jiudian_id", jiudianYuyue.getJiudianId())
            .eq("jiudian_yuyue_number", jiudianYuyue.getJiudianYuyueNumber())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        JiudianYuyueEntity jiudianYuyueEntity = jiudianYuyueService.selectOne(queryWrapper);
        if(jiudianYuyueEntity==null){
            jiudianYuyue.setCreateTime(new Date());
            jiudianYuyueService.insert(jiudianYuyue);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody JiudianYuyueEntity jiudianYuyue, HttpServletRequest request) throws NoSuchFieldException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        logger.debug("update方法:,,Controller:{},,jiudianYuyue:{}",this.getClass().getName(),jiudianYuyue.toString());
        JiudianYuyueEntity oldJiudianYuyueEntity = jiudianYuyueService.selectById(jiudianYuyue.getId());//查询原先数据

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
//        else if("游客".equals(role))
//            jiudianYuyue.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));

            jiudianYuyueService.updateById(jiudianYuyue);//根据id更新
            return R.ok();
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids, HttpServletRequest request){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        List<JiudianYuyueEntity> oldJiudianYuyueList =jiudianYuyueService.selectBatchIds(Arrays.asList(ids));//要删除的数据
        jiudianYuyueService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }


    /**
     * 批量上传
     */
    @RequestMapping("/batchInsert")
    public R save( String fileName, HttpServletRequest request){
        logger.debug("batchInsert方法:,,Controller:{},,fileName:{}",this.getClass().getName(),fileName);
        Integer yonghuId = Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId")));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //.eq("time", new SimpleDateFormat("yyyy-MM-dd").format(new Date()))
        try {
            List<JiudianYuyueEntity> jiudianYuyueList = new ArrayList<>();//上传的东西
            Map<String, List<String>> seachFields= new HashMap<>();//要查询的字段
            Date date = new Date();
            int lastIndexOf = fileName.lastIndexOf(".");
            if(lastIndexOf == -1){
                return R.error(511,"该文件没有后缀");
            }else{
                String suffix = fileName.substring(lastIndexOf);
                if(!".xls".equals(suffix)){
                    return R.error(511,"只支持后缀为xls的excel文件");
                }else{
                    URL resource = this.getClass().getClassLoader().getResource("static/upload/" + fileName);//获取文件路径
                    File file = new File(resource.getFile());
                    if(!file.exists()){
                        return R.error(511,"找不到上传文件，请联系管理员");
                    }else{
                        List<List<String>> dataList = PoiUtil.poiImport(file.getPath());//读取xls文件
                        dataList.remove(0);//删除第一行，因为第一行是提示
                        for(List<String> data:dataList){
                            //循环
                            JiudianYuyueEntity jiudianYuyueEntity = new JiudianYuyueEntity();
//                            jiudianYuyueEntity.setYonghuId(Integer.valueOf(data.get(0)));   //游客 要改的
//                            jiudianYuyueEntity.setJiudianId(Integer.valueOf(data.get(0)));   //酒店 要改的
//                            jiudianYuyueEntity.setJiudianYuyueTime(sdf.parse(data.get(0)));          //预定时间 要改的
//                            jiudianYuyueEntity.setJiudianYuyueNumber(Integer.valueOf(data.get(0)));   //预定天数 要改的
//                            jiudianYuyueEntity.setCreateTime(date);//时间
                            jiudianYuyueList.add(jiudianYuyueEntity);


                            //把要查询是否重复的字段放入map中
                        }

                        //查询是否重复
                        jiudianYuyueService.insertBatch(jiudianYuyueList);
                        return R.ok();
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return R.error(511,"批量插入数据异常，请联系管理员");
        }
    }




    /**
    * 前端列表
    */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("list方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));

        CommonUtil.checkMap(params);
        PageUtils page = jiudianYuyueService.queryPage(params);

        //字典表数据转换
        List<JiudianYuyueView> list =(List<JiudianYuyueView>)page.getList();
        for(JiudianYuyueView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段

        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        JiudianYuyueEntity jiudianYuyue = jiudianYuyueService.selectById(id);
            if(jiudianYuyue !=null){


                //entity转view
                JiudianYuyueView view = new JiudianYuyueView();
                BeanUtils.copyProperties( jiudianYuyue , view );//把实体数据重构到view中

                //级联表
                    YonghuEntity yonghu = yonghuService.selectById(jiudianYuyue.getYonghuId());
                if(yonghu != null){
                    BeanUtils.copyProperties( yonghu , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setYonghuId(yonghu.getId());
                }
                //级联表
                    JiudianEntity jiudian = jiudianService.selectById(jiudianYuyue.getJiudianId());
                if(jiudian != null){
                    BeanUtils.copyProperties( jiudian , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setJiudianId(jiudian.getId());
                }
                //修改对应字典表字段
                dictionaryService.dictionaryConvert(view, request);
                return R.ok().put("data", view);
            }else {
                return R.error(511,"查不到数据");
            }
    }


    /**
    * 前端保存
    */
    @RequestMapping("/add")
    public R add(@RequestBody JiudianYuyueEntity jiudianYuyue, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,jiudianYuyue:{}",this.getClass().getName(),jiudianYuyue.toString());
        Wrapper<JiudianYuyueEntity> queryWrapper = new EntityWrapper<JiudianYuyueEntity>()
            .eq("yonghu_id", jiudianYuyue.getYonghuId())
            .eq("jiudian_id", jiudianYuyue.getJiudianId())
            .eq("jiudian_yuyue_number", jiudianYuyue.getJiudianYuyueNumber())
//            .notIn("jiudian_yuyue_types", new Integer[]{102})
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        JiudianYuyueEntity jiudianYuyueEntity = jiudianYuyueService.selectOne(queryWrapper);
        if(jiudianYuyueEntity==null){
            jiudianYuyue.setCreateTime(new Date());
        jiudianYuyueService.insert(jiudianYuyue);

            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

}

