package com.shop.community.service;

import org.springframework.http.ResponseEntity;

import com.shop.community.domain.FreeBoardDTO;

public interface CommunityService {
	
	ResponseEntity<FreeBoardDTO> selectFreeBoard(Long id) throws Exception;

}
