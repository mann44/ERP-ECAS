package iFaces.sales;

import java.util.ArrayList;

import bean.sales.Company;
import bean.sales.Customer;
import bean.sales.Lead;
import bean.sales.Logged_Call;
import bean.sales.Meeting;
import bean.sales.Scheduled_Call;
import bean.sales.Title;

public interface SalesDao {
	public ArrayList<Title> checkTitle(Title t);
	public ArrayList<Customer> viewCustomer(Customer c);
	public ArrayList<Customer> CustomerInfo(int id);
	public String getTitle(int t_id);
	public ArrayList<Company> getCompany(int id);
	public ArrayList<Lead> viewLeads(Lead l);
	public ArrayList<Lead> LeadInfo(int l_id);
	public ArrayList<Scheduled_Call> viewScheduleCalls(Scheduled_Call sc);
	public ArrayList<Scheduled_Call> viewScheduleDetail(int sc_id);
	public String getPhoneCategoty(int cat_id);
	public String getPriority(int p_id);
	public ArrayList<Logged_Call> viewLoggedCall(Logged_Call l);
	public String getCategory(int c_id);
	public ArrayList<Logged_Call> viewDetailLoggedcall(int l_id);
	public ArrayList<Meeting> viewMeetings(Meeting mt);
	public ArrayList<Meeting> MeetingInfo(int m_id);
}
