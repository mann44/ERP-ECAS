package iFaces.sales;

import bean.sales.Customer;
import bean.sales.Lead;
import bean.sales.Logged_Call;
import bean.sales.Meeting;
import bean.sales.Scheduled_Call;

public interface SalesUpdate {
	public boolean updateCustomer(Customer c);
	public boolean updateScheduledCall(Scheduled_Call sc);
	public boolean updateLead(Lead l);
	public boolean updateLoggedCall(Logged_Call l);
	public boolean updateMeeting(Meeting m);

}
