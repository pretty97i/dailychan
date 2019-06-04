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
	
//======================���� ���� ��������======================
	//1. ��ǰ 1�� ���� ��������
	public MyPageDTO getSearchProduct(int product_id) {
		
		MyPageDTO dto = sessionTemplate.selectOne("myPageMapper.searchProduct", product_id);
		
		return dto;
	}

//=======================main================
	//1. ���� ���� ��������
	public MyPageDTO getJoinData(String join_id){
		
		MyPageDTO dto = sessionTemplate.selectOne("myPageMapper.joinData",join_id);
		
		return dto;
		
	}
	
	//2. ��� ���� ��������
	public int getConsultingData(String join_id){
		
		int result = sessionTemplate.selectOne("myPageMapper.consultingData",join_id);
		
		return result;
		
	}
	
	//3.  ���� ���� ��������
	public int getBuyData(String join_id){
		
		int result = sessionTemplate.selectOne("myPageMapper.orderListData",join_id);
		
		return result;
		
	}
	
	//4. ���� ���� ��������
	public int getCouponData(String join_id){
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		hMap.put("join_id", join_id);
		hMap.put("coupon_use", 1);
		// ��� ���� : 0 , �̻�� ���� : 1, ���� ���� ���� : 2
		
		int result = sessionTemplate.selectOne("myPageMapper.couponData",hMap);
		
		return result;
		
	}
	
    //5. �ֱ� �ֹ�/��� ����Ʈ
    public List<MyPageDTO> getRecentOrderList(String join_id) {
  
    HashMap<String, Object> hMap = new HashMap<String, Object>();
    hMap.put("join_id", join_id);
    hMap.put("start", 1);
    hMap.put("end", 3);
   
    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.orderList", hMap);
  
    return lists;
  
    }
    
	
    //6. �ֱ� �ֹ�/��� ����Ʈ
    public List<MyPageDTO> getMainFrequencyList(String join_id) {
   
    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.mainFrequencyList", join_id);
  
    return lists;
  
    }
    
    //7. �ֱ� �ֹ�/��� ����Ʈ
    public List<MyPageDTO> getMainZzimList(String join_id) {
  	  
    HashMap<String, Object> hMap = new HashMap<String, Object>();
    hMap.put("join_id", join_id);
    hMap.put("start", 1);
    hMap.put("end", 3);
   
    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.zzimList", hMap);
  
    return lists;
  
    }
	 
//============��й�ȣ ����===========
	//1. ��й�ȣ ������Ʈ �ϱ�
	public void getUpdatePassword(String join_id,String join_password) {
		
		Map<String, String> hMap = new HashMap<String, String>();
		hMap.put("join_id", join_id);
		hMap.put("join_password", join_password);
		
		sessionTemplate.selectOne("myPageMapper.updatePassword",hMap);
		
	}

//==============���� �ı�================
	
	  //1. ���� �ۼ� ������ ����
	  public int getCommentDataCount(String join_id){
		  
		  int result = sessionTemplate.selectOne("myPageMapper.commentDataCount",join_id);
		  
		  return result;
	  
	  }
	  
	  //2. ���� �ۼ� ������ ���� 
	  public int getCommentNoDataCount(String join_id){
	  
		  int result = sessionTemplate.selectOne("myPageMapper.commentNoDataCount",join_id);
		  
		  return result;
	  
	  }
	  
	  //3. �����ı� ����Ʈ 
	  
	  public List<MyPageDTO> getCommentDataList(String join_id,int start,int end) {
	  
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  hMap.put("join_id", join_id);
		  hMap.put("start", start);
		  hMap.put("end", end);
		  
		  List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.commentDataList", hMap);
	  
	  return lists;
	  
	  }
	  
	  //3. �����ı� ���ۼ� ����Ʈ 
	  
	  public List<MyPageDTO> getCommentNoDataList(String join_id,int start,int end) {
	  
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  hMap.put("join_id", join_id);
		  hMap.put("start", start);
		  hMap.put("end", end);
		  
		  List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.commentNoDataList", hMap);
	  
	  return lists;
	  
	  }
	  
	  //4. ���� �ı� ����
	  public void commentInsert(MyPageDTO dto) {
		  
		  sessionTemplate.insert("myPageMapper.commentInsert", dto);
		  
		  sessionTemplate.update("myPageMapper.reviewCheck", dto.getReviewCheck_id());
		  
	  }
	  
	  //5. ���� id�� �ֱ�
	  public int commentMaxId() {
		  
		  int result = 0;
		  
		  result = sessionTemplate.selectOne("myPageMapper.commentMaxId");
		  
		  return result;
	  }
	  
	  //6. ���� point id�� �ֱ�
	  public int getPointMaxId() {
		  
		  int result = 0;
		  
		  result = sessionTemplate.selectOne("myPageMapper.pointMaxId");
		  
		  return result;
	  }
	  
	  //7. ���� point ����
	  public void getCommentPointInsert(MyPageDTO dto) {
		  
		  sessionTemplate.insert("myPageMapper.commentPointInsert", dto);
		  
		  sessionTemplate.update("myPageMapper.joinPointUpdate", dto);
		  
	  }
	  
	  //8. review �ۼ��� ������ �ҷ�����
	  public MyPageDTO getCommentNoData(String join_id,int orderList_id,int productOrder_id) {
			
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  hMap.put("join_id", join_id);
		  hMap.put("orderList_id", orderList_id);
		  hMap.put("productOrder_id", productOrder_id);
		    
		  MyPageDTO dto = sessionTemplate.selectOne("myPageMapper.commentNoData", hMap);		  
		  
		  return dto;
		  
	  }
	  
	  //9. join_point ���� �������� 
	  public int getJoinPoint(String join_id) {
		  
		  int join_point = sessionTemplate.selectOne("myPageMapper.joinPointSelect", join_id);
		  
		  return join_point;
	  }
	  
	//��ǰ�� ���� ����
	public int reviewCount(int product_id) {
		
		int result = 0;
		
		result = sessionTemplate.selectOne("myPageMapper.reviewCount",product_id);
		
		return result;
		
	}
	
	//��ǰ�� ����
	public List<MyPageDTO> reviewGrade(int product_id) {
		
		List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.reviewGrade", product_id);
		
		return lists;
		
	}
	
	//��ǰ ���� ����
	public void productGradeUpdate(int product_id,int product_like) {
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
	    hMap.put("product_id", product_id);
	    hMap.put("product_like", product_like);
	    
		sessionTemplate.update("myPageMapper.productGradeUpdate", hMap);

	}

	  //==============���� ����Ʈ================
	  //1. ���� ������ ����
	  public int getCouponDataCount(String join_id,int coupon_use) {
		  
		  int result = 0;
		  
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  
		  hMap.put("join_id", join_id);
		  hMap.put("coupon_use", coupon_use);
		  
		  result = sessionTemplate.selectOne("myPageMapper.couponData",hMap);
		  
		  return result;
	  }
	  
	  //2. ���� ������ ����Ʈ
	  public List<MyPageDTO> getCouponList(String join_id,int coupon_use,int start,int end) {
		  
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  hMap.put("join_id", join_id);
		  hMap.put("coupon_use", coupon_use);
		  hMap.put("start", start);
		  hMap.put("end", end);

		  List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.couponList", hMap);
		  
		  return lists;
	  }
	 
	  //==============point ����Ʈ================	  
	  //1. point ��ü ����
	  public int getPointDataCount(String join_id) {
		  
		  int result = 0;
		  
		  result = sessionTemplate.selectOne("myPageMapper.pointDataCount",join_id);
		  
		  return result;
	  }
	  
	  //2. point use ����
	  public int getPointUseDataCount(String join_id,int point_use) {
		  
		  int result = 0;
		  
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  
		  hMap.put("join_id", join_id);
		  hMap.put("point_use", point_use);
		  
		  result = sessionTemplate.selectOne("myPageMapper.pointUseDataCount",hMap);
		  
		  return result;
	  }
	  
	  //3. point ��ü ������ ����Ʈ
	  public List<MyPageDTO> getPointList(String join_id,int start,int end) {
		  
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  hMap.put("join_id", join_id);
		  hMap.put("start", start);
		  hMap.put("end", end);

		  List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.pointList", hMap);
		  
		  return lists;
	  }
	  
	  //4. point ��ü ������ ����Ʈ
	  public List<MyPageDTO> getPointUseList(String join_id,int point_use,int start,int end) {
		  
		  HashMap<String, Object> hMap = new HashMap<String, Object>();
		  hMap.put("join_id", join_id);
		  hMap.put("point_use", point_use);
		  hMap.put("start", start);
		  hMap.put("end", end);

		  List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.pointUseList", hMap);
		  
		  return lists;
	  }
	  
	  //==============ȸ�� ���� ����================	
		//1. ȸ�� ���� ��������
		public MyPageDTO getInfoSearchData(String join_id){
			
			MyPageDTO dto = sessionTemplate.selectOne("myPageMapper.infoSearchData",join_id);
			
			return dto;
			
		}
		//2. ȸ�� ���� ���� �ϱ�
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
		
		//==============���� ���� ��ǰ================	
		//1. ���� ã�� ������ ��ǰ ����Ʈ
		public List<MyPageDTO> getFrequencyList(String join_id,int start,int end){
			
			HashMap<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("join_id", join_id);
			hMap.put("start", start);
			hMap.put("end", end);
			
			List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.frequencyList", hMap);
			
			return lists;
			
		}
		//2. �ѱ��� ��ǰ ����(count)
		public int getProductCount(String join_id){
			
			int result = sessionTemplate.selectOne("myPageMapper.orderListCount", join_id);
			
			return result;
			
		}
		
		//==============��ǰ ���� ����=================
		//1. ��ǰ ���� ���� ����Ʈ
		public List<MyPageDTO> getProductQuestionList(String join_id, int start, int end) {
			
			HashMap<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("join_id", join_id);
			hMap.put("start", start);
			hMap.put("end", end);
			
			List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.productQuestionList", hMap);
			
			return lists;
			
		}
		
		//2. ���� ����
		public int getProductQuestionCount(String join_id){
			
			int result = sessionTemplate.selectOne("myPageMapper.productQuestionCount", join_id);
			
			return result;
			
		}
		
		//3. ��ǰ ���� ���� ����
		public void getProductQuestionDelete(String join_id, int productQuestion_id){
			
			HashMap<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("join_id", join_id);
			hMap.put("productQuestion_id", productQuestion_id);
			
			sessionTemplate.delete("myPageMapper.productQuestionDelete", hMap);
			
		}
		
		//4. ��ǰ ���� �亯 ����Ʈ
		public MyPageDTO getAnswerList(int productQuestion_id){
			
			MyPageDTO dto = sessionTemplate.selectOne("myPageMapper.productAnswerList",productQuestion_id);
			
			return dto;
			
		}
		
		//==============1:1 ���� ����=================
		//1. ��ǰ ���� ���� ����Ʈ
		public List<MyPageDTO> getQnaList(String join_id,int start,int end) {
			
			HashMap<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("join_id", join_id);
			hMap.put("start", start);
			hMap.put("end", end);
			
			List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.qnaList", hMap);
			
			return lists;
			
		}
		
		//2. 1:1 ���� ����
		public int getQnaCount(String join_id){

			int result = sessionTemplate.selectOne("myPageMapper.qnaCount", join_id);
			
			return result;
			
		}
		
		//3. 1:1 ���� ���� ����
		public void getQnaDelete(String join_id, int qna_id){
			
			HashMap<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("join_id", join_id);
			hMap.put("qna_id", qna_id);
			
			sessionTemplate.delete("myPageMapper.qnaDelete", hMap);
			
		}
		
		//4. qna id ���ϱ�
		public int qnaMaxNum(){

			int maxNum = 0;

			maxNum = sessionTemplate.selectOne("myPageMapper.qnaMaxNum");

			return maxNum;
		}
		
		//5. qna �ֱ�
		public void insertqna(MyPageDTO dto){

			sessionTemplate.insert("myPageMapper.insertqna",dto);
		}
		
		//�Ѹ��� ������ ���
		public MyPageDTO qnaGetReadData(int qna_id){

			MyPageDTO dto = sessionTemplate.selectOne("myPageMapper.qnaGetReadData",qna_id);

			return dto;

		}
		
		//===================�ֹ�/��� ����Ʈ=====================
		//1. �ֹ�/��� ����
		public int getOrderCount(String join_id) {
			
			int result = sessionTemplate.selectOne("myPageMapper.orderCount", join_id);
			
			return result;
			
		}
	
	    //2. �ֹ�/��� ����Ʈ
	    public List<MyPageDTO> getOrderList(String join_id,int start,int end) {
	  
	    HashMap<String, Object> hMap = new HashMap<String, Object>();
	    hMap.put("join_id", join_id);
	    hMap.put("start", start);
	    hMap.put("end", end);
	   
	    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.orderList", hMap);
	  
	    return lists;
	  
	    }
		
		//3. �ֹ� ���/ȯ�� ��û
		public void getOrderApply(String join_id,int orderList_id,int orderList_step) {
		
		    HashMap<String, Object> hMap = new HashMap<String, Object>();
		    hMap.put("join_id", join_id);
		    hMap.put("orderList_id", orderList_id);
		    hMap.put("orderList_step", orderList_step);
			
		    sessionTemplate.update("myPageMapper.orderApply", hMap);
			
		}
	    
		//===================�ֹ� ��� ����Ʈ=====================
		//1. �ֹ� ��� ����
		public int getCancelCount(String join_id) {
			
			int result = sessionTemplate.selectOne("myPageMapper.cancelCount", join_id);
			
			return result;
			
		}
	
	    //2. �ֹ� ��� ����Ʈ
	    public List<MyPageDTO> getCancelList(String join_id,int start,int end) {
	  
	    HashMap<String, Object> hMap = new HashMap<String, Object>();
	    hMap.put("join_id", join_id);
	    hMap.put("start", start);
	    hMap.put("end", end);
	   
	    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.cancelList", hMap);
	  
	    return lists;
	  
	    }
	    
		//===================��ȯ/ȯ�� ����Ʈ=====================
		//1. ��ȯ/ȯ�� ����
		public int getRefundCount(String join_id) {
			
			int result = sessionTemplate.selectOne("myPageMapper.refundCount", join_id);
			
			return result;
			
		}
	
	    //2. ��ȯ/ȯ�� ����Ʈ
	    public List<MyPageDTO> getRefundList(String join_id,int start,int end) {
	  
	    HashMap<String, Object> hMap = new HashMap<String, Object>();
	    hMap.put("join_id", join_id);
	    hMap.put("start", start);
	    hMap.put("end", end);
	   
	    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.refundList", hMap);
	  
	    return lists;
	  
	    }
	    
		//===================�� ����Ʈ=====================
		//1. �� ����
		public int getZzimCount(String join_id) {
			
			int result = sessionTemplate.selectOne("myPageMapper.zzimCount", join_id);
			
			return result;
			
		}
	    //2. �� ����Ʈ
	    public List<MyPageDTO> getZzimList(String join_id,int start,int end) {
	  
	    HashMap<String, Object> hMap = new HashMap<String, Object>();
	    hMap.put("join_id", join_id);
	    hMap.put("start", start);
	    hMap.put("end", end);
	   
	    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.zzimList", hMap);
	  
	    return lists;
	  
	    }
	    //3. �� ����
	    public void getZzimDelete(String join_id,int product_id) {
	    	
		    HashMap<String, Object> hMap = new HashMap<String, Object>();
		    hMap.put("join_id", join_id);
		    hMap.put("product_id", product_id);
	    	
	    	sessionTemplate.delete("myPageMapper.zzimDelete", hMap);
	    	
	    } 
	    
	    //4. ��ٱ��� ������
	    public void getInsertCart(MyPageDTO dto) {
	    	
	    	sessionTemplate.insert("myPageMapper.insertCart", dto);
	    	
	    }
	 
		//===================ȯ�� ����=====================
	    //1. ȯ�� ���� ����Ʈ
	    public List<MyPageDTO> getRefundPossibleList(String join_id,int start,int end,int orderList_step) {
	  	  
		    HashMap<String, Object> hMap = new HashMap<String, Object>();
		    hMap.put("join_id", join_id);
		    hMap.put("start", start);
		    hMap.put("end", end);
		    hMap.put("orderList_step", orderList_step);
		   
		    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.refundPossibleList", hMap);
		  
		    return lists;
		  
		}
	    
	    //2. ȯ�� ���� ����
		public int getRefundPossibleCount(String join_id,int orderList_step) {
			
		    HashMap<String, Object> hMap = new HashMap<String, Object>();
		    hMap.put("join_id", join_id);
		    hMap.put("orderList_step", orderList_step);
			
			int result = sessionTemplate.selectOne("myPageMapper.refundPossibleCount", hMap);
			
			return result;
			
		}
		
	    //3. ȯ�� �Ϸ�/��ǰ ����Ʈ
	    public List<MyPageDTO> getRefundProductList(String join_id,int start,int end) {
	  	  
		    HashMap<String, Object> hMap = new HashMap<String, Object>();
		    hMap.put("join_id", join_id);
		    hMap.put("start", start);
		    hMap.put("end", end);
		   
		    List<MyPageDTO> lists = sessionTemplate.selectList("myPageMapper.refundProductList", hMap);
		  
		    return lists;
		  
		}
	    
	    //4. ȯ�� ���� ����
		public int getRefundProductCount(String join_id) {
			
			int result = sessionTemplate.selectOne("myPageMapper.refundProductCount", join_id);
			
			return result;
			
		}
		
		//5. ȯ�� ��û�� orderList ���� �ҷ�����
		public MyPageDTO getRefundOrderData(String join_id,int orderList_id) {
			
		    HashMap<String, Object> hMap = new HashMap<String, Object>();
		    hMap.put("join_id", join_id);
		    hMap.put("orderList_id", orderList_id);
		    
			MyPageDTO dto = sessionTemplate.selectOne("myPageMapper.refundOrderData", hMap);
			
			return dto;
		    
		}
		
		//6. ȯ�� ���̺� ����
		public void getRefundInsert(MyPageDTO dto) {
			
			sessionTemplate.insert("myPageMapper.refundDataInsert", dto);		
			
			
		}
	    
}
