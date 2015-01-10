<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Layout.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SetInitialRow();
        }
    }

    private void SetInitialRow()
    {
        System.Data.DataTable dt = new System.Data.DataTable();
        System.Data.DataRow dr = null;
        dt.Columns.Add(new System.Data.DataColumn("RowNumber", typeof(string)));
        dt.Columns.Add(new System.Data.DataColumn("Column1", typeof(string)));
        dt.Columns.Add(new System.Data.DataColumn("Column2", typeof(string)));
        dt.Columns.Add(new System.Data.DataColumn("Column3", typeof(string)));
        dr = dt.NewRow();
        dr["RowNumber"] = 1;
        dr["Column1"] = string.Empty;
        dr["Column2"] = string.Empty;
        dr["Column3"] = string.Empty;
        dt.Rows.Add(dr);
        //dr = dt.NewRow();

        //Store the DataTable in ViewState
        ViewState["CurrentTable"] = dt;

        Gridview1.DataSource = dt;
        Gridview1.DataBind();
    }
    private void AddNewRowToGrid()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)
        {
            System.Data.DataTable dtCurrentTable = (System.Data.DataTable)ViewState["CurrentTable"];
            System.Data.DataRow drCurrentRow = null;
            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {
                    //extract the TextBox values
                    TextBox box1 = (TextBox)Gridview1.Rows[rowIndex].Cells[1].FindControl("TextBox1");
                    TextBox box2 = (TextBox)Gridview1.Rows[rowIndex].Cells[2].FindControl("TextBox2");
                    TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("TextBox3");

                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = i + 1;

                    dtCurrentTable.Rows[i - 1]["Column1"] = box1.Text;
                    dtCurrentTable.Rows[i - 1]["Column2"] = box2.Text;
                    dtCurrentTable.Rows[i - 1]["Column3"] = box3.Text;

                    rowIndex++;
                }
                dtCurrentTable.Rows.Add(drCurrentRow);
                ViewState["CurrentTable"] = dtCurrentTable;

                Gridview1.DataSource = dtCurrentTable;
                Gridview1.DataBind();
            }
        }
        else
        {
            Response.Write("ViewState is null");
        }

        //Set Previous Data on Postbacks
        SetPreviousData();
    }
    private void SetPreviousData()
    {
        int rowIndex = 0;
        if (ViewState["CurrentTable"] != null)
        {
            System.Data.DataTable dt = (System.Data.DataTable)ViewState["CurrentTable"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    TextBox box1 = (TextBox)Gridview1.Rows[rowIndex].Cells[1].FindControl("TextBox1");
                    TextBox box2 = (TextBox)Gridview1.Rows[rowIndex].Cells[2].FindControl("TextBox2");
                    TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("TextBox3");

                    box1.Text = dt.Rows[i]["Column1"].ToString();
                    box2.Text = dt.Rows[i]["Column2"].ToString();
                    box3.Text = dt.Rows[i]["Column3"].ToString();

                    rowIndex++;
                }
            }
        }
    }
    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        AddNewRowToGrid();
    }
    
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    test
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form name="f1" runat="server">
    <asp:gridview ID="Gridview1" runat="server" ShowFooter="true" AutoGenerateColumns="false">
        <Columns>
        <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
        <asp:TemplateField HeaderText="Header 1">
            <ItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Header 2">
            <ItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Header 3">
            <ItemTemplate>
                 <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </ItemTemplate>
            <FooterStyle HorizontalAlign="Right" />
            <FooterTemplate>
                <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" OnClick="ButtonAdd_Click"/>
            </FooterTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:gridview>
    </form>


</asp:Content>
