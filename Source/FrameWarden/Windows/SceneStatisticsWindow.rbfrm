#tag WindowBegin Window SceneStatisticsWindow   BackColor       =   16777215   Backdrop        =   ""   BalloonHelp     =   ""   CloseButton     =   True   Composite       =   False   Frame           =   0   FullScreen      =   False   HasBackColor    =   False   Height          =   536   ImplicitInstance=   True   LiveResize      =   True   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   True   MaxWidth        =   32000   MenuBar         =   553393500   MenuBarVisible  =   True   MinHeight       =   275   MinimizeButton  =   True   MinWidth        =   275   Placement       =   0   Resizeable      =   True   Title           =   "Scene Statistics"   Visible         =   True   Width           =   561   Begin Listbox StatList      AutoDeactivate  =   True      AutoHideScrollbars=   True      Bold            =   ""      ColumnCount     =   2      ColumnsResizable=   ""      ColumnWidths    =   ""      DataField       =   ""      DataSource      =   ""      DefaultRowHeight=   -1      Enabled         =   True      EnableDrag      =   ""      EnableDragReorder=   ""      GridLinesHorizontal=   0      GridLinesVertical=   0      HasHeading      =   True      HeadingIndex    =   -1      Height          =   502      HelpTag         =   ""      Hierarchical    =   ""      Index           =   -2147483648      InitialParent   =   ""      InitialValue    =   "Frame	Time"      Italic          =   ""      Left            =   20      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   True      LockRight       =   True      LockTop         =   True      RequiresSelection=   ""      Scope           =   0      ScrollbarHorizontal=   ""      ScrollBarVertical=   True      SelectionType   =   0      TabIndex        =   0      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   0      Top             =   14      Underline       =   ""      UseFocusRing    =   True      Visible         =   True      Width           =   521      _ScrollOffset   =   0      _ScrollWidth    =   -1   End   Begin Timer RefreshTimer      Height          =   32      Index           =   -2147483648      Left            =   6      LockedInPosition=   False      Mode            =   2      Period          =   5000      Scope           =   0      TabIndex        =   1      TabPanelIndex   =   0      TabStop         =   True      Top             =   7      Width           =   32   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub EnableMenuItems()		  FileSave.Enable		End Sub	#tag EndEvent	#tag MenuHandler		Function FileSave() As Boolean Handles FileSave.Action			Dim i as Integer			Dim time As Double			Dim f as FolderItem			Dim tOut as TextOutputStream			Dim outStr As String						f = GetSaveFolderItem("text", "Statistics.txt")						if f <> nil then			tOut = f.CreateTextFile						if tOut <> nil then			tOut.WriteLine "Stats for " + StatScene.File.Name			tOut.WriteLine ""			tOut.WriteLine "Frame #:" + Chr(9) + Chr(9) + Chr(9) + "Time:"			tOut.WriteLine ""						for i = StatScene.FirstFrame to StatScene.LastFrame step StatScene.FrameStep			outStr = Str(i) + Chr(9) + Chr(9) + Chr(9) + Chr(9)						if StatScene.Frame(StatScene.ConvertFrameToIndex(i)).Completed then			time = StatScene.Frame(StatScene.ConvertFrameToIndex(i)).TimeEnd - StatScene.Frame(StatScene.ConvertFrameToIndex(i)).TimeStart						outStr = outStr + GetTimeString(time)			else			outStr = outStr + "Incomplete"			end if						tOut.WriteLine outStr			next			end if			end if						Return True					End Function	#tag EndMenuHandler	#tag Method, Flags = &h0		Function GetTimeString(time as Double) As String		  Dim timeStr As String		  Dim hours, minutes, seconds as Integer		  		  time = time/60		  		  // Time is in seconds at this point, we want to check for hours and minutes		  if time > 60 then // check for minutes		    if time > 3600 then // check for seconds		      hours = time / 3600		      time = time - hours*3600		      		      timeStr = Str(hours)		      		      if hours > 1 then		        timeStr = timeStr + " hrs "		      else		        timeStr = timeStr + " hr "		      end if		    end if		    		    minutes = time / 60		    time = time - minutes * 60		    		    timeStr = timeStr + Str(minutes) + " min "		  end if		  		  time = Round(time)		  		  if time = 0 then		    timeStr = "<1 sec"		  else		    timeStr = timeStr + Str(time) + " sec"		  end if		  		  		  Return timeStr		  		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub UpdateList()		  Dim i, oldListIndex as Integer		  Dim time As Double		  		  oldListIndex = StatList.ListIndex		  		  if StatScene <> nil then		    me.Title = "Scene Statistics - " + StatScene.File.Name		    		    StatList.DeleteAllRows		    		    for i = StatScene.FirstFrame to StatScene.LastFrame step StatScene.FrameStep		      StatList.AddRow Str(i)		      		      if StatScene.Frame(StatScene.ConvertFrameToIndex(i)).Completed then		        if StatScene.Frame(StatScene.ConvertFrameToIndex(i)).TimeEnd = 0 then		          StatList.Cell(StatList.LastIndex, 1) = "Previously Rendered"		        else		          time = StatScene.Frame(StatScene.ConvertFrameToIndex(i)).TimeEnd - StatScene.Frame(StatScene.ConvertFrameToIndex(i)).TimeStart		          		          StatList.Cell(StatList.LastIndex, 1) = GetTimeString(time)		        end if		      else		        StatList.Cell(StatList.LastIndex, 1) = "Incomplete"		      end if		    next		  end if		  		  StatList.ListIndex = oldListIndex		End Sub	#tag EndMethod	#tag Property, Flags = &h0		StatScene As FarmScene	#tag EndProperty#tag EndWindowCode#tag Events StatList	#tag Event		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean		  RefreshTimer.Reset		End Function	#tag EndEvent	#tag Event		Function HeaderPressed(column as Integer) As Boolean		  Return False		End Function	#tag EndEvent#tag EndEvents#tag Events RefreshTimer	#tag Event		Sub Action()		  UpdateList		End Sub	#tag EndEvent#tag EndEvents