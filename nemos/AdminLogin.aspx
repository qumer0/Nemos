<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLoginLayout.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="nemos.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
    </style>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form id="form1" runat="server">
                    <asp:Label ID="lblMessage" runat="server" Text="" CssClass="text-danger"></asp:Label>
                    <asp:Panel ID="loginPanel" runat="server">
                        <h2>Giriş Yap</h2>
                        <div class="form-group">
                            <label>Kullanıcı Adı:</label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Şifre:</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnLogin" runat="server" Text="Giriş Yap" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
                        <asp:LinkButton ID="lnkForgotPassword" runat="server" OnClick="lnkForgotPassword_Click">Şifremi Unuttum</asp:LinkButton>
                    </asp:Panel>

                    <asp:Panel ID="forgotPasswordSection" runat="server" Visible="false">
                        <h2>Şifre Sıfırlama</h2>
                        <div class="form-group">
                            <label>Kullanıcı Adı:</label>
                            <asp:TextBox ID="txtForgotUsername" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtForgotUsername_TextChanged"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblSecurityQuestion" runat="server" CssClass="form-control" Text=""></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>Güvenlik Sorusu Cevabı:</label>
                            <asp:TextBox ID="txtSecurityAnswer" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnSubmitAnswer" runat="server" Text="Gönder" CssClass="btn btn-primary" OnClick="btnSubmitAnswer_Click" />
                        <asp:Button ID="btnSubmitGeri" runat="server" CssClass="btn btn-primary" OnClick="btnSubmitGeri_Click" Text="Geri" />
                        <asp:Label ID="lblForgotMessage" runat="server" ForeColor="Red"></asp:Label>
                    </asp:Panel>

                    <asp:Panel ID="resetPasswordSection" runat="server" Visible="false">
                        <h2>Yeni Şifre Belirle</h2>
                        <div class="form-group">
                            <label>Yeni Şifre:</label>
                            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Şifre Tekrar:</label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnResetPassword" runat="server" Text="Şifre Sıfırla" CssClass="btn btn-primary" OnClick="btnResetPassword_Click" />
                        <asp:Label ID="lblResetMessage" runat="server" ForeColor="Green"></asp:Label>
                    </asp:Panel>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</asp:Content>
