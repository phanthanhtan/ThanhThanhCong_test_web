<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    TTCS - Danh sách hợp đồng thuê đất
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<center>
    <h2>Danh sách hợp đồng thuê đất</h2>
    <a href="/HopDong/Them">Tạo mới hợp đồng</a><br /><br />
    <table cellspacing="0" cellpadding="0" border="1" style="text-align:center">
        <tr>
            <td style="width:100px">Mã hợp đồng</td>
            <td style="width:200px">Bên cho thuê</td>
            <td style="width:200px">Bên thuê đất</td>
            <td style="width:50px">Số vụ</td>
            <td style="width:50px">Từ vụ</td>
            <td style="width:100px">Đơn giá thuê</td>
            <td style="width:100px">Tổng tiền</td>
            <td style="width:100px">Ứng trước</td>
            <td>Chức năng</td>
        </tr>
        <%  string ok = Convert.ToString(ViewBag.OK);
            switch (ok)
            {
                case "Index1"://có list vùng
                    foreach (ThanhThanhCong_test_web.Models.HopDong hd in (List<ThanhThanhCong_test_web.Models.HopDong>)ViewBag.ListHopDong)
                    {%>
                        <tr>
                            <td><%=hd.MaHopDong %></td>
                            <td><%=hd.HoTen_A1 %></td>
                            <td><%=hd.HoTen_B1 %></td>
                            <td><%=hd.SoVu %></td>
                            <td><%=hd.TuVu %></td>
                            <td style="text-align:right"><%=hd.DonGiaThue %></td>
                            <td style="text-align:right"><%=hd.TongTien %></td>
                            <td style="text-align:right"><%=hd.UngTruoc %></td>
                            <td><a href="/HopDong/Sua/<%=hd.MaHopDong %>" title="Xem chi tiết/Sửa">Chi tiết</a>
                                <a href="/HopDong/Xoa/<%=hd.MaHopDong %>" title="Xóa" onclick="return confirm('Bạn chắc chắn muốn xóa?!?')">Xóa</a>
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
</asp:Content>
