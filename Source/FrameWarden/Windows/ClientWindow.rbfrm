#tag WindowBegin Window ClientWindow   BackColor       =   16777215   Backdrop        =   ""   BalloonHelp     =   ""   CloseButton     =   True   Composite       =   False   Frame           =   0   FullScreen      =   False   HasBackColor    =   False   Height          =   233   ImplicitInstance=   True   LiveResize      =   True   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   False   MaxWidth        =   32000   MenuBar         =   ""   MenuBarVisible  =   True   MinHeight       =   64   MinimizeButton  =   True   MinWidth        =   64   Placement       =   0   Resizeable      =   False   Title           =   "Frame Warden Client"   Visible         =   True   Width           =   282   Begin TextField ClientNameField      AcceptTabs      =   ""      Alignment       =   0      AutoDeactivate  =   True      BackColor       =   16777215      Bold            =   ""      Border          =   True      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Format          =   ""      Height          =   22      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   20      LimitText       =   0      LockBottom      =   False      LockedInPosition=   False      LockLeft        =   True      LockRight       =   False      LockTop         =   True      Mask            =   ""      Multiline       =   ""      Password        =   ""      ReadOnly        =   ""      Scope           =   0      ScrollbarHorizontal=   ""      ScrollbarVertical=   True      Styled          =   ""      TabIndex        =   0      TabPanelIndex   =   0      TabStop         =   True      Text            =   ""      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   53      Underline       =   ""      UseFocusRing    =   True      Visible         =   True      Width           =   89   End   Begin TextField ServerAddressField      AcceptTabs      =   ""      Alignment       =   0      AutoDeactivate  =   True      BackColor       =   16777215      Bold            =   ""      Border          =   True      DataField       =   ""      DataSource      =   ""      Enabled         =   False      Format          =   ""      Height          =   22      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   154      LimitText       =   0      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   False      LockRight       =   True      LockTop         =   True      Mask            =   ""      Multiline       =   ""      Password        =   ""      ReadOnly        =   ""      Scope           =   0      ScrollbarHorizontal=   ""      ScrollbarVertical=   True      Styled          =   ""      TabIndex        =   1      TabPanelIndex   =   0      TabStop         =   True      Text            =   ""      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   53      Underline       =   ""      UseFocusRing    =   True      Visible         =   True      Width           =   100   End   Begin CheckBox AutoStartCheckBox      AutoDeactivate  =   True      Bold            =   ""      Caption         =   "Auto Start"      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   20      LockBottom      =   False      LockedInPosition=   False      LockLeft        =   True      LockRight       =   False      LockTop         =   True      Scope           =   0      State           =   0      TabIndex        =   2      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   87      Underline       =   ""      Value           =   False      Visible         =   True      Width           =   100   End   Begin PushButton PushButton2      AutoDeactivate  =   True      Bold            =   ""      Cancel          =   True      Caption         =   "End Node"      Default         =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   20      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   True      LockRight       =   False      LockTop         =   False      Scope           =   0      TabIndex        =   3      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   190      Underline       =   ""      Visible         =   True      Width           =   91   End   Begin PushButton PushButton1      AutoDeactivate  =   True      Bold            =   ""      Cancel          =   ""      Caption         =   "Start Node"      Default         =   True      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   163      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   False      LockRight       =   True      LockTop         =   False      Scope           =   0      TabIndex        =   4      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   190      Underline       =   ""      Visible         =   True      Width           =   91   End   Begin Timer CheckStatusTimer      Height          =   32      Index           =   -2147483648      InitialParent   =   ""      Left            =   -48      LockedInPosition=   False      Mode            =   2      Period          =   99      Scope           =   0      TabIndex        =   5      TabPanelIndex   =   0      TabStop         =   True      Top             =   108      Width           =   32   End   Begin EasyTCPSocket Client_Socket      Address         =   ""      ControlOrder    =   6      Height          =   32      Index           =   -2147483648      InitialParent   =   ""      Left            =   -48      LockedInPosition=   False      Port            =   47599      Scope           =   0      TabIndex        =   6      TabPanelIndex   =   0      TabStop         =   True      Top             =   20      Width           =   32   End   Begin Label StaticText1      AutoDeactivate  =   True      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   20      LockBottom      =   False      LockedInPosition=   False      LockLeft        =   ""      LockRight       =   False      LockTop         =   False      Multiline       =   ""      Scope           =   0      TabIndex        =   7      TabPanelIndex   =   0      TabStop         =   True      Text            =   "Client name:"      TextAlign       =   0      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   21      Underline       =   ""      Visible         =   True      Width           =   89   End   Begin Label StaticText2      AutoDeactivate  =   True      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   154      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   False      LockRight       =   True      LockTop         =   True      Multiline       =   ""      Scope           =   0      TabIndex        =   8      TabPanelIndex   =   0      TabStop         =   True      Text            =   "Controller IP:"      TextAlign       =   0      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   20      Underline       =   ""      Visible         =   True      Width           =   89   End   Begin PopupMenu PrimaryGroupSelectorPopup      AutoDeactivate  =   True      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      InitialValue    =   ""      Italic          =   ""      Left            =   154      ListIndex       =   0      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   ""      LockRight       =   True      LockTop         =   True      Scope           =   0      TabIndex        =   11      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   120      Underline       =   ""      Visible         =   True      Width           =   100   End   Begin PopupMenu SecondaryGroupSelectorPopup      AutoDeactivate  =   True      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      InitialValue    =   ""      Italic          =   ""      Left            =   154      ListIndex       =   0      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   ""      LockRight       =   True      LockTop         =   True      Scope           =   0      TabIndex        =   12      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   154      Underline       =   ""      Visible         =   True      Width           =   100   End   Begin Label StaticText3      AutoDeactivate  =   True      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   20      LockBottom      =   False      LockedInPosition=   False      LockLeft        =   ""      LockRight       =   False      LockTop         =   False      Multiline       =   ""      Scope           =   0      TabIndex        =   13      TabPanelIndex   =   0      TabStop         =   True      Text            =   "Primary group:"      TextAlign       =   0      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   121      Underline       =   ""      Visible         =   True      Width           =   122   End   Begin Label StaticText4      AutoDeactivate  =   True      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   20      LockBottom      =   False      LockedInPosition=   False      LockLeft        =   ""      LockRight       =   False      LockTop         =   False      Multiline       =   ""      Scope           =   0      TabIndex        =   14      TabPanelIndex   =   0      TabStop         =   True      Text            =   "Secondary group:"      TextAlign       =   0      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   154      Underline       =   ""      Visible         =   True      Width           =   122   End   Begin EasyTCPSocket ClientCommand_Socket      Address         =   ""      ControlOrder    =   6      Height          =   32      Index           =   -2147483648      Left            =   -48      LockedInPosition=   False      Port            =   47597      Scope           =   0      TabIndex        =   13      TabPanelIndex   =   0      TabStop         =   True      Top             =   66      Width           =   32   End   Begin Timer RelaunchTimer      Height          =   32      Index           =   -2147483648      Left            =   -48      LockedInPosition=   False      Mode            =   0      Period          =   5000      Scope           =   0      TabIndex        =   14      TabPanelIndex   =   0      TabStop         =   True      Top             =   153      Width           =   32   End   Begin Timer LicensedLaunchTimer      Height          =   32      Index           =   -2147483648      Left            =   -48      LockedInPosition=   False      Mode            =   0      Period          =   5000      Scope           =   0      TabIndex        =   15      TabPanelIndex   =   0      TabStop         =   True      Top             =   197      Width           =   32   End   Begin Shell myShell      Arguments       =   ""      Backend         =   ""      Height          =   32      Index           =   -2147483648      Left            =   305      LockedInPosition=   False      Mode            =   0      Scope           =   0      TabIndex        =   16      TabPanelIndex   =   0      TabStop         =   True      TimeOut         =   0      Top             =   8      Width           =   32   End   Begin Separator MacSeparatorLine      AutoDeactivate  =   True      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   20      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   17      TabPanelIndex   =   0      TabStop         =   True      Top             =   87      Visible         =   False      Width           =   242   End   Begin Timer NoConnectionTimer      Height          =   32      Index           =   -2147483648      Left            =   305      LockedInPosition=   False      Mode            =   0      Period          =   10000      Scope           =   0      TabIndex        =   18      TabPanelIndex   =   0      TabStop         =   True      Top             =   178      Width           =   32   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Close()		  WriteClientPrefs		  CloseShell()		  KillModoWin()		  		  Quit		End Sub	#tag EndEvent	#tag Event		Sub EnableMenuItems()		  #if TargetMacOS		    EditPreferences.Enabled = False		    EditPreferences.Visible = False		  #endif		  		  #if TargetWin32		    EditMenu.Remove(EditPreferences)		    		    //EditPreferences.Visible = False		    //EditPreferences.Enabled = False		  #endif		End Sub	#tag EndEvent	#tag Event		Sub Open()		  //myShell = new Shell		  myShell.mode = 2		  		  ReadClientPrefs		  		  Client_Socket.Address = ServerAddressField.text		  		  me.Initialized = False		  me.HasModoLaunched = False		  		  if AutoStartCheckBox.value then		    CheckStatusTimer.mode = 2		  end if		  		  		  #if TargetMacOS then		    AutoStartCheckBox.Visible = false		    MacSeparatorLine.Visible = true		  #endif		End Sub	#tag EndEvent	#tag Method, Flags = &h0		Sub CloseShell()		  myShell.Close()		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ExecuteShell()		  Dim cmd as String		  Dim myConfigPath As FolderItem		  		  myConfigPath = GetFolderItem("CustomConfigs").Child("RenderNode.CFG")		  		  #if TargetMacOS then		    cmd =  modoAppPath + "/Contents/MacOS/modo -config:" + chr(34) + "/Volumes/" + ReplaceAll(myConfigPath.AbsolutePath, ":", "/") + chr(34)		  #elseif TargetWin32		    // We need to close any Modo apps running just in case		    //CloseShell()		    cmd = chr(34) + modoAppPath + chr(34) + " " + chr(34) + "-config:" + myConfigPath.AbsolutePath + chr(34)		  #endif		  		  myShell.Execute cmd		  		  #if TargetWin32 then		    // It gets hung up on Windows if we don't do this :(		    CloseShell()		  #endif		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ExecuteShellLicensed()		  Dim cmd as String		  Dim myConfigPath As FolderItem		  		  myConfigPath = GetFolderItem("CustomConfigs").Child("BucketMaster.CFG")		  		  #if TargetMacOS then		    // Old... may need just in case		    cmd =  modoAppPath + "/Contents/MacOS/modo -console"		    cmd = cmd + " -config:" + chr(34) + "/Volumes/" + ReplaceAll(myConfigPath.AbsolutePath, ":", "/") + chr(34)		    cmd = cmd + " -license:" + chr(34) + modoLicensePath + chr(34)		    		    // /Volumes/Main_Content/1_Network_Applications/modo.app/Contents/MacOS/modo -license:"/Volumes/Main_Content/1_Network_Applications/Licenses/"		    		    WriteToLog cmd, LogFuncs.Command		    		    //MsgBox cmd		  #elseif TargetWin32		    // We need to get the headless version		    modoAppPath = modoAppPath.Left(modoAppPath.Len-4) + "_cl.exe"		    		    cmd = chr(34) + modoAppPath + chr(34)		    //cmd = cmd + " " + chr(34) + "-config:" + myConfigPath.AbsolutePath + chr(34)		    //cmd = cmd + " " + chr(34) + "-license:" + modoLicensePath + chr(34)		  #endif		  		  myShell.Execute cmd		  		  ClientCommand_Socket.SendMessage(Int32(TCP.AckHeadlessCmd), "")		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub HandleSocketCommand(command As Integer, data as String)		  WriteToLog "Received data: " + data, LogFuncs.Netwk		  		  if command = Integer(TCP.HeadlessCmd) then		    if myShell.IsRunning then		      myShell.WriteLine data		      lastDataSent = data		      WriteToLog "Wrote: " + data, LogFuncs.Command		    end if		  else		    Select Case data		    case "ack-init"		      self.Initialized = True		    case "launch"		      ExecuteShell()		    case "relaunch"		      KillModoWin()		      RelaunchTimer.mode = 1		    case "LicenseLaunch"		      StartLicensedLaunch()		    case "kill"		      #if TargetMacOS then		        CloseShell()		      #elseif TargetWin32		        KillModoWin()		      #endif		    case "down"		      self.Initialized = False		    case else		      // Set the Modo application path		      if InStr(1, data, "modopath:") <> 0 then		        modoAppPath = Right(data, Len(data)-Len("modopath:"))		        gotAppPath = True		        		        if modoAppPath = "" then		          gotAppPath = False		        end if		        		        ClientCommand_Socket.SendMessage(Int32(TCP.ackModoPath), Client_Socket.LocalAddress)		        		        // Set the Modo License path		      elseif InStr(1, data, "licensepath:") <> 0 then		        modoLicensePath = Right(data, Len(data)-Len("licensepath:"))		        gotLicensePath = True		        		        ClientCommand_Socket.SendMessage(Int32(TCP.ackLicensePath), Client_Socket.LocalAddress)		      end if		    end select		  end if		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub KillModoWin()		  #if TargetWin32 then		    myShell.Execute "taskkill /F /IM modo.exe"		  #endif		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ReadClientPrefs()		  Dim f as FolderItem		  Dim tIn As TextInputStream		  		  #if TargetMacOS		    f = GetFolderItem(SpecialFolder.Preferences.AbsolutePath + "FrameWardenData:Client.txt")		  #elseif TargetWin32		    f = GetFolderItem(SpecialFolder.Preferences.AbsolutePath + "\FrameWardenData\Client.txt")		  #endif		  		  		  if f <> nil then		    if f.exists then		      tIn = f.OpenAsTextFile		      		      // Server IP		      ServerAddressField.text = tIn.ReadLine		      		      // Auto-start?		      if tIn.ReadLine = "1" then		        AutoStartCheckBox.Value = True		      else		        AutoStartCheckBox.Value = False		      end if		      		      // Client Name		      		      ClientName = tIn.ReadLine		      ClientNameField.text = ClientName		      		      me.PrimaryGroup = Val(tIn.ReadLine)		      me.SecondaryGroup = Val(tIn.ReadLine)		      PrimaryGroupSelectorPopup.ListIndex = me.PrimaryGroup		      SecondaryGroupSelectorPopup.ListIndex = me.SecondaryGroup		    end if		  end if		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub StartLicensedLaunch()		  LicensedLaunchTimer.mode = 1		  		  CloseShell()		  KillModoWin()		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub WriteClientPrefs()		  Dim f as FolderItem		  Dim tOut As TextOutputStream		  		  #if TargetMacOS then		    f = GetFolderItem(SpecialFolder.Preferences.AbsolutePath + "FrameWardenData")		    		    if not f.Exists then		      f.CreateAsFolder		    end if		  #elseif TargetWin32 then		    f = GetFolderItem(SpecialFolder.Preferences.AbsolutePath + "\FrameWardenData")		    		    if not f.Exists then		      f.CreateAsFolder		    end if		  #endif		  		  tOut = f.Child("Client.txt").CreateTextFile		  		  // Server IP		  tOut.WriteLine ServerAddressField.text		  		  // Auto-start?		  if AutoStartCheckBox.Value = True then		    tOut.WriteLine "1"		  else		    tOut.WriteLine "0"		  end if		  		  // Client name		  tOut.WriteLine ClientNameField.text		  		  tOut.WriteLine Str(me.PrimaryGroup)		  tOut.WriteLine Str(me.SecondaryGroup)		End Sub	#tag EndMethod	#tag Property, Flags = &h0		ClientName As String	#tag EndProperty	#tag Property, Flags = &h0		gotAppPath As Boolean	#tag EndProperty	#tag Property, Flags = &h0		gotLicensePath As Boolean	#tag EndProperty	#tag Property, Flags = &h0		HasModoLaunched As Boolean	#tag EndProperty	#tag Property, Flags = &h0		HeadlessMode As Boolean = False	#tag EndProperty	#tag Property, Flags = &h0		Initialized As Boolean	#tag EndProperty	#tag Property, Flags = &h0		lastDataSent As String	#tag EndProperty	#tag Property, Flags = &h0		modoAppPath As String	#tag EndProperty	#tag Property, Flags = &h0		modoLicensePath As String	#tag EndProperty	#tag Property, Flags = &h0		OldmyShell As Shell	#tag EndProperty	#tag Property, Flags = &h0		PrimaryGroup As UInt8	#tag EndProperty	#tag Property, Flags = &h0		SecondaryGroup As UInt8	#tag EndProperty#tag EndWindowCode#tag Events ClientNameField	#tag Event		Sub TextChange()		  Dim place As Int32		  Dim newStr As String		  		  place = InStr(0, me.text, "@")		  		  if place <> 0 then		    newStr = Left(me.text, place-1) + Right(me.text, Len(me.text) - place)		    me.text = newStr		    		    MsgBox "You cannot have the '@' character in your Client name!"		  end if		  		  if me.text <> "" then		    ServerAddressField.Enabled = true		  else		    ServerAddressField.Enabled = false		  end if		End Sub	#tag EndEvent	#tag Event		Sub LostFocus()		  ClientName = me.text		End Sub	#tag EndEvent#tag EndEvents#tag Events ServerAddressField	#tag Event		Sub LostFocus()		  Client_Socket.Address = me.text		End Sub	#tag EndEvent#tag EndEvents#tag Events AutoStartCheckBox	#tag Event		Sub Action()		  #if TargetWin32 then		    Dim reg as new RegistryItem("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run")		    		    if me.Value then		      reg.value("FrameWardenClient") = app.ExecutableFile.AbsolutePath		    else		      reg.Delete("FrameWardenClient")		    end if		  #endif		End Sub	#tag EndEvent#tag EndEvents#tag Events PushButton2	#tag Event		Sub Action()		  if myShell.IsRunning then		    CloseShell()		  end if		  		  #if TargetWin32 then		    KillModoWin()		  #endif		End Sub	#tag EndEvent#tag EndEvents#tag Events PushButton1	#tag Event		Sub Action()		  if not myShell.IsRunning then		    ExecuteShell		  end if		End Sub	#tag EndEvent#tag EndEvents#tag Events CheckStatusTimer	#tag Event		Sub Action()		  if ClientNameField.text <> "" then		    if not Client_Socket.IsConnected then		      Client_Socket.Connect		    end if		    		    if not ClientCommand_Socket.IsConnected then		      ClientCommand_Socket.Listen		    end if		    		    // This will launch Modo if it hasn't launched already		    if NOT HasModoLaunched then		      if gotAppPath then		        HasModoLaunched = True		        ExecuteShell()		      end if		    end if		    		    me.Period = Rnd * 15 + 99		  end if		  		  if self.Initialized = False then		    ClientCommand_Socket.SendMessage(Int32(TCP.NeedModoPath), ClientCommand_Socket.LocalAddress)		  end if		  		  		  myShell.poll		End Sub	#tag EndEvent#tag EndEvents#tag Events Client_Socket	#tag Event		Sub Connected()		  Dim platform, NodeData As String		  		  // Make sure the NoConnectionTimer is turned off because we don't want to reinitialize if unneccessary		  NoConnectionTimer.mode = 0		  		  // Build the node string		  #if TargetMacOS then		    platform = gTargetMacOS		  #elseif TargetWin32 then		    platform = gTargetWin32		  #endif		  		  NodeData = ClientName + "@" + me.LocalAddress + "@" + Str(self.PrimaryGroup+1) + "@" + Str(self.SecondaryGroup+1) + "@" + platform		  		  // If the node isn't initialized then we need to send the controller the data		  if NOT Initialized then		    me.SendMessage(Int32(TCP.NodeInit), NodeData)		  else		    me.SendMessage(Int32(TCP.NodeCheck), NodeData)		  end if		  		  		  		End Sub	#tag EndEvent	#tag Event		Sub ReceivedMessage(command as Integer, data as String)		  HandleSocketCommand(command, data)		End Sub	#tag EndEvent	#tag Event		Sub Error(code as Integer)		  // If the code is the "Lost Connection" code then		  if code = 102 then		    // Set the timer to reset the Initialized variable		    // This timer is countered in the Connected event		    NoConnectionTimer.mode = 1		  end if		End Sub	#tag EndEvent#tag EndEvents#tag Events PrimaryGroupSelectorPopup	#tag Event		Sub Open()		  Dim i as Int32		  		  for i = 1 to 10		    me.AddRow(Str(i))		  next		  		  me.ListIndex = 0		End Sub	#tag EndEvent	#tag Event		Sub Change()		  self.PrimaryGroup = me.ListIndex		End Sub	#tag EndEvent#tag EndEvents#tag Events SecondaryGroupSelectorPopup	#tag Event		Sub Open()		  Dim i as Int32		  		  for i = 1 to 10		    me.AddRow(Str(i))		  next		  		  me.ListIndex = 0		End Sub	#tag EndEvent	#tag Event		Sub Change()		  self.SecondaryGroup = me.ListIndex		End Sub	#tag EndEvent#tag EndEvents#tag Events ClientCommand_Socket	#tag Event		Sub ReceivedMessage(command as Integer, data as String)		  HandleSocketCommand(command, data)		End Sub	#tag EndEvent	#tag Event		Sub Connected()		  me.SendMessage(Int32(TCP.NeedModoPath), me.LocalAddress)		  me.SendMessage(Int32(TCP.NeedLicensePath), me.LocalAddress)		End Sub	#tag EndEvent#tag EndEvents#tag Events RelaunchTimer	#tag Event		Sub Action()		  ExecuteShell()		  RelaunchTimer.mode = 0		End Sub	#tag EndEvent#tag EndEvents#tag Events LicensedLaunchTimer	#tag Event		Sub Action()		  ExecuteShellLicensed()		  LicensedLaunchTimer.mode = 0		End Sub	#tag EndEvent#tag EndEvents#tag Events myShell	#tag Event		Sub DataAvailable()		  Dim data As String		  		  data = myShell.ReadAll		  		  if HeadlessMode then		    		    if lastDataSent = data then		      WriteToLog "--- LAST DATA ---", LogFuncs.Command		    elseif data = "ok" then		      WriteToLog "--- OKAY ---", LogFuncs.Command		    else		      WriteToLog "--- Shell Data Received:       -" + data, LogFuncs.Command		    end if		    		    ClientCommand_Socket.SendMessage(Int32(TCP.AckHeadlessCmd), "")		    WriteToLog "Ack Headless Command", LogFuncs.Command		  end if		End Sub	#tag EndEvent	#tag Event		Sub Completed()		  WriteToLog "Execute Completed", LogFuncs.Command		End Sub	#tag EndEvent#tag EndEvents#tag Events NoConnectionTimer	#tag Event		Sub Action()		  Initialized = false		End Sub	#tag EndEvent#tag EndEvents