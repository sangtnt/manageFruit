package com.sauriengmientay.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sauriengmientay.Entity.Category;
import com.sauriengmientay.Repository.CategoryRepository;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	private CategoryRepository catRepo;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public ModelAndView category() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("categoryList");
		List<Category> cats = catRepo.findActiveCat();
		mv.addObject("cats",cats);
		return mv;
	}
	
	@RequestMapping(value="/addCat", method=RequestMethod.GET)
	public ModelAndView addCategory() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addCat");
		return mv;
	}
	
	@RequestMapping(value="/addCat", method=RequestMethod.POST)
	public String addnNewCategory(
					@RequestParam String catName
	) {
		Category cat = new Category();
		cat.setName(catName);
		catRepo.save(cat);
		return "redirect:/category";
	}
	
	@RequestMapping(value="/editCat", method=RequestMethod.GET)
	public ModelAndView viewEditCategory(@RequestParam Long catId) {
		Category cat = catRepo.findById(catId).get();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("editCat");
		mv.addObject("cat", cat);
		return mv;
	}
	
	@RequestMapping(value="/editCat", method=RequestMethod.POST)
	public String editCategory(
			@RequestParam Long catId,
			@RequestParam String catName
	) {
		Category cat = catRepo.findById(catId).get();
		cat.setName(catName);
		catRepo.save(cat);
		return "redirect:/category";
	}
	
	@RequestMapping(value="/catTrash", method=RequestMethod.GET)
	public ModelAndView trashCategory() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("catTrash");
		List<Category> cats = catRepo.findDeletedCat();
		mv.addObject("cats",cats);
		return mv;
	}
	
	@RequestMapping(value="/deleteCat", method=RequestMethod.GET)
	public String deleteCategory(@RequestParam Long catId) {
		Category cat = catRepo.findById(catId).get();
		cat.setStatus(false);
		catRepo.save(cat);
		return "redirect:/category";
	}
	
	@RequestMapping(value="/recoverCat", method=RequestMethod.GET)
	public String recoverCategory(@RequestParam Long catId) {
		Category cat = catRepo.findById(catId).get();
		cat.setStatus(true);
		catRepo.save(cat);
		return "redirect:/category/catTrash";
	}
	
	@RequestMapping(value="/deleteForeverCat", method=RequestMethod.GET)
	public String deleteFCategory(@RequestParam Long catId) {
		catRepo.deleteById(catId);
		return "redirect:/category/catTrash";
	}
	
	@RequestMapping(value="/clearCatTrash", method=RequestMethod.GET)
	public String clearTrashCategory() {
		catRepo.deleteDeactiveCategory();
		return "redirect:/category/catTrash";
	}
}
