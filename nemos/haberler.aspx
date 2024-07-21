<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="haberler.aspx.cs" Inherits="nemos.haberler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .haber-detay img {
            width: 100%;
            height: 400px;
            margin-bottom: 20px;
        }
        .haber-detay h1 {
            margin-bottom: 20px;
        }
        .haber-detay .tarih {
            color: gray;
            margin-bottom: 20px;
        }
        .haber-detay .icerik {
            font-size: 18px;
            line-height: 1.6;
        }
    </style>
    <div class="container mt-5 haber-detay">
        <h1 id="lblBaslik" runat="server"></h1>
        <p class="tarih" id="lblTarih" runat="server"></p>
        <img id="imgHaber" runat="server" />
        <div class="icerik" id="lblIcerik" runat="server"></div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</asp:Content>
