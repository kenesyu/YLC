<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JQFG_IMG.aspx.cs" Inherits="YLCWeb.Admin.JQFG_IMG" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="500px">
            <asp:Repeater ID="repList" runat="server" onitemcommand="repList_ItemCommand">
            <ItemTemplate>
                <tr>
                    <td width="80%"><img width="150px" height="100px" src="/upload/<%# Eval("NewName") %>" /></td>
                    <td><asp:Button ID="Button2" runat="server" class="btn btn-danger btn-xs" OnClientClick="if(!confirm('确认删除？')) return false;" Text="删除" CommandArgument='<%#Eval("ID") %>' CommandName="Delete" /></td>
                </tr>
            </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
    </form>
</body>
</html>
