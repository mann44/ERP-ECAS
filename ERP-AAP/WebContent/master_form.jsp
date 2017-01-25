<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Master Form</title>
</head>
<body>
	<div style="background-color:#335A85; width:1360px; height:60px;">
		<div style="width:200px; height:400px;color:#ffffff;font-size:30px;">Create User</div>
	</div>
	<div style="width:1360px">
		     <form action="#" method="post" name="m_form">
		     <center><h1>Add New User</h1></center>
		     	<table align="center" style="font-size:20px">
                            <tr>
                            <td>Department</td>
				<td>:</td>
                            <td>
                            						<select>
                            							<option>Select Department</option>
                            							<option>HR</option>
                            							<option>Purchase</option>
                            							<option>Production</option>
                            							<option>Sales</option>
                            						</select>
                            </td>
                            </tr>
                            <tr>
                            	<td>User Name</td>
								<td>:</td>
                            	<td><input type="text" id="user_id" name="user_name"/></td>
                            </tr>
                            <tr>
                            	<td>Full Name</td>
				<td>:</td>
                            	<td><input type="text" id="full_id" name="full_name" /></td>
                            </tr>
                            <tr>
                            	<td>Gender</td>
				<td>:</td>
                            	<td><input type="radio" id="m_id" name="gen_name" value="male" />Male
                            		<input type="radio" id="f_id" name="gen_name" value="female" />Female
                            	</td>
                            </tr>
                            <tr>
                            	<td>Birth Date</td>
				<td>:</td>
                            	<td>
                            		<select>
                            			<option selected="selected">YYYY</option>
                            			<option>1995</option>
                            			<option>1994</option>
                            			<option>1993</option>
                            			<option>1992</option>
                            			<option>1991</option>
                            			<option>1990</option>
                            			<option>1989</option>
                            			<option>1988</option>
                            			<option>1987</option>
                            			<option>1986</option>
                            			<option>1985</option>
                            			<option>1984</option>
                            			<option>1983</option>
                            			<option>1982</option>
                            			<option>1981</option>
                            			<option>1980</option>
                            			<option>1979</option>
                            			<option>1978</option>
                            			<option>1977</option>
                            			<option>1976</option>
                            			<option>1975</option>
                            		</select>
                            		<select>	
                            			<option selected="selected">MM</option>
                            			<option>01</option>
                            			<option>02</option>
                            			<option>03</option>
                            			<option>04</option>
                            			<option>05</option>
                            			<option>06</option>
                            			<option>07</option>
                            			<option>08</option>
                            			<option>09</option>
                            			<option>10</option>
                            			<option>11</option>
                            			<option>12</option>
                            		</select>
                            		<select>
                            			<option selected="selected">DD</option>
                            			<option>01</option>
                            			<option>02</option>
                            			<option>03</option>
                            			<option>04</option>
                            			<option>05</option>
                            			<option>06</option>
                            			<option>07</option>
                            			<option>08</option>
                            			<option>09</option>
                            			<option>10</option>
                            			<option>11</option>
                            			<option>12</option>
                            			<option>13</option>
                            			<option>14</option>
                            			<option>15</option>
                            			<option>16</option>
                            			<option>17</option>
                            			<option>18</option>
                            			<option>19</option>
                            			<option>20</option>
                            			<option>21</option>
                            			<option>22</option>
                            			<option>23</option>
                            			<option>24</option>
                            			<option>25</option>
                            			<option>26</option>
                            			<option>27</option>
                            			<option>28</option>
                            			<option>29</option>
                            			<option>30</option>
                            			<option>31</option>
                            		</select>
                            	</td>
                            </tr>
                            <tr>
                            	<td>Address</td>
				<td>:</td>
                            	<td><textarea rows="3" cols="20"></textarea></td>
                            </tr>
				<tr>
					<td>Country</td>
					<td>:</td>
					<td>
						<select>
							<option>India</option>
							<option>USA</option>
							<option>Canada</option>
						</select>
						<input type="button" value="Add Country" name="country_b" /></td>
				</tr>
				<tr>
					<td>State</td>
					<td>:</td>
					<td>
						<select>
							<option>Gujrat</option>
							<option>Maharashtra</option>
						</select>
						<input type="button" value="Add State" name="state_b" /></td>
				</tr>
				<tr>
					<td>city</td>
					<td>:</td>
					<td>
						<select>
							<option>Ahmedabad</option>
							<option>Surat</option>
							<option>Gandhinagar</option>
						</select>
						<input type="button" value="Add City" name="city_b" /></td>
				</tr>
				 <tr>
                            	<td>Email</td>
								<td>:</td>
                            	<td><input type="text" id="email_id" name="email_name"/></td>
                            </tr>
                             <tr>
                            	<td>Contact No</td>
								<td>:</td>
                            	<td><input type="text" id="contact_id" name="contact_name"/></td>
                            </tr>
                            <tr>
                            	<td>Upload Image</td>
								<td>:</td>
                            	<td><input type="button" id="img_id" name="img_name" value="choose file" /></td>
                            </tr>
                            	<tr>
                            		<td>Note</td>
                            		<td>:</td>
                            		<td><textarea rows="4" cols="20"></textarea></td>
                            	</tr>
                            	 
                            <tr>
                            	<td></td>
                            	<td></td>
                            	<td><input type="submit" name="add_user" value="ADD USER" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	<input type="button" name="clear_b" value="CLEAR" />
                            	</td>
                            </tr>
                          	 </table>
			 </form>
	</div>

</body>
</html>