package com.ex;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookController {
	@Autowired
	private SessionFactory sf;
	private Session se;
	private Transaction tx;
	
	@RequestMapping("/register")
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		int phone=Integer.parseInt(request.getParameter("phone"));
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		
		User u = new User();
		u.setUsername(username);
		u.setPassword(password);
		u.setPhone(phone);
		u.setEmail(email);
		u.setAddress(address);
	
		se=sf.openSession();
		tx=se.beginTransaction();
		se.save(u);
		tx.commit();
		se.close();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("status","success");
		mv.setViewName("index");
		
		return mv;
	}
	
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		ModelAndView mv = new ModelAndView();
		se=sf.openSession();
		
	    String hql = "SELECT u FROM User u WHERE u.username = :username";
	    Query<User> query = se.createQuery(hql, User.class);
	    query.setParameter("username", username);
	    User user = query.uniqueResult();

	    if (user != null && user.getPassword().equals(password)) {
	    	mv.addObject("status","valSuccess");
	    	mv.setViewName("home");
	    	HttpSession hs = request.getSession();
	    	hs.setAttribute("username", username);
	    } else {
	    	mv.addObject("status","valFailed");
	    	mv.setViewName("login");
	    }
	    
		se.close();
		return mv;
	}
	@RequestMapping("/profile")
	public ModelAndView profile(HttpServletRequest request, HttpServletResponse response) {
		HttpSession hs = request.getSession();
		String username = (String)hs.getAttribute("username");
		se=sf.openSession();
		
		String hql = "SELECT u FROM User u WHERE u.username = :username";
		Query<User> query = se.createQuery(hql, User.class);
		query.setParameter("username", username);
		User user = query.uniqueResult();
		se.close();

		ModelAndView mv = new ModelAndView();
		mv.addObject("uobj",user);
		mv.setViewName("profile");
		return mv;
	}
	@RequestMapping("/addbook")
	public ModelAndView addBook(HttpServletRequest request, HttpServletResponse response) {
		HttpSession hs = request.getSession();
		String username = (String)hs.getAttribute("username");
		
		String bookname=request.getParameter("bookname");
		String author=request.getParameter("author");
		
		se=sf.openSession();
		String hql = "SELECT u FROM User u WHERE u.username = :username";
		Query<User> query = se.createQuery(hql, User.class);
		query.setParameter("username", username);
		User user = query.uniqueResult();
		
		Book bk = new Book();
		bk.setBookname(bookname);
		bk.setAuthor(author);
		bk.setSid(user.getId());
		
		
		tx=se.beginTransaction();
		se.save(bk);
		tx.commit();
		se.close();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("book_added",bookname);
		mv.setViewName("add_book");
		return mv;
	}
	@RequestMapping("/view_book")
	public ModelAndView viewBook(HttpServletRequest request, HttpServletResponse response) {
		HttpSession hs = request.getSession();
		String username = (String)hs.getAttribute("username");
		se=sf.openSession();
		
		String hql = "SELECT u FROM User u WHERE u.username = :username";
		Query<User> query = se.createQuery(hql, User.class);
		query.setParameter("username", username);
		User user = query.uniqueResult();
		
		String hql2 = "SELECT b FROM Book b WHERE b.sid = :sid";
		Query<Book> query2 = se.createQuery(hql2, Book.class);
		query2.setParameter("sid", user.getId());
		List<Book> books = query2.getResultList();		
		se.close();

		ModelAndView mv = new ModelAndView();
		mv.addObject("books",books);
		mv.setViewName("view_book");
		return mv;
	}
	@RequestMapping("/delBk")
	public ModelAndView deleteBook(HttpServletRequest request, HttpServletResponse response) {
		se=sf.openSession();
		int bid = Integer.parseInt(request.getParameter("bid"));
		
		    Book bk = se.load(Book.class, bid);
		    se.delete(bk);
		    
		    System.out.println(bk.getBookname());
		    
			tx=se.beginTransaction();
			tx.commit();
			se.close();

		ModelAndView mv = viewBook(request, response);
		mv.addObject("delete","success");
		return mv;
	}
}
