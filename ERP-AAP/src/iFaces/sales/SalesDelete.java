package iFaces.sales;

public interface SalesDelete {
	public boolean deleteLead(int d_id);
	public boolean DeleteScheduleCall(int d_id);
	public boolean deleteLoggedCall(int d_id);
	public boolean deleteMeeting(int m_id);
	public boolean deleteCustomer(int c_id);

}
