package com.project.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HHserviceImpl implements HHservice{
	@Autowired
	HHDAO hhdao;

	@Override
	public UserVO getOneUser(String id) {
		UserVO result = hhdao.getOneUser(id);
		return result;
	}

	@Override // id 검색 리스트 반환
	public List<UserVO> getUserID(String id) {
		return hhdao.getUserID(id);
	}
	
	@Override // name 검색 리스트 반환
	public List<UserVO> getUserName(String name) {
		return hhdao.getUserName(name);
	}

	@Override // hashtag 검색 리스트 반환
	public List<PostVO> getHashtag(String hashtag) {
		return hhdao.getHashtag(hashtag);
	}
	
	@Override
	public void insertPostData(PostVO pvo) {
		hhdao.insertPostData(pvo);
	}

	@Override // postNum 검색 리스트 반환
	public List<PostVO> getPostNum(int postNum) {
		return hhdao.getPostNum(postNum);
	}

	@Override
	public void insertUserData(UserVO uvo) {
		hhdao.insertUserData(uvo);
	}
	
	public List<ThumbsupVO> getThumbsup(int postNum) {
		return hhdao.getThumbsup(postNum);
	}

	@Override
	public void thumbsPlus(int postNum, String id) {
		hhdao.thumbsPlus(postNum, id);
	}
	
	public void thumbsMinus(int postNum, String id) {
		hhdao.thumbsMinus(postNum, id);
	}

	@Override
	public void addComments(int postNum, String comments, String id) {
		hhdao.addComments(postNum, comments, id);
	}

	@Override
	public List<CommentsVO> getComments(int postNum) {
		return hhdao.getComments(postNum);
	}

	@Override
	public String getProfileImage(String id) {
		return hhdao.getProfileImage(id);
	}

	@Override
	public List<CommentThumbsupVO> getCommentThumbsup(int commentNum) {
		return hhdao.getCommentThumbsup(commentNum);
	}

	@Override
	public void commentThumbsPlus(int commentNum, String id) {
		hhdao.commentThumbsPlus(commentNum, id);
		
	}

	@Override
	public void commentThumbsMinus(int commentNum, String id) {
		hhdao.commentThumbsMinus(commentNum, id);
	}

	@Override
	public List<PostVO> getUserPosts(String id) {
		// TODO Auto-generated method stub
		return hhdao.getUserPosts(id);
	}
	
	
}
