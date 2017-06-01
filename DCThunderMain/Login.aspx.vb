Imports System.Data.OleDb
Imports System.Data.SqlClient

Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Try
            If validateUser(txtEmailAddress.Text.Replace("'", "''"), txtPassword.Text.Replace("'", "''")) Then
                Response.Redirect("Default.aspx")
            Else
                litMessage.Text = "<br><p style=""color: red;"">Login Failed</p>"
            End If
        Catch ex As Exception
            litMessage.Text = Session("SQLERROR")
        End Try
        'Response.Redirect("Default.aspx")

    End Sub

End Class