<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    TTCS - Quản lý vùng
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% string action = Convert.ToString(ViewBag.Action);
       string _action = "Thêm";
       ThanhThanhCong_test_web.Models.Vung v = null;
       if (action == "Sua")
       {
           _action = "Sửa";
           v = (ThanhThanhCong_test_web.Models.Vung)ViewBag.Vung;
       }
       int check = 1;
       string ok = Convert.ToString(ViewBag.Ok);
       switch (ok)
       {
           case "SuaNull":
                check = 0;
                %>
                <script>alert('Mã vùng cần sửa không có trong cơ sở dữ liệu. Vui lòng kiểm tra lại!');</script>
                <%
               break;
           case "SuaGetDataError":
                check = 0;
                %>
                <script>alert('Có lỗi xảy ra trong quá trình lấy dữ liệu. Vui lòng thao tác lại!');</script>
                <%
               break;
           case "ThemOk":
                %>
                <script>alert('Thêm thành công!');</script>
                <%
               break;
            case "ThemError":
                %>
                <script>alert('Có lỗi xảy ra trong quá trình thêm. Vui lòng thao tác lại!');</script>
                <%
                break;
            case "SuaOk":
                %>
                <script>alert('Sửa thành công!');</script>
                <%
                break;
            case "SuaError":
                %>
                <script>alert('Có lỗi xảy ra trong quá trình sửa. Vui lòng thao tác lại!');</script>
                <%
                break;
            default:
                break;
       }
    if(check == 1)
    {%>
        <center>
            <h2>Quản lý vùng - <%=_action %></h2>
            <table>
            <form action="/Vung/<%=action %>Form" method="post" name="FVung" id="FVung" enctype ="multipart/form-data" onsubmit ="return CheckForm()">
                <tr>
                    <td>Mã vùng: </td>
                    <td><input id="txtMaVung" name="txtMaVung" maxlength="50" <%if (action == "Sua") {%> value="<%=v.MaVung %>" readonly ="true" <%} %>/></td>
                </tr>
                <tr>
                    <td>Tên vùng: </td>
                    <td><input id="txtTenVung" name="txtTenVung" maxlength="50" <%if (action == "Sua") {%> value="<%=v.TenVung %>" <%} %>/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" style="width:50px" <%if (action == "Sua"){%> value="Sửa"<%}else{%>value="Thêm" <%}%>/></td>
                </tr>
            </form>
                <tr>
                    <%  string link = action;
                        if (action == "Sua")
                            link = link + "/" + v.MaVung;
                    %>
                    <td></td><td><a href="/Vung/<%=link %>"><button style="width:50px">Hủy</button></a></td>
                </tr>
            </table>
        </center>
        <script>
            function CheckForm() {
                if (txtMaVung.value == "" || txtMaVung.value == null) {
                    alert("Chưa nhập mã vùng.");
                    txtMaVung.focus();
                    return false;
                }
                if (txtTenVung.value == "" || txtTenVung.value == null) {
                    alert("Chưa nhập tên vùng.");
                    txtTenVung.focus();
                    return false;
                }
            }
        </script>
    <%}
    else
    {%>
        <script>window.location = "/Vung/Index";</script>
    <%}%>
</asp:Content>
