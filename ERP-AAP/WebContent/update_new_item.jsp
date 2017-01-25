<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 

    </head>
    <body style="background-color:#272727">
        <div class="fsv-rightmenu-bottom" style="border:0px solid black">
            <h2 style="font:20px/1.5 'PTSansRegular', Arial, Helvetica, sans-serif;

                display: block;
                color: aqua !important;
                text-shadow: 0 0 6px rgba(197, 213, 42, 0.5);">Please Enter Updated Details for Item</h2>
            <hr/>
            <form class="form-1" id="formID" method="post" action="updateNewItem">
            <input type="hidden" name="id" value=""> 
                <table class="fsv-table" style="font:13px/1.5 'PTSansRegular', Arial, Helvetica, sans-serif;
                       display: block;
                       color: #CCCCCC !important;
                       text-shadow: 0 0 6px rgba(197, 213, 42, 0.5);">
                   
                    <tr>
                        <td width="150px"><label>Material Category:</label></td>
                        <td><select style="width: 100%; margin-left: 0px;border-radius:2px; color: #767676; height: 25px;" id="mtr" name="material"onchange="showState(this.value)">
                                <option value=""> select Material Category</option>    
                            </select></td>
                    </tr>
                    <tr id="supplier_name">
                        <td width="150px"><label>Supplier Name:</label></td>
                   <td><select name='supplier_name' style="width: 100%;border-radius:2px; color: #767676; margin-left: 0px; height: 25px;" >  
                            <option value='-1'></option>  
                        </select>  
                    </td>
                    </tr>
                    
                    <tr>
                        <td width="150px"><label>Item Name:</label></td>
                        <td>  <select style="width: 100%; margin-left: 0px; height: 25px;border-radius:2px;color: #767676;" onchange="getItemDetail(this.value);"  id="item_name" name="item_id">
                            <option value="">--- select Item Name ---</option>    
                        </select></td>
                    </tr>
                    <tr id="resultDetail">
                    <td colspan="2">
                     <input name="item_name" type="hidden" id="item_name" style="width: 50%;  height: 22px; margin-left: 21px;"/>
                    </td>
                    </tr>
                    <tr>
					<td width="150px"><label>Item Remarks:</label></td>
					<td><textarea name="remarks" class="expand" id="remarks"
							style="width: 200%; height: 50px; color: #767676;"></textarea></td>
				</tr>
                    

                    <tr  style="padding-top: 10px;">
                        <td>&nbsp;</td>
                        <td> <input type="submit" value="Update" style=" 
                                    border: medium none;
                                    border-radius: 4px 4px 4px 4px;
                                    height: 25px;
                                    width: 80px;
                                    color: #069;
                                    cursor: pointer;
                                    display: block;
                                    float: left;
                                    font-family: cursive;
                                    text-transform: capitalize;
                                    background-color: aqua ; "/>
                        </td>
                    </tr>		
                </table>
            </form> 
        </div>
       
    </body>
</html>
