Public Class Register
    Inherits System.Web.UI.Page

    Public Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then

        Else
        End If

    End Sub




    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        If CompareValidator1.ErrorMessage = "" Then
            CompareValidator1.ErrorMessage = "Passwords do not match"
            Exit Sub
        Else
            Dim strSQL As String = "Select COUNT(DISTINCT Email) as Validate from SYS_USERS where Email = '" & txtEmailAddress.Text & "'"
            Dim tblEmailCount = g_IO_Execute_SQL(strSQL, False)

            Dim emailCount As Integer = tblEmailCount.Rows(0)("Validate")

            If emailCount >= 1 Then
                litMessage.Text = "Email address already in use <br> Having issues signing in? <br> Contact a member of the coaching staff."
                Exit Sub
            Else
                strSQL = "EXECUTE [dbo].[sp_AddNewUser]
                @UserName = '" & txtUserName.Text.Replace("'", "''") & "'
               ,@Password = '" & tbPassword.Text.Replace("'", "''") & "'
               ,@Email = '" & txtEmailAddress.Text.Replace("'", "''") & "'"
                g_IO_Execute_SQL(strSQL, False)

                Response.Redirect("Login.aspx", False)
            End If
        End If


    End Sub



End Class