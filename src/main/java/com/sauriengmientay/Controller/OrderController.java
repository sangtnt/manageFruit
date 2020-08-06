package com.sauriengmientay.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sauriengmientay.Entity.Order;
import com.sauriengmientay.Repository.OrderRepository;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderRepository orderRepo;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public ModelAndView showAllOrder() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cusOrder");
		mv.addObject("orders", orderRepo.findAll());
		return mv;
	}
	
	@RequestMapping(value="/orderDetail", method=RequestMethod.GET)
	public ModelAndView viewOrderDetail(@RequestParam Long orderId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("orderDetail");
		mv.addObject("order", orderRepo.findById(orderId).get());
		return mv;
	}
	
	@RequestMapping(value="/changeOrder", method=RequestMethod.POST)
	public String changeOrder(@RequestParam Integer status, @RequestParam Long orderId) {
		Order order = orderRepo.findById(orderId).get();
		order.setStatus(status);
		orderRepo.save(order);
		return "redirect:/order";
	}
}
