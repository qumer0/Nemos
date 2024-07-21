<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.Master" AutoEventWireup="true" CodeBehind="SoruEkle.aspx.cs" Inherits="nemos.SoruEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .question-form-container {
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

        .form-group input {
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
    
    <div class="container question-form-container">
        <h2>Yeni Güvenlik Sorusu Ekle</h2>
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
        <div class="form-group">
            <label for="txtQuestion">Güvenlik Sorusu</label>
            <asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control" />
        </div>
        <asp:Button ID="btnSaveQuestion" runat="server" Text="Kaydet" CssClass="btn btn-primary" OnClick="btnSaveQuestion_Click" />
    </div>
</asp:Content>
