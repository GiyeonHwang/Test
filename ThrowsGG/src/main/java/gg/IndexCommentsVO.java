package gg;

public class IndexCommentsVO {
	private int indexComments;
	private String comment;
	private String desertionNo;
	private int classNum;
	private int groupNum;
	private int sequence;
	private String userID;

	public IndexCommentsVO(int indexComments, String comment, String desertionNo, int classNum, int groupNum,
			int sequence, String userID) {
		super();
		this.indexComments = indexComments;
		this.comment = comment;
		this.desertionNo = desertionNo;
		this.classNum = classNum;
		this.groupNum = groupNum;
		this.sequence = sequence;
		this.userID = userID;
	}

	public int getIndexComments() {
		return indexComments;
	}

	public void setIndexComments(int indexComments) {
		this.indexComments = indexComments;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getDesertionNo() {
		return desertionNo;
	}

	public void setDesertionNo(String desertionNo) {
		this.desertionNo = desertionNo;
	}

	public int getClassNum() {
		return classNum;
	}

	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}

	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	@Override
	public String toString() {
		return "indexCommmentsVO [indexComments=" + indexComments + ", comment=" + comment + ", desertionNo="
				+ desertionNo + ", classNum=" + classNum + ", groupNum=" + groupNum + ", sequence=" + sequence
				+ ", userID=" + userID + "]";
	}

}
