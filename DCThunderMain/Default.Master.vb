Public Class _Default
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsNothing(Session("USER_NAME")) Then
            Response.Redirect("Login.aspx")
        End If
    End Sub

End Class