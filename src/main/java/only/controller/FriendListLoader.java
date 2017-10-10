package only.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import only.model.Friendlist;
import only.service.*;
import only.utils.WebConstants;

@Controller
public class FriendListLoader {
	@Autowired
	private FriendListService fs;
	
	@RequestMapping("/friendList")
	public String FriendList(Model model, String member_id) {
		List<Friendlist> listFriend =fs.FriendListLoad(member_id);
		model.addAttribute("listFriend",listFriend);
		return "friendList";	
	}
	@RequestMapping("/friendupdate")
	public String Friendaccpet(Model model, String member_id, String member_id2, int status) {
		
		return "friendList";
	}
	
	@RequestMapping("/friendsPage")
	public String friendsPage(HttpSession session, Model model) {
		String userid = (String) session.getAttribute(WebConstants.USER_ID);
		List<Friendlist> listFriend =fs.FriendListLoad(userid);
		model.addAttribute("listFriend",listFriend);
		return "friendsPage";	
	}
}