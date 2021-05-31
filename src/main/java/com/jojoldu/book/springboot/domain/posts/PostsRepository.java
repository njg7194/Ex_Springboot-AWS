package com.jojoldu.book.springboot.domain.posts;

import org.springframework.data.jpa.repository.JpaRepository;

//TODO : 하이

public interface PostsRepository extends JpaRepository<Posts, Long> {


}
