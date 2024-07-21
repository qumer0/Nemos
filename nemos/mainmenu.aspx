<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="mainmenu.aspx.cs" Inherits="nemos.mainmenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/body.css">
    <style>
        .carousel-inner img {
            height: 400px;
            width: 100%;
            
        }

        
        #haberSlider {
            margin-top:5px;
            margin-bottom:5px;
            box-shadow: 3px 3px 4px #a9a9a9 , -3px -3px 4px #a9a9a9 ;
        }

        

       
    </style>
    <div class="container mt-5">
        
            <div id="haberSlider" class="carousel slide" data-ride="carousel" data-interval="5000" >
                <div class="carousel-inner">
                    <asp:Repeater ID="rptSlider" runat="server">
                        <ItemTemplate>
                            <div class="carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>">
                                <a href="haberler.aspx?id=<%# Eval("Id") %>">
                                <img src='<%# Eval("ResimUrl") %>' class="d-block w-100" alt='<%# Eval("Baslik") %>'>
                                    </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <a class="carousel-control-prev" href="#haberSlider" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Önceki</span>
                </a>
                <a class="carousel-control-next" href="#haberSlider" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Sonraki</span>
                </a>
            </div>
        

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



    <!-- Diğer içerik seksiyonları buraya eklenecek -->


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</asp:Content>
