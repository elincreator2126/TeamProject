package com.project.test;

import java.util.List;

public interface HHservice {
	UserVO getOneUser(String id);
	List<UserVO> getUserID(String id);
	List<UserVO> getUserName(String id);
	List<PostVO> getHashtag(String hashtag);
	void insertPostData(PostVO pvo);
	List<PostVO> getPostNum(int PostNum);
<<<<<<< HEAD
	void insertUserData(UserVO uvo);
=======
	List<ThumbsupVO> getThumbsup(int postNum);
	void thumbsPlus(int postNum, String id);
	void thumbsMinus(int postNum, String id);
>>>>>>> 문병전
}
