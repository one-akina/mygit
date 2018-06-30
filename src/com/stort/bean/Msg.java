package com.stort.bean;

import java.util.HashMap;
import java.util.Map;



public class Msg {
	//״̬��	0-�ɹ� 1-ʧ��
		private int code;
		//��ʾ��Ϣ
		private String msg;
		//�û�Ҫ���ظ������������
		private Map<String, Object> extend=new HashMap<String, Object>();
		
		public static Msg success() {
			Msg result = new Msg();
			result.setCode(0);
			result.setMsg("����ɹ�");
			return result;
		}
		
		public static Msg fail() {
			Msg result = new Msg();
			result.setCode(1);
			result.setMsg("����ʧ��");
			return result;
		}
		
		public Msg add(String key,Object value) {
			this.getExtend().put(key,value);
			return this;
		}
		
		public int getCode() {
			return code;
		}
		public void setCode(int code) {
			this.code = code;
		}
		public String getMsg() {
			return msg;
		}
		public void setMsg(String msg) {
			this.msg = msg;
		}
		public Map<String, Object> getExtend() {
			return extend;
		}
		public void setExtend(Map<String, Object> extend) {
			this.extend = extend;
		}
}
