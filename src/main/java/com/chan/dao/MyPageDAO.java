package com.chan.dao;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.chan.dto.MyPageDTO;

public class MyPageDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	Connection conn = null;
	
//======================공용 정보 가져오기======================
	//1. 물품 1개 정보 가져오기
	public MyPageDTO getSearchProduct(int product_id) {
		
		MyPageDTO dto = sessionTemplate.selectOne("myPageMapper.searchProduct", product_id);
		
		return dto;
	}

//=======================main================
	//1. 계정 정보 가져오기
	public MyPageDTO getJoinData(String join_id){
		
		MyPageDTO dto = sessionTemplate.selectOne("myPageMapper.joinData",join_id);
		
		return dto;
		
	}
	
	//2. 상담 정보 가져오기
	public int getConsultingData(String join_id){
		
		int result = sessionTemplate.selectOne("myPageMapper.consultingData",join_id);
		
		return result;
		
	}
	
	//3.  구매 정보 가져오기
	public int getBuyData(String join_id){
		
		int result = sessionTemplate.selectOne("myPageMapper.orderListData",join_id);
		
		return result;
		
	}
	
	//4. 쿠폰 정보 가져오기
	public int getCouponData(String join_id){
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		hMap.put("join_id", join_id);
		hMap.put("coupon_use", 1);
		// 사용 쿠폰 : 0 , 미사용 쿠폰 : 1, 기한 만료 쿠폰 : 2
		
		int result = sessionTemplate.selectOne("myPageMapper.couponData",hMap);
		
		return result;
		
	}
	
    //5. 최근 주문/배송 리스트
    public List<MyPageDTO> getRecentOrderList(String join_id) {
  
    HashMap<String, Object> hMap = new HashMap<String, Object>();
    hMap.put("join_id", join_id);
    hMap.put("start", 1);
    hMap.put("end", 3);
   
    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.orderList", hMap);
  
    return lists;
  
    }
    
	
    //6. 최근 주문/배송 리스트
    public List<MyPageDTO> getMainFrequencyList(String join_id) {
   
    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.mainFrequencyList", join_id);
  
    return lists;
  
    }
    
    //7. 최근 주문/배송 리스트
    public List<MyPageDTO> getMainZzimList(String join_id) {
  	  
    HashMap<String, Object> hMap = new HashMap<String, Object>();
    hMap.put("join_id", join_id);
    hMap.put("start", 1);
    hMap.put("end", 3);
   
    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.zzimList", hMap);
  
    return lists;
  
    }
	 
//============비밀번호 수정===========
	//1. 비밀번호 업데이트 하기
	public void getUpdatePassword(String join_id,String join_password) {
		
		Map<String, String> hMap = new HashMap<String, String>();
		hMap.put("join_id", join_id);
		hMap.put("join_password", join_password);
		
		sessionTemplate.selectOne("myPageMapper.updatePassword",hMap);
		
	}

//==============구매 후기================
	
	  //1. 리뷰 작성 데이터 갯수
	  public int getCommentDataCount(String join_id){
		  
		  int result = sessionTemplate.selectOne("myPageMapper.commentDataCount",join_id);
		  
		  return result;
	  
	  }
	  
	  //2. 리뷰 작성 데이터 갯수 
	  public int getCommentNoDataCount(String join_id){
	  
		  int result = sessionTemplate.selectOne("myPageMapper.commentNoDataCount",join_id);
		  
		  return result;
	  
	  }
	  
	  //3. 구매후기 리스트 
	  
	  public List<MyPageDTO> getCommentDataList(String join_id,int start,int end) {
	  
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  hMap.put("join_id", join_id);
		  hMap.put("start", start);
		  hMap.put("end", end);
		  
		  List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.commentDataList", hMap);
	  
	  return lists;
	  
	  }
	  
	  //3. 구매후기 미작성 리스트 
	  
	  public List<MyPageDTO> getCommentNoDataList(String join_id,int start,int end) {
	  
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  hMap.put("join_id", join_id);
		  hMap.put("start", start);
		  hMap.put("end", end);
		  
		  List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.commentNoDataList", hMap);
	  
	  return lists;
	  
	  }
	  
	  //4. 구매 후기 삽입
	  public void commentInsert(MyPageDTO dto) {
		  
		  sessionTemplate.insert("myPageMapper.commentInsert", dto);
		  
		  sessionTemplate.update("myPageMapper.reviewCheck", dto.getReviewCheck_id());
		  
	  }
	  
	  //5. 리뷰 id값 주기
	  public int commentMaxId() {
		  
		  int result = 0;
		  
		  result = sessionTemplate.selectOne("myPageMapper.commentMaxId");
		  
		  return result;
	  }
	  
	  //6. 리뷰 point id값 주기
	  public int getPointMaxId() {
		  
		  int result = 0;
		  
		  result = sessionTemplate.selectOne("myPageMapper.pointMaxId");
		  
		  return result;
	  }
	  
	  //7. 리뷰 point 삽입
	  public void getCommentPointInsert(MyPageDTO dto) {
		  
		  sessionTemplate.insert("myPageMapper.commentPointInsert", dto);
		  
		  sessionTemplate.update("myPageMapper.joinPointUpdate", dto);
		  
	  }
	  
	  //8. review 작성용 데이터 불러오기
	  public MyPageDTO getCommentNoData(String join_id,int orderList_id,int productOrder_id) {
			
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  hMap.put("join_id", join_id);
		  hMap.put("orderList_id", orderList_id);
		  hMap.put("productOrder_id", productOrder_id);
		    
		  MyPageDTO dto = sessionTemplate.selectOne("myPageMapper.commentNoData", hMap);		  
		  
		  return dto;
		  
	  }
	  
	  //9. join_point 정보 가져오기 
	  public int getJoinPoint(String join_id) {
		  
		  int join_point = sessionTemplate.selectOne("myPageMapper.joinPointSelect", join_id);
		  
		  return join_point;
	  }
	  
	//상품별 리뷰 갯수
	public int reviewCount(int product_id) {
		
		int result = 0;
		
		result = sessionTemplate.selectOne("myPageMapper.reviewCount",product_id);
		
		return result;
		
	}
	
	//상품별 리뷰
	public List<MyPageDTO> reviewGrade(int product_id) {
		
		List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.reviewGrade", product_id);
		
		return lists;
		
	}
	
	//상품 점수 변경
	public void productGradeUpdate(int product_id,int product_like) {
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
	    hMap.put("product_id", product_id);
	    hMap.put("product_like", product_like);
	    
		sessionTemplate.update("myPageMapper.productGradeUpdate", hMap);

	}

	  //==============쿠폰 리스트================
	  //1. 쿠폰 데이터 갯수
	  public int getCouponDataCount(String join_id,int coupon_use) {
		  
		  int result = 0;
		  
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  
		  hMap.put("join_id", join_id);
		  hMap.put("coupon_use", coupon_use);
		  
		  result = sessionTemplate.selectOne("myPageMapper.couponData",hMap);
		  
		  return result;
	  }
	  
	  //2. 쿠폰 데이터 리스트
	  public List<MyPageDTO> getCouponList(String join_id,int coupon_use,int start,int end) {
		  
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  hMap.put("join_id", join_id);
		  hMap.put("coupon_use", coupon_use);
		  hMap.put("start", start);
		  hMap.put("end", end);

		  List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.couponList", hMap);
		  
		  return lists;
	  }
	 
	  //==============point 리스트================	  
	  //1. point 전체 갯수
	  public int getPointDataCount(String join_id) {
		  
		  int result = 0;
		  
		  result = sessionTemplate.selectOne("myPageMapper.pointDataCount",join_id);
		  
		  return result;
	  }
	  
	  //2. point use 갯수
	  public int getPointUseDataCount(String join_id,int point_use) {
		  
		  int result = 0;
		  
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  
		  hMap.put("join_id", join_id);
		  hMap.put("point_use", point_use);
		  
		  result = sessionTemplate.selectOne("myPageMapper.pointUseDataCount",hMap);
		  
		  return result;
	  }
	  
	  //3. point 전체 데이터 리스트
	  public List<MyPageDTO> getPointList(String join_id,int start,int end) {
		  
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  hMap.put("join_id", join_id);
		  hMap.put("start", start);
		  hMap.put("end", end);

		  List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.pointList", hMap);
		  
		  return lists;
	  }
	  
	  //4. point 전체 데이터 리스트
	  public List<MyPageDTO> getPointUseList(String join_id,int point_use,int start,int end) {
		  
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  hMap.put("join_id", join_id);
		  hMap.put("point_use", point_use);
		  hMap.put("start", start);
		  hMap.put("end", end);

		  List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.pointUseList", hMap);
		  
		  return lists;
	  }
	  
	  //==============회원 정보 수정================	
		//1. 회원 정보 가져오기
		public MyPageDTO getInfoSearchData(String join_id){
			
			MyPageDTO dto = sessionTemplate.selectOne("myPageMapper.infoSearchData",join_id);
			
			return dto;
			
		}
		//2. 회원 정보 수정 하기
		public void getInfoUpdateData(MyPageDTO dto){
			
			HashMap<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("join_phone", dto.getJoin_phone());
			hMap.put("join_email", dto.getJoin_email());
			hMap.put("join_addrNum", dto.getJoin_addrNum());
			hMap.put("join_addr1", dto.getJoin_addr1());
			hMap.put("join_addr2", dto.getJoin_addr2());
			hMap.put("join_id", dto.getJoin_id());
			
			sessionTemplate.update("myPageMapper.infoUpdateData", hMap);
			
		}
		
		//==============자주 구매 상품================	
		//1. 자주 찾는 순으로 물품 리스트
		public List<MyPageDTO> getFrequencyList(String join_id,int start,int end){
			
			HashMap<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("join_id", join_id);
			hMap.put("start", start);
			hMap.put("end", end);
			
			List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.frequencyList", hMap);
			
			return lists;
			
		}
		//2. 총구매 물품 수량(count)
		public int getProductCount(String join_id){
			
			int result = sessionTemplate.selectOne("myPageMapper.orderListCount", join_id);
			
			return result;
			
		}
		
		//==============상품 문의 내역=================
		//1. 상품 문의 내역 리스트
		public List<MyPageDTO> getProductQuestionList(String join_id, int start, int end) {
			
			HashMap<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("join_id", join_id);
			hMap.put("start", start);
			hMap.put("end", end);
			
			List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.productQuestionList", hMap);
			
			return lists;
			
		}
		
		//2. 문의 갯수
		public int getProductQuestionCount(String join_id){
			
			int result = sessionTemplate.selectOne("myPageMapper.productQuestionCount", join_id);
			
			return result;
			
		}
		
		//3. 상품 문의 내역 삭제
		public void getProductQuestionDelete(String join_id, int productQuestion_id){
			
			HashMap<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("join_id", join_id);
			hMap.put("productQuestion_id", productQuestion_id);
			
			sessionTemplate.delete("myPageMapper.productQuestionDelete", hMap);
			
		}
		
		//4. 상품 문의 답변 리스트
		public MyPageDTO getAnswerList(int productQuestion_id){
			
			MyPageDTO dto = sessionTemplate.selectOne("myPageMapper.productAnswerList",productQuestion_id);
			
			return dto;
			
		}
		
		//==============1:1 문의 내역=================
		//1. 상품 문의 내역 리스트
		public List<MyPageDTO> getQnaList(String join_id,int start,int end) {
			
			HashMap<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("join_id", join_id);
			hMap.put("start", start);
			hMap.put("end", end);
			
			List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.qnaList", hMap);
			
			return lists;
			
		}
		
		//2. 1:1 문의 갯수
		public int getQnaCount(String join_id){

			int result = sessionTemplate.selectOne("myPageMapper.qnaCount", join_id);
			
			return result;
			
		}
		
		//3. 1:1 문의 내역 삭제
		public void getQnaDelete(String join_id, int qna_id){
			
			HashMap<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("join_id", join_id);
			hMap.put("qna_id", qna_id);
			
			sessionTemplate.delete("myPageMapper.qnaDelete", hMap);
			
		}
		
		//4. qna id 구하기
		public int qnaMaxNum(){

			int maxNum = 0;

			maxNum = sessionTemplate.selectOne("myPageMapper.qnaMaxNum");

			return maxNum;
		}
		
		//5. qna 넣기
		public void insertqna(MyPageDTO dto){

			sessionTemplate.insert("myPageMapper.insertqna",dto);
		}
		
		//한명의 데이터 출력
		public MyPageDTO qnaGetReadData(int qna_id){

			MyPageDTO dto = sessionTemplate.selectOne("myPageMapper.qnaGetReadData",qna_id);

			return dto;

		}
		
		//===================주문/배송 리스트=====================
		//1. 주문/배송 갯수
		public int getOrderCount(String join_id) {
			
			int result = sessionTemplate.selectOne("myPageMapper.orderCount", join_id);
			
			return result;
			
		}
	
	    //2. 주문/배송 리스트
	    public List<MyPageDTO> getOrderList(String join_id,int start,int end) {
	  
	    HashMap<String, Object> hMap = new HashMap<String, Object>();
	    hMap.put("join_id", join_id);
	    hMap.put("start", start);
	    hMap.put("end", end);
	   
	    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.orderList", hMap);
	  
	    return lists;
	  
	    }
		
		//3. 주문 취소/환불 신청
		public void getOrderApply(String join_id,int orderList_id,int orderList_step) {
		
		    HashMap<String, Object> hMap = new HashMap<String, Object>();
		    hMap.put("join_id", join_id);
		    hMap.put("orderList_id", orderList_id);
		    hMap.put("orderList_step", orderList_step);
			
		    sessionTemplate.update("myPageMapper.orderApply", hMap);
			
		}
	    
		//===================주문 취소 리스트=====================
		//1. 주문 취소 갯수
		public int getCancelCount(String join_id) {
			
			int result = sessionTemplate.selectOne("myPageMapper.cancelCount", join_id);
			
			return result;
			
		}
	
	    //2. 주문 취소 리스트
	    public List<MyPageDTO> getCancelList(String join_id,int start,int end) {
	  
	    HashMap<String, Object> hMap = new HashMap<String, Object>();
	    hMap.put("join_id", join_id);
	    hMap.put("start", start);
	    hMap.put("end", end);
	   
	    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.cancelList", hMap);
	  
	    return lists;
	  
	    }
	    
		//===================교환/환불 리스트=====================
		//1. 교환/환불 갯수
		public int getRefundCount(String join_id) {
			
			int result = sessionTemplate.selectOne("myPageMapper.refundCount", join_id);
			
			return result;
			
		}
	
	    //2. 교환/환불 리스트
	    public List<MyPageDTO> getRefundList(String join_id,int start,int end) {
	  
	    HashMap<String, Object> hMap = new HashMap<String, Object>();
	    hMap.put("join_id", join_id);
	    hMap.put("start", start);
	    hMap.put("end", end);
	   
	    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.refundList", hMap);
	  
	    return lists;
	  
	    }
	    
		//===================찜 리스트=====================
		//1. 찜 갯수
		public int getZzimCount(String join_id) {
			
			int result = sessionTemplate.selectOne("myPageMapper.zzimCount", join_id);
			
			return result;
			
		}
	    //2. 찜 리스트
	    public List<MyPageDTO> getZzimList(String join_id,int start,int end) {
	  
	    HashMap<String, Object> hMap = new HashMap<String, Object>();
	    hMap.put("join_id", join_id);
	    hMap.put("start", start);
	    hMap.put("end", end);
	   
	    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.zzimList", hMap);
	  
	    return lists;
	  
	    }
	    //3. 찜 삭제
	    public void getZzimDelete(String join_id,int product_id) {
	    	
		    HashMap<String, Object> hMap = new HashMap<String, Object>();
		    hMap.put("join_id", join_id);
		    hMap.put("product_id", product_id);
	    	
	    	sessionTemplate.delete("myPageMapper.zzimDelete", hMap);
	    	
	    } 
	    
	    //4. 장바구니 보내기
	    public void getInsertCart(MyPageDTO dto) {
	    	
	    	sessionTemplate.insert("myPageMapper.insertCart", dto);
	    	
	    }
	 
		//===================환불 서비스=====================
	    //1. 환불 가능 리스트
	    public List<MyPageDTO> getRefundPossibleList(String join_id,int start,int end,int orderList_step) {
	  	  
		    HashMap<String, Object> hMap = new HashMap<String, Object>();
		    hMap.put("join_id", join_id);
		    hMap.put("start", start);
		    hMap.put("end", end);
		    hMap.put("orderList_step", orderList_step);
		   
		    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.refundPossibleList", hMap);
		  
		    return lists;
		  
		}
	    
	    //2. 환불 가능 갯수
		public int getRefundPossibleCount(String join_id,int orderList_step) {
			
		    HashMap<String, Object> hMap = new HashMap<String, Object>();
		    hMap.put("join_id", join_id);
		    hMap.put("orderList_step", orderList_step);
			
			int result = sessionTemplate.selectOne("myPageMapper.refundPossibleCount", hMap);
			
			return result;
			
		}
		
	    //3. 환불 완료/반품 리스트
	    public List<MyPageDTO> getRefundProductList(String join_id,int start,int end) {
	  	  
		    HashMap<String, Object> hMap = new HashMap<String, Object>();
		    hMap.put("join_id", join_id);
		    hMap.put("start", start);
		    hMap.put("end", end);
		   
		    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.refundProductList", hMap);
		  
		    return lists;
		  
		}
	    
	    //4. 환불 가능 갯수
		public int getRefundProductCount(String join_id) {
			
			int result = sessionTemplate.selectOne("myPageMapper.refundProductCount", join_id);
			
			return result;
			
		}
		
		//5. 환불 요청용 orderList 정보 불러오기
		public MyPageDTO getRefundOrderData(String join_id,int orderList_id) {
			
		    HashMap<String, Object> hMap = new HashMap<String, Object>();
		    hMap.put("join_id", join_id);
		    hMap.put("orderList_id", orderList_id);
		    
			MyPageDTO dto = sessionTemplate.selectOne("myPageMapper.refundOrderData", hMap);
			
			return dto;
		    
		}
		
		//6. 환불 테이블 삽입
		public void getRefundInsert(MyPageDTO dto) {
			
			sessionTemplate.insert("myPageMapper.refundDataInsert", dto);		
			
			
		}
	    
}
