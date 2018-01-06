package com.yihengtang.yihengtang.admin;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.groovy.transform.SynchronizedASTTransformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yihengtang.yihengtang.dao.AdminMapper;
import com.yihengtang.yihengtang.dao.ArticlesMapper;
import com.yihengtang.yihengtang.dao.DepartmentMapper;
import com.yihengtang.yihengtang.dao.ExpertsMapper;
import com.yihengtang.yihengtang.dao.ImgMapper;
import com.yihengtang.yihengtang.entity.Admin;
import com.yihengtang.yihengtang.entity.Articles;
import com.yihengtang.yihengtang.entity.Department;
import com.yihengtang.yihengtang.entity.Experts;
import com.yihengtang.yihengtang.entity.Img;
import com.yihengtang.yihengtang.entity.User;
import com.yihengtang.yihengtang.service.AdminService;
import com.yihengtang.yihengtang.service.UserService;

/**
 * 管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping({"/admin"})
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ArticlesMapper articlesMapper;
	
	@Autowired
	private  ImgMapper imgMapper;
	
	@Autowired
	private  ExpertsMapper expertsMapper;
	
	@Autowired
	private  DepartmentMapper departmentMapper;
	
	@Autowired
	private  AdminMapper adminMapper;
	/**
	 * 返回管理員登陸頁面
	 * @return
	 */
	@RequestMapping("/login")
	public String adminLogin() {
		return "admin/login";
	}	
	
	/**
	 * 管理员登陆处理
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/index", method = RequestMethod.POST)
	public String adminHome(HttpServletRequest request,Model model) {
		//管理员账号
		String adminName = request.getParameter("adminName");
		//管理员密码
		String password = request.getParameter("password");
		System.out.println(adminName+password);
		if(adminName.equals("") && password.equals("")) {
			System.out.println("用户名和密码不得为空");
			model.addAttribute("error", "用户名和密码不得为空！");
			return "admin/login";
		}
		Admin admin =adminService.admin(adminName, password);
		if(admin == null) {
			System.out.println("用户名或者密码错误");
			model.addAttribute("error", "用户名或者密码错误！");
			return "admin/login";
		}
		model.addAttribute("admin", admin.getAdminName());
		System.out.println("成功");
		return "admin/index";
	}
	
	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping("/logout")
	public String adminLogout() {
		return "admin/login";
	}	
	
	@RequestMapping("/pass")
	public String pass(HttpServletRequest request,Model model) {
		
		return "admin/login";
	}	
	
	/**
	 * 所有用户信息
	 * @return
	 */
	@RequestMapping("/user-list")
	public  String userList(Model model) {
		List<User> userList =  userService.userList();
		model.addAttribute("userList", userList);
		return "admin/user-list";
	}	
	
	/**
	 * 图文列表
	 * @return
	 */
	@RequestMapping("/picture")
	public String picture(Model model) {
		List<Articles> articlesList =  articlesMapper.articlesList();
		model.addAttribute("articlesList", articlesList);
		model.addAttribute("articlesSize", articlesList.size());
		return "admin/picture";
	}	
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public String picture(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println(id);
		 //Map<String,String> map = new HashMap<String, String>();
		 if(articlesMapper.delete(Integer.valueOf(id)) != 1) {
			 //return map.put("data", "失败");
			 return "失败";
		 }
		 //return map.put("data", "失败");
		 return "成功";
	}
	
	/**
	 * 删除医师
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/expertsDel", method = RequestMethod.POST)
	@ResponseBody
	public String picture(String id) {
		System.out.println(id);
		 //Map<String,String> map = new HashMap<String, String>();
		String msg = null;
		try {
		expertsMapper.expertsDel(Integer.valueOf(id));
		}catch (Exception e) {
			e.printStackTrace();
			msg = "失败";
		}
		msg = "成功";
		return "成功";
	}
	
	/**
	 *轮播图
	 * @param model
	 * @return
	 */
	@RequestMapping("/pictures-list")
	public String picturesList(Model model) {
		List<Img> img = adminService.img();
		model.addAttribute("imgList", img);
		model.addAttribute("imgSize", img.size());
		return "admin/picture-list";
	}
	
	@RequestMapping(value = "/imgState",method = RequestMethod.POST)
	@ResponseBody
	public String imgState(HttpServletRequest request) {
		String id = request.getParameter("id");
		String state = request.getParameter("state");
		System.out.println(id);
		 if(imgMapper.imgState(Integer.valueOf(state), Integer.valueOf(id)) != 1) {
			 return "失败";
		 }
		 return "成功";
	}
	
	@RequestMapping( value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile file) {
		if (!file.isEmpty()) {
            try {
            	 // 上传到指定目录
            	  // file.transferTo(dest);
            	System.out.println(file.getOriginalFilename());
            	String img ="D:\\eclipse-workspace\\yihengtang\\yihengtang\\src\\main\\webapp\\"+file.getOriginalFilename();
                String imgUrl = "https://qubing.net.cn/"+file.getOriginalFilename();
                imgMapper.addUrl(imgUrl);
            	BufferedOutputStream out = new BufferedOutputStream(
                        new FileOutputStream(new File(img)));
                out.write(file.getBytes());
                out.flush();
                out.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                return "上传失败," + e.getMessage();
            } catch (IOException e) {
                e.printStackTrace();
                return "上传失败," + e.getMessage();
            }
            return "上传成功";
        } else {
            return "上传失败，因为文件是空的.";
        }
	}
	
	/**
	 * 医师列表
	 * @param model
	 * @return
	 */
	@RequestMapping("/experts")
	public String experts(Model model) {
		model.addAttribute("expertsList",expertsMapper.adminFindAll());
		model.addAttribute("expertsSize",expertsMapper.adminFindAll().size());
		return "admin/experts";
	}
	/**
	 * 轮播图上传
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/imgDelete", method = RequestMethod.POST)
	@ResponseBody
	public String imgDelete(Integer id) {
		System.out.println(id);
		if(imgMapper.imgDelete(id) != 1) {
			return "失败";
		}
		return "成功";
	}
	
	/**
	 * 图文添加
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/artucleAdd", method = RequestMethod.POST)
	@ResponseBody
	public String artucleAdd(@RequestParam("file") MultipartFile file,HttpServletRequest request) {//@RequestParam("articletitle") String articletitle,
			//@RequestParam("articletype")String articletype,@RequestParam("author")String author,
			//@RequestParam("editor")String editor) {
		String articletitle = request.getParameter("articletitle");
		String articletype = request.getParameter("articletype");
		String author = request.getParameter("author");
		String editor = request.getParameter("editor");
		String imgUrl = null;
		if (!file.isEmpty()) {
            try {
            	 // 上传到指定目录
            	  // file.transferTo(dest);
            	System.out.println(file.getOriginalFilename());
            	String img ="D:\\eclipse-workspace\\yihengtang\\yihengtang\\src\\main\\webapp\\"+file.getOriginalFilename();
            	imgUrl = "https://qubing.net.cn/"+file.getOriginalFilename();
                //imgMapper.addUrl(imgUrl);
            	BufferedOutputStream out = new BufferedOutputStream(
                        new FileOutputStream(new File(img)));
                out.write(file.getBytes());
                out.flush();
                out.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                return "上传失败," + e.getMessage();
            } catch (IOException e) {
                e.printStackTrace();
                return "上传失败," + e.getMessage();
            }
            articlesMapper.addArticles(articletitle, imgUrl,Integer.valueOf(articletype), editor, author);
            return "上传成功";
        } else {
            return "上传失败，因为文件是空的.";
        }
	}
	
	/*
	 * 图文编辑
	 */
	@RequestMapping("/article-Ue")
	public String articleUe(int id,Model model) {
		System.out.println(id);
		Articles articles = articlesMapper.articleUe(id);
		model.addAttribute("articles",articles);
		return "admin/article-Ue";
	}
	
	
	/**
	 * 图文更新
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/artucleUpadate", method = RequestMethod.POST)
	@ResponseBody
	public String artucleUpadate(@RequestParam("file") MultipartFile file,HttpServletRequest request) {//@RequestParam("articletitle") String articletitle,
			//@RequestParam("articletype")String articletype,@RequestParam("author")String author,
			//@RequestParam("editor")String editor) {
		int id= Integer.valueOf(request.getParameter("id"));
		String articletitle = request.getParameter("articletitle");
		String articletype = request.getParameter("articletype");
		String author = request.getParameter("author");
		String editor = request.getParameter("editor");
		String imgUrl = null;
		if (!file.isEmpty()) {
            try {
            	 // 上传到指定目录
            	  // file.transferTo(dest);
            	System.out.println(file.getOriginalFilename());
            	String img ="D:\\eclipse-workspace\\yihengtang\\yihengtang\\src\\main\\webapp\\"+file.getOriginalFilename();
            	imgUrl = "https://qubing.net.cn/"+file.getOriginalFilename();
                //imgMapper.addUrl(imgUrl);
            	BufferedOutputStream out = new BufferedOutputStream(
                        new FileOutputStream(new File(img)));
                out.write(file.getBytes());
                out.flush();
                out.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                return "上传失败," + e.getMessage();
            } catch (IOException e) {
                e.printStackTrace();
                return "上传失败," + e.getMessage();
            }
            //articlesMapper.addArticles(articletitle, imgUrl,Integer.valueOf(articletype), editor, author);
            articlesMapper.aeticeUpadateImg(articletitle, imgUrl, Integer.valueOf(articletype),author,editor,id);
            return "保存成功";
        } else {
        	articlesMapper.aeticeUpadate(articletitle, Integer.valueOf(articletype), author, editor, id);
            return "保存成功。";
        }
	}
	
	
	@RequestMapping(value = "/expertsAdd", method = RequestMethod.POST)
	@ResponseBody
	public String expertsAdd(@RequestParam("file") MultipartFile file,HttpServletRequest request) {//@RequestParam("articletitle") String articletitle,
			//@RequestParam("articletype")String articletype,@RequestParam("author")String author,
			//@RequestParam("editor")String editor) {
		
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String department = request.getParameter("department");
		String position = request.getParameter("position");
		String profile = request.getParameter("profile");
		//String profiles = request.getParameter("profiles");
		String amount = request.getParameter("amount");
		String kanzhenshijian = request.getParameter("kanzhenshijian");
		String location = request.getParameter("location");
		String locations = request.getParameter("locations");
		String profiles = request.getParameter("editor");
		String imgUrl = null;
		
		Integer departmentId = departmentMapper.departmentId(department);
		if(departmentId == null) {
			departmentMapper.departmentAdd(department);
			departmentId = departmentMapper.departmentId(department);
		}
		
		if (!file.isEmpty()) {
            try {
            	 // 上传到指定目录
            	  // file.transferTo(dest);
            	System.out.println(file.getOriginalFilename());
            	String img ="D:\\eclipse-workspace\\yihengtang\\yihengtang\\src\\main\\webapp\\"+file.getOriginalFilename();
            	imgUrl = "https://qubing.net.cn/"+file.getOriginalFilename();
                //imgMapper.addUrl(imgUrl);
            	BufferedOutputStream out = new BufferedOutputStream(
                        new FileOutputStream(new File(img)));
                out.write(file.getBytes());
                out.flush();
                out.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                return "上传失败," + e.getMessage();
            } catch (IOException e) {
                e.printStackTrace();
                return "上传失败," + e.getMessage();
            }
            expertsMapper.expertsAdd(name, gender, position, profile, profiles, kanzhenshijian, location, locations, amount, imgUrl, departmentId);
            return "上传成功";
        } else {
            return "上传失败，因为文件是空的.";
        }
	}
	
	/**
	 * 编辑医师
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/experts-editors", method = RequestMethod.POST)
	@ResponseBody
	public String expertsEditor(@RequestParam("file") MultipartFile file,HttpServletRequest request) {//@RequestParam("articletitle") String articletitle,
			//@RequestParam("articletype")String articletype,@RequestParam("author")String author,
			//@RequestParam("editor")String editor) {
		int id =Integer.valueOf(request.getParameter("id")); 
		String name = request.getParameter("name");
		System.out.println(name);
		String gender = request.getParameter("gender");
		String department = request.getParameter("department");
		String position = request.getParameter("position");
		String profile = request.getParameter("profile");
		//String profiles = request.getParameter("profiles");
		String amount = request.getParameter("amount");
		String kanzhenshijian = request.getParameter("kanzhenshijian");
		String location = request.getParameter("location");
		String locations = request.getParameter("locations");
		String profiles = request.getParameter("editor");
		String imgUrl = null;
		
		Integer departmentId = departmentMapper.departmentId(department);
		if(departmentId == null) {
			departmentMapper.departmentAdd(department);
			departmentId = departmentMapper.departmentId(department);
		}
		
		if (!file.isEmpty()) {
            try {
            	 // 上传到指定目录
            	  // file.transferTo(dest);
            	System.out.println(file.getOriginalFilename());
            	String img ="D:\\eclipse-workspace\\yihengtang\\yihengtang\\src\\main\\webapp\\"+file.getOriginalFilename();
            	imgUrl = "https://qubing.net.cn/"+file.getOriginalFilename();
                //imgMapper.addUrl(imgUrl);
            	BufferedOutputStream out = new BufferedOutputStream(
                        new FileOutputStream(new File(img)));
                out.write(file.getBytes());
                out.flush();
                out.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                return "图片上传失败," + e.getMessage();
            } catch (IOException e) {
                e.printStackTrace();
                return "图片上传失败," + e.getMessage();
            }
            expertsMapper.expertsEditor(name, gender, position, profile, profiles, kanzhenshijian, location, locations, amount, imgUrl, departmentId,id);
            return "保存成功";
        } else {
        	expertsMapper.expertsEditorNoImg(name, gender, position, profile, profiles, kanzhenshijian, location, locations, amount, departmentId,id);
            return "保存成功.";
        }
	}
	
	
	/**
	 * 按id查询医师
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/experts-editor")
	public String expertsEditor(int id,Model model) {
		model.addAttribute("experts",expertsMapper.adminFindById(id));
		return "admin/experts-editor";
	}
	
	/**
	 * 修改密码
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/password")
	public String password() {
		return "admin/password";
	}
	
	/**
	 * 修改
	 * @param admin
	 * @param password
	 * @param Password2
	 * @return
	 */
	@RequestMapping("/neWpassword")
	@ResponseBody
	public String password(String adminName,String password,String password2) {
		
		if(adminMapper.adminName(adminName) != "") {
			if(password.equals(password2)) {
				adminMapper.password(password2, adminName);
				return "成功";
			}
		}
		
		return "失败";
	}
	

	@RequestMapping("/make")
	public String make(Model model) {
		model.addAttribute("makeList",adminMapper.yuyue());
		
		return "/admin/make";
	}
	
	
	@RequestMapping("/complete")
	public String complete() {
		return "/admin/complete";
	}
	
	/**
	 * 接受预约
	 * @param id
	 * @param state
	 * @return
	 */
	@RequestMapping("/jieYuyue")
	@ResponseBody
	public String jieYuyue(int id,int state) {
		String isError = "成功";
		try {
		adminMapper.jieshouyuyue("周一至周五", id);
		}catch (Exception e) {
			isError = "失败";
			e.printStackTrace();
		}
		return isError;
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequestMapping("/shanchu")
	@ResponseBody
	public String shanchu(int id) {
		String isError = "成功";
		try {
		adminMapper.shanchu(id);
		}catch (Exception e) {
			isError = "失败";
			e.printStackTrace();
		}
		return isError;
	}
	
//	@RequestMapping(value = "/imgUpload", method = RequestMethod.POST)
//	@ResponseBody
//	public String imgUpload(@RequestParam("file") MultipartFile file) {
//		String imgUrl = null;
//		if (!file.isEmpty()) {
//            try {
//            	 // 上传到指定目录
//            	  // file.transferTo(dest);
//            	System.out.println(file.getOriginalFilename());
//            	String img ="D:\\eclipse-workspace\\yihengtang\\yihengtang\\src\\main\\webapp\\"+file.getOriginalFilename();
//                imgUrl = "https://liangyi120.xin/"+file.getOriginalFilename();
//                imgMapper.addUrl(imgUrl);
//            	BufferedOutputStream out = new BufferedOutputStream(
//                        new FileOutputStream(new File(img)));
//                out.write(file.getBytes());
//                out.flush();
//                out.close();
//            } catch (FileNotFoundException e) {
//                e.printStackTrace();
//                return "上传失败," + e.getMessage();
//            } catch (IOException e) {
//                e.printStackTrace();
//                return "上传失败," + e.getMessage();
//            }
//            return imgUrl;
//        } else {
//            return "上传失败，因为文件是空的.";
//        }
//	}
}
