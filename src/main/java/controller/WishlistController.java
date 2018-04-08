package controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MovieDataBeanUsingAPI;
import model.MovieFinderAccessDataBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sist.msk.Action;

import dao.MybatisCurrentMovieDBBean;
import dao.MybatisWishListDBBean;

@Controller
public class WishlistController {

	ModelAndView mv = new ModelAndView();
	
	@Autowired
	MybatisWishListDBBean wishListDao = new MybatisWishListDBBean();
	
	@Autowired
	MybatisCurrentMovieDBBean currentMovieDao = new MybatisCurrentMovieDBBean();

	@RequestMapping(value = "addWishList")
	public ModelAndView addWishList(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("cccc");
		String movie_name = request.getParameter("movie_name");
		String id = request.getParameter("id");
		System.out.println("wishListcontroller addWishList");
		wishListDao.insert_WishList(id, movie_name);
		//wishList에 아이디와 영화 이름이 저장되고
		currentMovieDao.increase_like(movie_name);
		//currentMovie에 영화이름에 해당하는 영화의 like 수가 늘어난
		mv.clear();
		mv.setViewName("wishlist/addWishList");
		
		return mv;
	}
	
	@RequestMapping(value = "deleteWishList")
	public ModelAndView deleteWishList(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("cccc");
		
		String movie_name = request.getParameter("movie_name");
		String id = request.getParameter("id");
		System.out.println("wishListcontroller deleteWishList");
		
		wishListDao.delete_WishList(id, movie_name);
		currentMovieDao.decrease_like(movie_name);
		
		mv.clear();
		mv.setViewName("wishlist/deleteWishList");
		
		return mv;
	}

}
