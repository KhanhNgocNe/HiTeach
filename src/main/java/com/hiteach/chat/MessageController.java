package com.hiteach.chat;

import com.hiteach.entity.Chatting;
import com.hiteach.entity.User;
import com.hiteach.repository.ChatRepository;
import com.hiteach.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MessageController {

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ChatRepository chatRepository;

    @MessageMapping("/hello/{id}")
    public void send(SimpMessageHeaderAccessor sha, @Payload String message,@DestinationVariable String id) {
        System.out.println("sha: "+sha.getUser().getName());
        System.out.println("payload: "+message);
        com.hiteach.entity.User reciver = userRepository.findById(Long.valueOf(id)).get();
        System.out.println("userss === : "+reciver);
        com.hiteach.entity.User sender = userRepository.findByUsername(sha.getUser().getName()).get();
        Chatting chatting = new Chatting();
        chatting.setContent(message);
        chatting.setTypeFile(0);
        chatting.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        chatting.setReceiver(reciver);
        chatting.setSender(sender);
        chatRepository.save(chatting);
        Map<String, Object> map = new HashMap<>();
//        map.put("usernguoigui", sender.getId());
        map.put("sender", sender.getId());
        map.put("avatarsender", sender.getAvatar());
        map.put("typefile", 0);
        map.put("filename", "");
        simpMessagingTemplate.convertAndSendToUser(reciver.getUsername(), "/queue/messages", message,map);
    }

    @MessageMapping("/file/{id}/{filename}")
    public void sendFile(SimpMessageHeaderAccessor sha, @Payload String message,@DestinationVariable String id,
                         @DestinationVariable String filename) {
        System.out.println("sha: "+sha.getUser().getName());
        System.out.println("payload: "+message);
        com.hiteach.entity.User reciver = userRepository.findById(Long.valueOf(id)).get();
        System.out.println("userss === : "+reciver);
        User sender = userRepository.findByUsername(sha.getUser().getName()).get();
        Chatting chatting = new Chatting();
        chatting.setContent(message);
        chatting.setTypeFile(1);
        chatting.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        chatting.setReceiver(reciver);
        chatting.setSender(sender);
        chatting.setFileName(filename);
        chatRepository.save(chatting);
        Map<String, Object> map = new HashMap<>();
        map.put("sender", sender.getId());
        map.put("avatarsender", sender.getAvatar());
        map.put("typefile", 1);
        map.put("filename", filename);
        simpMessagingTemplate.convertAndSendToUser(reciver.getUsername(), "/queue/messages", message,map);
    }
}
