<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="arama.aspx.cs" Inherits="nemos.arama" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <link rel="stylesheet" href="css/bodyetiket.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <div class="container mt-5">
        
            
        

    </div>

    <div class="container">

        <section class="main-news">
            <div class="news-grid">


                <asp:Repeater ID="rpthaberler" runat="server">
                    <ItemTemplate>

                        <div class="news-item">
                             <a href="haberler.aspx?id=<%# Eval("Id") %>" >
                            <img src='<%# Eval("ResimUrl") %>'>
                                </a>
                            <h3><%# Eval("Baslik") %></h3>

                            <a href="haberler.aspx?id=<%# Eval("Id") %>" >
                                <div style="color: black;">Haberi Oku...   </div>
                            </a>
                        </div>

                    </ItemTemplate>

                </asp:Repeater>

            </div>
        </section>
    </div>

</asp:Content>
