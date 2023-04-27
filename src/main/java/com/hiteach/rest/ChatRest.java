package com.hiteach.rest;

import com.hiteach.dto.ChatDto;
import com.hiteach.entity.Chatting;
import com.hiteach.entity.User;
import com.hiteach.repository.ChatRepository;
import com.hiteach.repository.UserRepository;
import com.hiteach.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.*;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class ChatRest {

    @Autowired
    private ChatRepository chatRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @GetMapping("/all/getAllUserChat")
    public ArrayList<ChatDto> getAllUserChatWithMe(){
        User user = userService.getUserWithAuthority();
        Long id = user.getId();
        Set<User> list = chatRepository.findListUserChatedWithMeIsReceiver(id);
        list.addAll(chatRepository.findListUserChatedWithMeIsSender(id));
        Set<ChatDto> chatDtoList = new HashSet<>();
        for(User u : list){
            Chatting chatting = chatRepository.findLastChatting(id, u.getId());
            ChatDto chatDto = new ChatDto(u,chatting.getContent(),calculateTime(chatting.getCreatedDate()), chatting.getCreatedDate()," ");
            chatDtoList.add(chatDto);
        }
        ArrayList<ChatDto> chatDtoList1 = new ArrayList<>(chatDtoList);
        sort(chatDtoList1);
        return chatDtoList1;
    }

    @GetMapping("/all/getAllUserChatParam")
    public ArrayList<ChatDto> getAllUserChatWithMeParam(@RequestParam("param") String param){
        User user = userService.getUserWithAuthority();
        Long id = user.getId();

        Set<User> list = userRepository.searchByParam("%"+param+"%");

        Set<ChatDto> chatDtoList = new HashSet<>();
        for(User u : list){
            Chatting chatting = chatRepository.findLastChatting(id, u.getId());
            if(chatting != null){
                ChatDto chatDto = new ChatDto(u,chatting.getContent(),calculateTime(chatting.getCreatedDate()), chatting.getCreatedDate()," ");
                chatDtoList.add(chatDto);
            }
            else{
                ChatDto chatDto = new ChatDto(u,"","0 min", new Timestamp(System.currentTimeMillis())," ");
                chatDtoList.add(chatDto);
            }
        }
        ArrayList<ChatDto> chatDtoList1 = new ArrayList<>(chatDtoList);
        sort(chatDtoList1);
        return chatDtoList1;
    }

    @GetMapping("/all/getListChat")
    public List<Chatting> getListChat(@RequestParam("idreciver") Long idreciver){
        User user = userService.getUserWithAuthority();
        Long id = user.getId();
        return chatRepository.findByUser(id, idreciver);
    }

    public void sort(ArrayList<ChatDto> sub) {
        Collections.sort(sub, new Comparator<ChatDto>() {
            @Override
            public int compare(ChatDto o1, ChatDto o2) {
                return o2.getTimestamp().compareTo(o1.getTimestamp());
            }
        });
    }

    public String calculateTime(Timestamp t){
        Long now = System.currentTimeMillis();
        Long end = now - t.getTime();
        if(end/1000/60 < 1){
            return "1 min";
        }
        else if(end/1000/60 >= 1 && end/1000/60 < 60){
            Integer x = Math.toIntExact(end / 1000 / 60);
            return x.toString()+" min";
        }
        else if(end/1000/60/60 >= 1 && end/1000/60/60 < 24){
            Integer x = Math.toIntExact(end / 1000 / 60 / 60);
            return x.toString() + " hour";
        }
        else if(end/1000/60/60/24 >= 1){
            Integer x = Math.toIntExact(end / 1000 / 60 / 60 / 24);
            return x.toString() + " day";
        }
        return "0 min";
    }
}
