package com.hiteach.repository;

import com.hiteach.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    @Query(value = "select u.* from user u",nativeQuery = true)
    Page<User> findAll(Pageable pageable);

    @Query(value = "select u.* from user u where u.username = ?1 and u.password = ?2 and actived = 1", nativeQuery = true)
    Optional<User> findByUsernameAndPassword(String username, String password);

    @Query(value = "select u.* from user u where u.username = ?1", nativeQuery = true)
    Optional<User> findByUsername(String username);

    @Query(value = "select u.* from user u where u.id = ?1", nativeQuery = true)
    Optional<User> findById(Long id);

    @Query(value = "select count(id) from user WHERE email =?1", nativeQuery = true)
    Long countUserByEmail(String email);

    @Query(value = "select * from user WHERE activation_key =?1", nativeQuery = true)
    Optional<User> getUserByActivationKey(String activationkey);

    @Query(value = "select * from user WHERE email =?1", nativeQuery = true)
    Optional<User> getUserByEmail(String email);

    @Query(value = "select * from user WHERE remember_key =?1", nativeQuery = true)
    Optional<User> getUserByRememberKey(String key);

    @Query(value = "select * from user WHERE username =?1", nativeQuery = true)
    Optional<User> getUserByUserName(String username);

    @Query(value = "select u.* from user u inner join user_authority a on a.user_id = u.id where a.authority_name != ?1",nativeQuery = true)
    List<User> findUserNotAdmin(String role);

    @Query(value = "select u.* from user u inner join user_authority a on a.user_id = u.id where a.authority_name = ?1",nativeQuery = true)
    List<User> findUserBySelect(String role);

    @Query("select count(m.id) from User m")
    public Double total();

    @Query(value = "select u.* from user u inner join user_authority a on a.user_id = u.id where a.authority_name != ?1 and MONTH(u.created_date) = ?2 and  YEAR(u.created_date) = ?3",nativeQuery = true)
    List<User> findUserNotAdminThisMonth(String role, int month, int year);

    @Query(value = "select u.* from user u inner join user_authority a on a.user_id = u.id where a.authority_name = ?1 and (u.username like ?4 or u.fullname like ?4) limit ?2 offset ?3", nativeQuery = true)
    List<User> getAllTeacher(String role, Integer limit, Integer offset, String param);

    @Query(value = "select count(*) from user u inner join user_authority a on a.user_id = u.id where a.authority_name = ?1", nativeQuery = true)
    Integer totalTeacher(String role);

    @Query("select u from User u where u.username like ?1 or u.fullname like ?1")
    public Set<User> searchByParam(String param);
}
