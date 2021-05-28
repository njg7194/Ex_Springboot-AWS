package com.jojoldu.book.web;

import com.jojoldu.book.service.posts.PostsService;
import com.jojoldu.book.web.dto.PostsSaveRequestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RestController
public class PostsApiController {

    private final PostsService postsService;

    @PostMapping("/api/v1/posts")
    public Long save(@RequestBody PostsSaveRequestDtorequestDto) {
        return postsService.save(requestDto);
    }


}
