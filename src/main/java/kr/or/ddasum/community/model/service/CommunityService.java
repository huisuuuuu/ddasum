package kr.or.ddasum.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.ddasum.community.model.vo.Community;

public interface CommunityService {

	HashMap<String, Object> selectAllCommunity(int currentPage);

	ArrayList<Community> searchCommunity(String type, String keyword, int currentPage);

	HashMap<String, Object> detailOneCommunity(int cNo);

	int deleteCommunity(int cNo);

	int deleteComment(int comNo);

	void hitCommunity(int cNo);

	int insertCommunity(Community c);

}
