Public Class _Default1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            litAnnouncement.Text = ""
            loadAnnouncements()
            litScoreboard.Text = ""
            loadScoreboard()

        Else
            If Session("USER_NAME") Is Nothing Then
                Response.Redirect("Index.aspx")
            End If

            litCurrentUser.Text = Session("USER_NAME")
            loadScoreboard()
            loadAnnouncements()
            loadAdmin()
            loadHittingStats()
            loadPitchingStats()
        End If
    End Sub

    Sub HtmlAnchorZone_Click(sender As Object, e As EventArgs)
        hideAllPanels()
        pnlParentMain.Visible = True
    End Sub

    Sub HtmlAnchorSched_Click(sender As Object, e As EventArgs)
        hideAllPanels()
        pnlSchedule.Visible = True
    End Sub

    Sub HtmlAnchorStats_Click(sender As Object, e As EventArgs)
        hideAllPanels()
        pnlStats.Visible = True
    End Sub

    Sub HtmlAnchorLogout_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Response.Redirect("~\Login.aspx")
    End Sub

    Private Sub hideAllPanels()
        pnlEditRoster.Visible = False
        pnlParentMain.Visible = False
        pnlSchedule.Visible = False
        pnlStats.Visible = False
        pnlUserProfile.Visible = False

    End Sub

    Private Sub loadScoreboard()
        Dim strSQL As String = "SELECT TOP(4) * FROM [dbo].[scoreboard] order by score_id desc"
        Dim tblResult As DataTable = g_IO_Execute_SQL(strSQL, False)

        If tblResult.Rows.Count > 0 Then
            '' There be data
            For Each row In tblResult.Rows
                litScoreboard.Text &= "<div class=""col-lg-3 col-md-6"">"
                litScoreboard.Text &= "<div class=""panel panel-primary"">"
                litScoreboard.Text &= "<div class=""panel-heading"">"
                litScoreboard.Text &= "<div class=""row"" style=""text-align: center; margin-left: 0; margin-right: 0; width: auto;"">"
                litScoreboard.Text &= "<table style=""padding-left: 0; padding-right: 0; width: 100%;"">"
                litScoreboard.Text &= "<tr style=""text-align: center;""><td style=""text-align: left;"">Thunder</td><td>" & row("thunder_score") & "</td></tr>"
                litScoreboard.Text &= "<tr style=""padding: 0;""><td style=""text-align: left;"">" & row("opponent_name") & "</td><td>" & row("opponent_score") & "</td></tr>"
                litScoreboard.Text &= "</table>"
                litScoreboard.Text &= "</div>"
                litScoreboard.Text &= "</div>"
                litScoreboard.Text &= "</div>"
                litScoreboard.Text &= "</div>"
                litScoreboard.Text &= "</hr>"
            Next

        Else
            litScoreboard.Text = "No scores found at this time"
        End If
    End Sub

    Private Sub loadHittingStats()
        Dim strSQL As String = "Select * from [dbo].[VW_HITTING_STATS] order by AVG desc"
        Dim tblResult As DataTable = g_IO_Execute_SQL(strSQL, False)

        litHittingStats.Text = "<center><table id=""t1""><tr id=""tr1""><th id=""th1"">Player</th><th id=""th1"">GP</th><th id=""th1"">PA</th><th id=""th1"">AB</th><th id=""th1"">H</th><th id=""th1"">1B</th><th id=""th1"">2B</th><th id=""th1"">3B</th><th id=""th1"">HR</th><th id=""th1"">RBI</th><th id=""th1"">R</th><th id=""th1"">HBP</th><th id=""th1"">BB</th><th id=""th1"">K</th><th id=""th1"">AVG</th><th id=""th1"">OBP</th><th id=""th1"">SLG</th><th id=""th1"">OPS</th></tr>"

        If tblResult.Rows.Count > 0 Then
            For Each row In tblResult.Rows
                litHittingStats.Text &= "<tr id=""tr1""><td id=""td1"">" & row("FIRSTNAME") & "</td><td id=""td1"">" & row("GP") & "</td><td id=""td1"">" & row("PA") & "</td><td id=""td1"">" & row("AB") & "</td><td id=""td1"">" & row("H") & "</td><td id=""td1"">" & row("1B") & "</td><td id=""td1"">" & row("2B") & "</td><td id=""td1"">" & row("3B") & "</td><td id=""td1"">" & row("HR") & "</td><td id=""td1"">" & row("RBI") & "</td><td id=""td1"">" & row("R") & "</td><td id=""td1"">" & row("HBP") & "</td><td id=""td1"">" & row("BB") & "</td><td id=""td1"">" & row("K") & "</td><td id=""td1"">" & row("AVG") & "</td><td id=""td1"">" & row("OBP") & "</td><td id=""td1"">" & row("SLG") & "</td><td id=""td1"">" & row("OPS") & "</td></tr>"
            Next
            litHittingStats.Text &= "</table></center>"
        Else
            litHittingStats.Text = "<h3><center>No Hitting Stats found at this time, please try again later</center></h3>"
        End If
    End Sub

    Private Sub loadPitchingStats()
        Dim strSQL As String = "Select * from [dbo].[VW_PITCHING_STATS] order by ERA desc"
        Dim tblResult As DataTable = g_IO_Execute_SQL(strSQL, False)

        litPitchingStats.Text = "<center><table id=""t1""><tr id=""tr1""><th id=""th1"">Player</th><th id=""th1"">IP</th><th id=""th1"">GP</th><th id=""th1"">H</th><th id=""th1"">R</th><th id=""th1"">ER</th><th id=""th1"">BB</th><th id=""th1"">K</th><th id=""th1"">HBP</th><th id=""th1"">ERA</th><th id=""th1"">WHIP</th></tr>"

        If tblResult.Rows.Count > 0 Then
            For Each row In tblResult.Rows
                litPitchingStats.Text &= "<tr id=""tr1""><td id=""td1"">" & row("FIRSTNAME") & "</td><td id=""td1"">" & row("IP") & "</td><td id=""td1"">" & row("GP") & "</td><td id=""td1"">" & row("H") & "</td><td id=""td1"">" & row("R") & "</td><td>" & row("ER") & "</td><td id=""td1"">" & row("BB") & "</td><td id=""td1"">" & row("K") & "</td><td id=""td1"">" & row("HBP") & "</td><td id=""td1"">" & row("ERA") & "</td><td id=""td1"">" & row("WHIP") & "</td></tr>"
            Next
            litPitchingStats.Text &= "</table></center>"
        Else
            litHittingStats.Text = "<h3><center>No Pitching Stats found at this time, please try again later</center></h3>"
        End If
    End Sub

    Private Sub loadAnnouncements()
        Dim strSQL As String = "Select Top(5) * FROM [dbo].[announcements] order by announcement_id desc"
        Dim tblResult As DataTable = g_IO_Execute_SQL(strSQL, False)

        If tblResult.Rows.Count > 0 Then
            For Each row In tblResult.Rows
                litAnnouncement.Text &= "<div style=""float: left; font-size: 10px; color: grey;"">" & row("announce_by") & "-" & row("announce_date") & "</div><br>"
                litAnnouncement.Text &= "<article>" & row("announcement") & "</article><hr>"
            Next
        Else
            litAnnouncement.Text = "No Announcements at this time."
        End If
    End Sub

    Private Sub loadAdmin()
        If Session("IS_COACH") = 1 Then
            btnCoachMode.Visible = True
            btnRosterEditor.Visible = True
        Else

        End If
    End Sub

    Protected Sub btnCoachMode_Click(sender As Object, e As EventArgs) Handles btnCoachMode.Click
        If btnCoachMode.BorderColor = Drawing.Color.Red Then
            pnlAdminAddAnnouncement.Visible = True
            pnlAdminAddScore.Visible = True
            pnlTournSchedule.Visible = True
            btnCoachMode.Text = "Turn OFF Edit Mode"
            btnCoachMode.BorderColor = Drawing.Color.Green
        Else
            pnlAdminAddAnnouncement.Visible = False
            pnlAdminAddScore.Visible = False
            pnlTournSchedule.Visible = False
            btnCoachMode.Text = "Turn ON Edit Mode"
            btnCoachMode.BorderColor = Drawing.Color.Red
        End If


    End Sub

    Protected Sub btnAddScore_Click(sender As Object, e As EventArgs) Handles btnAddScore.Click
        Dim strSQL As String = "EXECUTE [dbo].[sp_AddScoreboard]
                        @Thunder_Score = " & txtThunderScore.Text.Replace("'", "''") & "
                       ,@Opponent_Name = '" & txtOppName.Text.Replace("'", "''") & "'
                       ,@Opponent_Score = " & txtOpponentScore.Text.Replace("'", "''") & ""
        g_IO_Execute_SQL(strSQL, False)

        lblScoreMsg.ForeColor = Drawing.Color.Green
        lblScoreMsg.Text = "Scoreboard Updated"
        litScoreboard.Text = ""
        loadScoreboard()
        clearAllText()

    End Sub

    Protected Sub clearAllText()
        Dim textAnnounce As String = ""
        textAnnounce = txtAnnounce.Value

        txtOpponentScore.Text = ""
        txtThunderScore.Text = ""
        txtOppName.Text = ""
        textAnnounce = ""
    End Sub

    Protected Sub btnAddAnnouncement_Click(sender As Object, e As EventArgs) Handles btnAddAnnouncement.Click
        Dim textAnnounce As String = ""
        textAnnounce = txtAnnounce.Value

        Dim strSQL As String = "EXECUTE [dbo].[sp_AddAnnouncement]
                    @announcement = '" & textAnnounce.Replace("'", "''") & "'
                   ,@announce_by = '" & Session("USER_NAME") & "'"
        g_IO_Execute_SQL(strSQL, False)

        lblAnnounceMsg.ForeColor = Drawing.Color.Green
        lblAnnounceMsg.Text = "Announcement Updated"
        litAnnouncement.Text = ""
        loadAnnouncements()
        clearAllText()
    End Sub

    Private Sub sendEmailMaster(ByVal user_email As String, ByVal Subject As String, ByVal Message As String, ByVal CCAddress As String)
        g_SendEmail(user_email, Subject, Message, "EmailTemplate.html", "SendEmail.aspx")
    End Sub

    Private Sub g_SendEmail(user_email As String, subject As String, message As String, v1 As String, v2 As String)
        Throw New NotImplementedException()
    End Sub

    Private Sub loadRosterInfo()
        Dim strSQL As String = "Select [Firstname], [Lastname], [Username], [Email], [LastLoginDate] FROM [dbo].[VW_ROSTERUSERINFO]"
        Dim tblResult As DataTable = g_IO_Execute_SQL(strSQL, False)

        If tblResult.Rows.Count > 0 Then
            litRosterInfo.Text = "<center><table id=""t1""><tr id=""tr1""><th id=""th1"">First Name</th><th id=""th1"">Last Name</th><th id=""th1"">Username</th><th id=""th1"">Email</th><th id=""th1"">Last Login</th></tr>"

            For Each row In tblResult.Rows
                litRosterInfo.Text &= "<tr id=""tr1""><td id=""td1"">" & row("Firstname") & "</td><td id=""td1"">" & row("Lastname") & "</td><td id=""td1"">" & row("Username") & "</td><td id=""td1"">" & row("Email") & "</td><td id=""td1"">" & row("LastLoginDate") & "</td></tr>"
            Next
        Else
            litRosterInfo.Text = "No Roster found"
        End If
    End Sub

    Protected Sub btnRosterEditor_Click(sender As Object, e As EventArgs) Handles btnRosterEditor.Click
        hideAllPanels()
        pnlEditRoster.Visible = True
        loadRosterInfo()
    End Sub

    Sub HtmlAnchorUserProfile_Click(sender As Object, e As EventArgs)
        hideAllPanels()
        pnlUserProfile.Visible = True
        litUserProfileTitle.Text = Session("USER_NAME") & "'s Profile"
    End Sub

    Private Sub CheckOldPassword()
        Dim userID As String = ""
        Try
            Dim strSQL As String = "Select [Password] FROM [dbo].[SYS_USERS] where [Username] = '" & Session("USER_NAME") & "'"
            userID = g_IO_Execute_SQL(strSQL, False)(0)(0)
        Catch ex As Exception
            userID = "User or password not found"
        End Try

        If userID = txtOldPassword.Text Then
            ConfirmCurrentPassword()
        Else
            litPasswordError.Text = "Old Password does not match"
            litPasswordError.Visible = True
        End If
    End Sub

    Private Sub ConfirmCurrentPassword()
        If txtNewPassword.Text <> txtConfirmPassword.Text Then
            litPasswordError.Text = "Passwords do not match"
            litPasswordError.Visible = True
        ElseIf txtConfirmPassword.Text = "" Then
            litPasswordError.Text = "Confirm Password cannot be left empty"
            litPasswordError.Visible = True
        ElseIf txtNewPassword.Text = "" Then
            litPasswordError.Text = "New Password cannot be left empty"
            litPasswordError.Visible = True
        Else
            ChangePassword()
        End If
    End Sub

    Private Sub ChangePassword()
        Dim strSQL As String = "Update [dbo].[SYS_USERS] SET [Password] = '" & txtNewPassword.Text & "' where [Username] = '" & Session("USER_NAME") & "'"
        g_IO_Execute_SQL(strSQL, False)

        txtOldPassword.Text = ""
        txtNewPassword.Text = ""
        txtConfirmPassword.Text = ""


        lblPassConf.Text = "Password Successfully changed"
        lblPassConf.ForeColor = Drawing.Color.Green
    End Sub

    Protected Sub btnChangePassword_Click(sender As Object, e As EventArgs) Handles btnChangePassword.Click
        CheckOldPassword()

    End Sub
End Class