package com.chan.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.chan.dto.AdminDTO;
import com.chan.dto.ProductDTO;

public class AdminDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate (SqlSessionTemplate sessionTemplate)throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	//===========================refund====================================
	public int getRefundCount(){

		int result = sessionTemplate.selectOne("adminMapper.getRefundCount");		
		
		return result;					
		
	}
	
	public void insertRefundPoint(String join_id, int point_score) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("point_score", point_score);
		params.put("join_id", join_id);
		
		sessionTemplate.insert("adminMapper.insertRefundPoint",params);
		
	}
	
	public int selectRefundPoint(int orderList_id) {
		
		int result = 0;
		
		result = sessionTemplate.selectOne("adminMapper.selectRefundPoint",orderList_id);
		
		return result;
		
	}
	
	public List<AdminDTO> getRefundList(int start,int end){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);

		List<AdminDTO> lists = sessionTemplate.selectList("adminMapper.getRefundList",params);
		
		return lists;
		
	}
	
	
	public int getRefundDetailCount(int orderList_id){

		int result = sessionTemplate.selectOne("adminMapper.getRefundDetailCount",orderList_id);		
		
		return result;					
		
	}
	
	
	
	public List<AdminDTO> getDetailList(int start,int end,int orderList_id){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("orderList_id", orderList_id);

		
		List<AdminDTO> lists = sessionTemplate.selectList("adminMapper.getDetailList",params);
		
		return lists;
		
	}
	
	public AdminDTO getRefundInfo(int orderList_id) {
		
		AdminDTO dto = sessionTemplate.selectOne("adminMapper.getRefundInfo",orderList_id);
		
		return dto;
		
	}
	
	
	public void changeRefundState(int orderList_id) {		
		
		sessionTemplate.update("adminMapper.changeRefundState",orderList_id);
		
	}
	
	public AdminDTO checkInfo(int orderList_id) {	
		
		AdminDTO dto = sessionTemplate.selectOne("adminMapper.checkInfo",orderList_id);
		
		return dto;
	}
	
	public void returnCoupon(int orderList_id) {	
		
		sessionTemplate.update("adminMapper.returnCoupon",orderList_id);
		
	}
	
	public void addRefundPoint(int orderList_id,String join_id) {	
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("orderList_id", orderList_id);
		params.put("join_id", join_id);
		
		sessionTemplate.update("adminMapper.addRefundPoint",params);			
	
	}
	
	public void changeProductOrderState(int orderList_id) {	
		
		sessionTemplate.update("adminMapper.changeProductOrderState",orderList_id);		
		
	}
	
	public void refuseRefundState(int orderList_id) {	
		
		sessionTemplate.update("adminMapper.refuseRefundState",orderList_id);
		
	}
	
	public void refuseProductOrderState(int orderList_id) {	
		
		sessionTemplate.update("adminMapper.refuseProductOrderState",orderList_id);
	}
	
	public void permitProductStateAll() {
	
		sessionTemplate.update("adminMapper.permitProductStateAll");
	}
	
	public void permitRefundAll() {
		
		sessionTemplate.update("adminMapper.permitRefundAll");
	}
	
	
	//=========================ȸ������=========================
	//1. ȸ�� ��ü������
	public List<AdminDTO> joinList(int start, int end, String searchKey, String searchValue){
		
		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("start", start);
		params.put("end", end);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
			
		List<AdminDTO> lists = sessionTemplate.selectList("adminMapper.joinList",params);

		return lists;
	}
	
	//2. ȸ�� ��ü ��
	public int getJoinDataCount(String searchKey,String searchValue){
		
		int result = 0;
		
		HashMap<String, Object> params = new HashMap<String, Object>();
	
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		result = sessionTemplate.selectOne("adminMapper.joinDataCount",params);
		
		return result;
		
	}

	//3. ȸ�� 1�� ����
	public AdminDTO joinReadData(String join_id){
		
		AdminDTO dto = sessionTemplate.selectOne("adminMapper.joinReadData",join_id);
		
		return dto;
		
	}
	
	//4.ȸ�� ���� ����
	public void joinDeleteData(String join_id) {
		sessionTemplate.delete("adminMapper.joinDeleteData",join_id);
	}
	
	//5. ȸ�� ���� ���� �ϱ�
	public void update(AdminDTO dto){		
		
		sessionTemplate.update("adminMapper.update", dto);
		
	}

	//====================product ����==================
	public void productInsertData(ProductDTO dto){
		
		sessionTemplate.insert("adminMapper.insertData",dto);
		
	}
	
	public void productDetailInsertData(ProductDTO dto){
		
		sessionTemplate.insert("adminMapper.detailInsertData",dto);
		
	}
	
	//====================���� ����=====================
	public int getIdCount(String search_join_id){

		int result = sessionTemplate.selectOne("adminMapper.getIdCount",search_join_id);
		
		return result;
		
		
	}
	
	public List<String> getIdList(int start, int end,String search_join_id){


		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("search_join_id", search_join_id);
		
		List<String> lists = sessionTemplate.selectList("adminMapper.getIdList",params);
				
		return lists;		
		
	}
	
	//======================����=====================
	//���� -> ����
	
	public int couponMaxNum() {
		
		int couponMaxNum = 0;
		
		couponMaxNum = sessionTemplate.selectOne("adminMapper.couponMaxNum");
		
		return couponMaxNum;
		
		
	}
	
	public void insertCoupon(AdminDTO dto){
		
		sessionTemplate.insert("adminMapper.insertCoupon",dto);
	
	}
	
	//���� -> ����
	
	public int getCouponCount(String search_join_id){
	
		int result = sessionTemplate.selectOne("adminMapper.getCouponCount",search_join_id);
		
		return result;		
		
	}
		
	public List<AdminDTO> getCouponList(int start, int end,String search_join_id){
		

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("search_join_id", search_join_id);
			
		List<AdminDTO> lists = sessionTemplate.selectList("adminMapper.getCouponList",params);
			
		return lists;
			
	}
	
	public void deleteCoupon(int coupon_id){
		
		sessionTemplate.delete("adminMapper.deleteCoupon",coupon_id);
		
		
	}
	
	//���� -> ��ȿ�Ⱓ ������ ����
	public int getLastCouponCount(){
		
		int result = sessionTemplate.selectOne("adminMapper.getLastCouponCount");		
		return result;			
		
	}
	
	public List<AdminDTO> getLastCouponList(int start, int end){		

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);		
			
		List<AdminDTO> lists = sessionTemplate.selectList("adminMapper.getLastCouponList",params);
			
		return lists;
			
	}
		
	public void deleteAllCoupon(){
		
		sessionTemplate.delete("adminMapper.deleteAllCoupon");
		
		
	}
	
	//======================��ǰ����=====================
	public List<AdminDTO> adminProductQnaList(int start,int end){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);

		List<AdminDTO> lists = sessionTemplate.selectList("adminMapper.adminProductQnaList",params);
		
		return lists;
		
	}
	
	public int adminProductQnaCount() {
		
		int result = 0;
		
		result = sessionTemplate.selectOne("adminMapper.adminProductQnaDataCount");
		
		return result;
		
	}
	
	public AdminDTO adminProductQnaData(int productQuestion_id){
		
		AdminDTO dto = sessionTemplate.selectOne("adminMapper.adminProductQnaData",productQuestion_id);
		
		return dto;
		
	}
	
	public int getMaxProductAnswerId(){
		
		int maxId = sessionTemplate.selectOne("adminMapper.maxProductAnswerId");
		
		return maxId;
		
	}
	
	public void productAnswerInsertData(AdminDTO dto){
		
		sessionTemplate.insert("adminMapper.productAnswerInsertData",dto);
		
	}
	
	public void productQnaCompete(int productQuestion_id) {
		
		sessionTemplate.update("adminMapper.productQnaCompete",productQuestion_id);
		
	}
	
	//======================����Ʈ ����=====================
	public void bestReviewInsertData(ProductDTO dto){
		
		sessionTemplate.insert("product.bestReviewInsertData",dto);
		
	}
	
	public void bestReviewPointInsert(String join_id) {
		
		sessionTemplate.insert("adminMapper.bestReviewPointInsertData", join_id);
		sessionTemplate.update("adminMapper.userPointUpdate",join_id);
		
	}
	
	//======================�ֹ�����=====================
	public int getOrderListCount() {
		
		int result = sessionTemplate.selectOne("adminMapper.orderListCount");
		
		return result;
		
	}
	
	public List<AdminDTO> getOrderListCheck(int start,int end) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		
		List<AdminDTO> lists = sessionTemplate.selectList("adminMapper.orderListCheck",params);
		
		return lists;
		
	}
	
	public int getUpdateStep(AdminDTO dto) {
		
		int result = sessionTemplate.update("adminMapper.updateStep",dto);
		
		return result;
		
	}
	
	//========================1:1 ����========================================
	//1. ��ǰ ���� ���� ����Ʈ
	public List<AdminDTO> getQnaList(int start,int end) {
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("start", start);
		hMap.put("end", end);
		
		List<AdminDTO> lists = sessionTemplate.selectList("adminMapper.qnaList", hMap);
		
		return lists;
		
	}
	
	//2. 1:1 ���� ����
	public int getQnaCount(){

		int result = sessionTemplate.selectOne("adminMapper.qnaCount");
		
		return result;
		
	}
	
	//3. 1:1 �亯 �Է�
	public void insertQnaReply(AdminDTO dto){

		sessionTemplate.update("adminMapper.qnaReply",dto);
	}
	
	//4. 1:1 ���� 1�� ������ ��������
	public AdminDTO adminQnaData(int qna_id){
		
		AdminDTO dto = sessionTemplate.selectOne("adminMapper.adminQnaData",qna_id);
		
		return dto;
		
	}
	
	//=============================��ǰ��õ����=================================
	public List<AdminDTO> adminProductRecommandLists(int start,int end){
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("start", start);
		param.put("end", end);
		
		List<AdminDTO> lists = sessionTemplate.selectList("adminMapper.productRecommandLists",param);
		
		return lists;
		
	}
	
	public int adminProductRecommandCount(){
	
		int result = sessionTemplate.selectOne("adminMapper.productRecommandCount");
		
		return result;
		
	}
	
	public void adminProductRecommandConfirm(String[] selectRecommand_id){
		
		for(int i=0;i<selectRecommand_id.length;i++) {
			
			int recommand_id = Integer.parseInt(selectRecommand_id[i]);
			
			sessionTemplate.update("adminMapper.productRecommandUpdate",recommand_id);
			
		}
		
	}
	
	public void adminProductRecommandSelect(String join_id,int productRecommand_id) {
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("join_id", join_id);
		param.put("productRecommand_id", productRecommand_id);
		
		sessionTemplate.update("adminMapper.productRecommandSelect",param);
		
	}
	
	public void recommandSelectPointInsert(String join_id) {
		
		sessionTemplate.insert("adminMapper.recommandPoint",join_id);
		sessionTemplate.update("adminMapper.recommandPointUpdate",join_id);
		
	}
}

