<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.Master" AutoEventWireup="true" CodeBehind="AdminDuzenle.aspx.cs" Inherits="nemos.AdminDuzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .news-form-container {
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
        .form-group textarea,
        .form-group select {
            width: 100%;
            display: block;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group textarea {
            height: 200px;
            resize: vertical;
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
    .auto-style2 {
        display: block;
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        color: #495057;
        background-clip: padding-box;
        border-radius: .25rem;
        transition: none;
        border: 1px solid #ced4da;
        background-color: #fff;
    }
    </style>
    
    <script type="text/javascript">
        function scrollToForm() {
            document.getElementById('editForm').scrollIntoView({ behavior: 'smooth' });
        }
    </script>

    <div class="container">
        <h2>Haberleri Düzenle</h2>
        <asp:GridView ID="gvHaberler" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowEditing="gvHaberler_RowEditing" CssClass="table table-bordered">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="baslik" HeaderText="Başlık" />
                <asp:BoundField DataField="etiket" HeaderText="Etiket" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Düzenle" CssClass="btn btn-primary" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <div class="container news-form-container" id="editForm" runat="server" Visible="false">
        <h2>Haber Düzenle</h2>
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
        <asp:HiddenField ID="hfHaberId" runat="server" />
        <div class="form-group">
            <label for="txtTitle">Haber Başlığı</label>
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="txtContent">Haber İçeriği</label>
            <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="10" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="txtImageUrl">Resim URL</label>
            <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="ddlCategory">Haber Etiketi</label>
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="auto-style2" Height="52px">
                <asp:ListItem Text="Gündem" Value="Gündem"></asp:ListItem>
                <asp:ListItem Text="Dünya" Value="Dünya"></asp:ListItem>
                <asp:ListItem Text="Kültür-Sanat" Value="Kültür-Sanat"></asp:ListItem>
                <asp:ListItem Text="Spor" Value="Spor"></asp:ListItem>
                <asp:ListItem Text="Teknoloji" Value="Teknoloji"></asp:ListItem>
                <asp:ListItem Text="Ekonomi" Value="Ekonomi"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:Button ID="btnUpdateHaber" runat="server" Text="Güncelle" CssClass="btn btn-primary" OnClick="btnUpdateHaber_Click" />
    </div>
    
    <asp:Literal ID="litScrollScript" runat="server"></asp:Literal>
</asp:Content>
