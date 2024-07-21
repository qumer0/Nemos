<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.Master" AutoEventWireup="true" CodeBehind="AdminEkle.aspx.cs" Inherits="nemos.AdminEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .admin-form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            display: block;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn-primary {
            display: block;
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
    
    <div class="container admin-form-container">
        <h2>Yeni Admin Ekle</h2>
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
        <div class="form-group">
            <label for="txtUsername">Kullanıcı Adı</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="txtPassword">Şifre</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="txtEmail">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="ddlSecurityQuestion">Güvenlik Sorusu</label>
            <asp:DropDownList ID="ddlSecurityQuestion" runat="server" CssClass="form-control">
               
                
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <label for="txtSecurityAnswer">Güvenlik Cevabı</label>
            <asp:TextBox ID="txtSecurityAnswer" runat="server" CssClass="form-control" />
        </div>
        <asp:Button ID="btnSaveAdmin" runat="server" Text="Kaydet" CssClass="btn btn-primary" OnClick="btnSaveAdmin_Click" />
    </div>
</asp:Content>
