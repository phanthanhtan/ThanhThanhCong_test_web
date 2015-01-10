<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    TTCS - Hợp đồng thuê đất
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<center>
    <a href="/HopDong/Them">Tạo mới hợp đồng</a><br />
    <a href="/HopDong/Index">Danh sách hợp đồng</a><br />
    <a href="/Vung/Index">Quản lý vùng</a><br />

</center>
</asp:Content>
