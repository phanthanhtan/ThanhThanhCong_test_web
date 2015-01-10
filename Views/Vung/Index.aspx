<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    TTCS - Quản lý vùng
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<center>
    <h2>Quản lý vùng</h2>
    <a href="/Vung/Them">Thêm vùng</a><br /><br />
    <table cellspacing="0" cellpadding="0" border="1" style="text-align:center">
        <tr>
            <td>Mã vùng</td>
            <td>Tên vùng</td>
            <td>Chức năng</td>
        </tr>
        <%  string ok = Convert.ToString(ViewBag.OK);
            switch (ok)
            {
                case "Index1"://có list vùng
                    foreach (ThanhThanhCong_test_web.Models.Vung v in (List<ThanhThanhCong_test_web.Models.Vung>)ViewBag.ListVung)
                    {%>
                        <tr>
                            <td><%=v.MaVung %></td>
                            <td><%=v.TenVung %></td>
                            <td><a href="/Vung/Sua/<%=v.MaVung %>" title="Sửa">Sửa</a>
                                <a href="/Vung/Xoa/<%=v.MaVung %>" title="Xóa" onclick="return confirm('Bạn chắc chắn muốn xóa?!?')">Xóa</a>
                            </td>
                        </tr>
                    <%}
                    break;
                case "Index2"://chưa có vùng nào/list vùng null
                    %>
                        <tr>
                            <td colspan="2">Chưa có dữ liệu về vùng.</td>
                        </tr>
                    <%
                    break;
                default://lỗi
                    %>
                        <tr>
                            <td colspan="2">Hệ thống đang bận. Vui lòng quay lại sau!</td>
                        </tr>
                    <%
                    break;
            }
        %>
    </table>
</center>
<%  string index_Xoa = Convert.ToString(ViewBag.Index_Xoa);
    switch (index_Xoa)
    {
        case "Xoa_Exist":
            %>
                <script>alert('Mã vùng được sử dụng trong hợp đồng. Vui lòng kiểm tra lại!');</script>
            <%
            break;
        case "XoaOk":
            %>
                <script>alert('Xóa thành công!');</script>
            <%
            break;
        case "XoaError":
            %>
                <script>alert('Có lỗi xảy ra trong quá trình xóa. Vui lòng thao tác lại!');</script>
            <%
            break;
        case "XoaNull":
            %>
                <script>alert('Mã vùng không có trong cơ sở dữ liệu. Vui lòng kiểm tra lại!');</script>
            <%
            break;
        default:
            break;
    }
%>
</asp:Content>
