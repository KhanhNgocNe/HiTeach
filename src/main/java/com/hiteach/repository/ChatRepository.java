package com.hiteach.repository;

import com.hiteach.entity.Blog;
import com.hiteach.entity.Chatting;
import com.hiteach.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Set;

public interface ChatRepository extends JpaRepository<Chatting,Long> {

    @Query(value = "select * from chatting where (sender = ?1 and receiver = ?2) or (receiver = ?1 and sender = ?2) order by id asc", nativeQuery = true)
    public List<Chatting> findByUser(Long idSender, Long idReceiver);

    @Query("select c.sender from Chatting c inner join c.receiver r where r.id = ?1 ")
    public Set<User> findListUserChatedWithMeIsReceiver(Long myId);

    @Query("select c.receiver from Chatting c inner join c.sender r where r.id = ?1 ")
    public Set<User> findListUserChatedWithMeIsSender(Long myId);

    @Query("select c.sender from Chatting c inner join c.receiver r where r.id = ?1 and (c.sender.username like ?2 or c.sender.fullname like ?2 )")
    public Set<User> findListUserChatedWithMeIsReceiverParam(Long myId, String param);

    @Query("select c.receiver from Chatting c inner join c.sender r where r.id = ?1 and (c.receiver.username like ?2 or c.receiver.fullname like ?2 )")
    public Set<User> findListUserChatedWithMeIsSenderParam(Long myId, String param);

    @Query(value = "select * from chatting where (sender = ?1 and receiver = ?2) or (receiver = ?1 and sender = ?2) order by id desc limit 1 offset  0", nativeQuery = true)
    public Chatting findLastChatting(Long idSender, Long idReceiver);
}
