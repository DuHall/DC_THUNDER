<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Default.Master" CodeBehind="topgunseeder.aspx.vb" Inherits="DCThunderMain.topgunseeder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="col-lg-12">
         <center>
             <br /><br />
             Copy and paste current tournament standings below <hr />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" Width="703px">
                        <Columns>
                            <asp:BoundField DataField="Team_Name" HeaderText="Team_Name" SortExpression="Team_Name" />
                            <asp:BoundField DataField="Won" HeaderText="Won" SortExpression="Won" />
                            <asp:BoundField DataField="Lost" HeaderText="Lost" SortExpression="Lost" />
                            <asp:BoundField DataField="Runs_Allowed" HeaderText="Runs_Allowed" SortExpression="Runs_Allowed" />
                            <asp:BoundField DataField="Runs_Scored" HeaderText="Runs_Scored" SortExpression="Runs_Scored" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=DC_THUNDER;User ID=Thunder;Password=Do0msday" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Team Name] AS Team_Name, [Won], [Lost], [Runs Allowed] AS Runs_Allowed, [Runs Scored] AS Runs_Scored FROM [seeder] ORDER BY [Lost], [Won] DESC, [Runs Allowed]"></asp:SqlDataSource>
             <br />
             <br />
             <asp:Button ID="btnClear" runat="server" Text="Clear Seeder" />&nbsp;&nbsp;<asp:Button ID="btnSeeder" runat="server" Text="Update Seeder" />
             <br />
             <br />
             <asp:Literal ID="litResponse" runat="server"></asp:Literal>
             <br />
             <br />


         </center>
         </div>
</asp:Content>
