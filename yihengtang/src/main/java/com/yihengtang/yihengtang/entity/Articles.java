package com.yihengtang.yihengtang.entity;

/**
 * 首页文章实体类
 * @author Administrator
 *
 */
public class Articles {

	/**
	 * id主键
	 */
	private int id;
	/**
	 * 标题
	 */
    private String  details;
			/**
			 * 文章发布时间
			 */
    private String time;
    
    /**
     * 文章作者
     */
    private String author;
    
			/**
			 * 点赞数量
			 */
    
    private String fabulousInt;
			/**
			 * 浏览数据量
			 */
	private int  browseInt ;
			/**
			 * 图片地址
			 */
	
    private String  img;
    /**
     * 文章类型
     */
    private String type;
    
    private String text;
    
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getFabulousInt() {
		return fabulousInt;
	}
	public void setFabulousInt(String fabulousInt) {
		this.fabulousInt = fabulousInt;
	}
	public int getBrowseInt() {
		return browseInt;
	}
	public void setBrowseInt(int browseInt) {
		this.browseInt = browseInt;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
    
}
