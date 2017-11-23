<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsList.ascx.cs" Inherits="Mdesign.UserControl.NewsList" %>
         
      <div id="news_list_content" class="A_Link_DIV" >
               <h1  style="font-size: x-large">活动</h1>
                 <asp:Repeater ID="rpleft2" runat="server">
                    <ItemTemplate>
                    <div style="padding-left:35px"><span><li style="line-height:25px;"><a target="_blank" href="/newsdetail.aspx?id=<%# DataBinder.Eval(Container, "DataItem.id") %>&SelfPageName=news"><%# DataBinder.Eval(Container, "DataItem.ptitle").ToString().Length < 25 ? DataBinder.Eval(Container, "DataItem.ptitle") : DataBinder.Eval(Container, "DataItem.ptitle").ToString().Substring(0,18)+"..." %></a></li></span>
                    </div>
                    
               </ItemTemplate>
                </asp:Repeater>
                <span class="A_Link_DIV" style="float:right; padding-right:25px;"><a target="_blank" href="../NewsList.aspx">更多></a></span>  
           </div>
    
  
