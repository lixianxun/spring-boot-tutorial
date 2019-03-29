package net.javaguides.springbootsecurity.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import net.javaguides.springbootsecurity.entities.Message;
import net.javaguides.springbootsecurity.repositories.MessageRepository;

/**
 * @author Ramesh Fadatare
 *
 */
//@Controller
@RestController
public class HomeController
{
	@Autowired
	private MessageRepository messageRepository;
	
	@GetMapping("/home")
	public String home(Model model)
	{
		model.addAttribute("msgs", messageRepository.findAll());		
		return "userhome";
	}
	
	@PreAuthorize("hasAuthority('save_message')")
	@PostMapping("/messages")
	public String saveMessage(Message message)
	{
		messageRepository.save(message);
		return "redirect:/home";
	}
	
	@PreAuthorize("hasAuthority('list_message')")
	@GetMapping("/messages/list")
	public List<Message> listMessage(Message message)
	{
		return messageRepository.findAll();
	}
}
