#tag ClassProtected Class Farm	#tag Method, Flags = &h0		Function AddNode(nodeInfo As String) As Integer		  Dim newNode As Node		  Dim nodeName, IP, platform As String		  Dim primaryGroup, secondaryGroup As UInt8		  		  // Parse the name, IP, platform, etc... data		  // The data is received in the form of "Name@192.168.1.x@MacOS@etc..."		  		  /// Get the data to the left of the '@'		  nodeName = Left(nodeInfo, InStr(nodeInfo, "@") - 1)		  /// Get the data to the right of the '@'		  nodeInfo = Right(nodeInfo, Len(nodeInfo) - InStr(nodeInfo, "@")) 		  /// left		  IP = Left(nodeInfo, InStr(nodeInfo, "@") - 1)		  // right		  nodeInfo = Right(nodeInfo, Len(nodeInfo) - InStr(nodeInfo, "@"))		  /// left		  primaryGroup = Val(Left(nodeInfo, InStr(nodeInfo, "@") - 1))		  // right		  nodeInfo = Right(nodeInfo, Len(nodeInfo) - InStr(nodeInfo, "@"))		  /// left		  secondaryGroup = Val(Left(nodeInfo, InStr(nodeInfo, "@") - 1))		  // right		  nodeInfo = Right(nodeInfo, Len(nodeInfo) - InStr(nodeInfo, "@"))		  		  		  // Get what's left over		  platform = nodeInfo		  		  if not NodeExists(nodeName) then		    newNode = new Node		    		    Nodes.Append newNode		    		    // Set the name and IP data		    Nodes(Nodes.Ubound).Name = nodeName		    Nodes(Nodes.Ubound).ModoSocket.Address = IP		    Nodes(Nodes.Ubound).ClientSocket.Address = IP		    Nodes(Nodes.Ubound).ClientSocket.Port = 47597		    Nodes(Nodes.Ubound).PrimaryGroup = primaryGroup		    Nodes(Nodes.Ubound).SecondaryGroup = secondaryGroup		    Nodes(Nodes.Ubound).Platform = platform		    Nodes(Nodes.Ubound).frameToRender = gNoFrameToRender		    		    // Try and connect		    Nodes(Nodes.Ubound).ClientSocket.Connect		    		    return -1		  else		    Nodes(GetNodeIndexWithName(nodeName)).ClientSocket.Address = IP		    Nodes(GetNodeIndexWithName(nodeName)).ClientSocket.Port = 47597		    		    Return GetNodeIndexWithName(nodeName)		  end if		  		  return -1		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function AddScene() As Boolean		  Dim modoSceneFile As FolderItem		  		  modoSceneFile = GetOpenFolderItem("modo")		  		  if (me.AddScene(modoSceneFile)) then		    return true		  else		    return false		  end if		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function AddScene(modoSceneFile As FolderItem) As Boolean		  Dim newSceneObj As FarmScene		  Dim modoData As LXO300_Data		  Dim i as Int32		  Dim vmapString As String		  		  modoData = new LXO300_Data		  		  if modoSceneFile <> nil then		    if modoSceneFile.exists then		      // Increase the scene ID by 1 so that we can keep track of each scene		      me.Current_ID = me.Current_ID + 1		      		      newSceneObj = new FarmScene		      modoData.Read(modoSceneFile)		      		      Scenes.Append newSceneObj		      Scenes(Scenes.Ubound).Status = FarmScene.snStopped		      		      // Get the first and last frames		      Scenes(Scenes.Ubound).FirstFrame = modoData.GetFirstFrame()		      Scenes(Scenes.Ubound).LastFrame = modoData.GetLastFrame()		      		      // Initial groups		      Scenes(Scenes.Ubound).Group_Primary = 1		      Scenes(Scenes.Ubound).Group_Secondary = 1		      		      // Frame Path and Extension		      		      Scenes(Scenes.Ubound).FramesPath = modoData.GetRenderPath()		      Scenes(Scenes.Ubound).FramesExtension = modoData.GetRenderExtension()		      		      		      // Read UV Map Names		      for i = 0 to modoData.VMAP.Ubound		        if modoData.VMAP(i).type = "TXUV" then		          vmapString = modoData.VMAP(i).name()		          		          Scenes(Scenes.Ubound).VMAP.Append vmapString		        end if		      next		      		      		      // These are temporary!!!		      Scenes(Scenes.Ubound).FirstFrame = 1		      Scenes(Scenes.Ubound).LastFrame = 120		      Scenes(Scenes.Ubound).FrameStep = 1		      Scenes(Scenes.Ubound).SetScene(modoSceneFile)		      		      Scenes(Scenes.Ubound).CurrentFrame = Scenes(Scenes.Ubound).FirstFrame		      Scenes(Scenes.Ubound).ID = me.Current_ID		      		      QueueWindow.SceneList.AddRow(modoSceneFile.Name)		      		      return true		    end if		  end if		  		  return false		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function AddSceneWithoutFile() As FarmScene		  Dim newScene As FarmScene		  		  me.Current_ID = me.Current_ID + 1		  		  // Simply make a new scene and append it to the list		  newScene = new FarmScene()		  Scenes.Append newScene		  Scenes(Scenes.Ubound).ID = me.Current_ID		  		  return newScene		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function FirstNodeRendering() As Int32		  Dim i as Int32		  		  for i = 0 to Nodes.Ubound		    if Nodes(i).Rendering then		      WriteToLog "Node " + Str(i) + " rendering", LogFuncs.General		      return i		    end if		  next		  		  return -1		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GetFarmSaveData() As String		  Dim outString As String		  Dim i as integer		  		  // This is the current version of the scene list		  outString = "Frame Warden 103" + chr(13)		  		  // This is the number of scenes		  outString = outString + Str(me.Scenes.Ubound + 1) + chr(13)		  		  if me.Scenes.Ubound <> -1 then		    for i = 0 to me.Scenes.Ubound		      outString = outString + me.Scenes(i).BuildSaveFileData		    next		  end if		  		  return outString		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GetFirstActiveScene() As Int32		  return GetFirstActiveScene(0,0)		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GetFirstActiveScene(group1 As Int32, group2 As Int32) As Int32		  Dim sceneNum As Int32		  Dim groupMatch As Boolean		  		  // This gets the first active scene and returns the array index		  if TheFarm.Scenes.Ubound <> -1 then		    for sceneNum = 0 to TheFarm.Scenes.Ubound		      // Is the scene actually running?		      if NOT TheFarm.Scenes(sceneNum).IsDone() then		        if TheFarm.Scenes(sceneNum).Running() then		          // Here we will find out whether or not any of the groups match the scene and nodes		          groupMatch = False		          		          // Zero is a generic number just to see what scene is rendering		          if group1 = 0 and group2 = 0 then		            groupMatch = True		          elseif TheFarm.Scenes(sceneNum).Group_Primary = group1 then		            groupMatch = True		          elseif TheFarm.Scenes(sceneNum).Group_Primary = group2 then		            groupMatch = True		          elseif TheFarm.Scenes(sceneNum).Group_Secondary = group1 then		            groupMatch = True		          elseif TheFarm.Scenes(sceneNum).Group_Secondary = group2 then		            groupMatch = True		          end if		          		          if groupMatch then		            Return sceneNum		          end if		        end if		      end if		    next		  end if		  		  Return -1		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GetNextRenderFrame(sceneID As Integer) As Integer		  Dim sceneNum, frame As Integer		  		  sceneNum = GetSceneIndexByID(sceneID)		  		  if sceneNum <> -1 then		    frame = TheFarm.Scenes(sceneNum).GetNextFrame()		    		    if TheFarm.Scenes(sceneNum).Running then		      TheFarm.Scenes(sceneNum).Status = FarmScene.snRendering		    end if		  else		    return gNoFrameToRender		  end if		  		  // If there aren't any more frames send back the "No frame to render" number		  Return frame		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GetNodeIndexWithIP(IP As String) As Integer		  Dim i As Int32		  		  for i = 0 to Nodes.Ubound		    if Nodes(i).ModoSocket.Address = IP then		      Return i		    end if		  next		  		  Return -1		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GetNodeIndexWithName(nodeName As String) As Int32		  Dim i As Int32		  		  for i = 0 to Nodes.Ubound		    if Nodes(i).Name = nodeName then		      Return i		    end if		  next		  		  Return -1		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GetRelaunchNode() As Integer		  Dim i as Integer		  		  // This function will return the index to a node that has been unresponsive for the given amount of time		  if gNoResponseRelaunchTime > 0 then		    if Nodes.Ubound >=0 then		      for i = 0 to Nodes.Ubound		        if (Nodes(i).ModoSocket.LastResponse + (gNoResponseRelaunchTime * 3600)) < Ticks() then		          // Add a minute to the LastResponse time to give it time to relaunch and respond		          Nodes(i).ModoSocket.LastResponse = Nodes(i).ModoSocket.LastResponse + 3600		          Return i		        end if		      next		    end if		  end if		  		  return -1		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GetSceneIndexByID(sceneID As Int32) As Int32		  Dim i As Int32		  		  if Scenes.Ubound <> -1 then		    for i = 0 to Scenes.Ubound		      if Scenes(i).ID = sceneID then		        Return i		      end if		    next		  end if		  		  Return -1		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GetScenePathByID(theID As Integer) As String		  Dim firstScene As Int32		  Dim i as Int32		  		  if Scenes.Ubound <> -1 then		    for i = 0 to Scenes.Ubound		      if Scenes(i).ID = theID then		        return Scenes(i).File.AbsolutePath		      end if		    next		  end if		  		  return "nil"		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GetSceneRenderingID(group1 As Int32, group2 As Int32) As Int32		  if me.GetFirstActiveScene(group1, group2) = -1 then		    return -1		  end if		  		  return me.Scenes(me.GetFirstActiveScene(group1, group2)).ID		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub LoadScenes101(Byref tIn as TextInputStream, sceneCount As Integer)		  Dim f as FolderItem		  Dim i, sceneInc as integer		  Dim tempScene As FarmScene		  Dim modoData As LXO300_Data		  Dim junk As String		  		  for sceneInc = 1 to sceneCount		    GenericFeedbackWindow.Show		    GenericFeedbackWindow.StaticText1.Refresh False		    // This is the LXO file path		    f = GetFolderItem(tIn.ReadLine)		    		    // If the LXO file exists then we can add it to the list		    if f <> nil then		      if f.Exists then		        // Increase the scene ID by 1 so that we can keep track of each scene		        me.Current_ID = me.Current_ID + 1		        		        tempScene = new FarmScene		        		        tempScene.File = f		        		        tempScene.Status =  Val(tIn.ReadLine)		        		        // Check for frames?		        if tIn.ReadLine = "1" then		          tempScene.CheckForFrames = True		          		          // Read the LXO and set the data the coresponds with it		          modoData = new LXO300_Data		          		          modoData.Read(f)		          		          tempScene.FramesPath = modoData.GetRenderPath()		          tempScene.FramesExtension = modoData.GetRenderExtension()		        else		          tempScene.CheckForFrames = False		        end if		        		        tempScene.MaxFrameTime = Val(tIn.ReadLine)		        		        // Initial groups		        tempScene.Group_Primary = Val(tIn.ReadLine)		        tempScene.Group_Secondary = Val(tIn.ReadLine)		        		        // Read first, last, and frame step		        tempScene.FirstFrame =  Val(tIn.ReadLine)		        tempScene.LastFrame =  Val(tIn.ReadLine)		        tempScene.FrameStep =  Val(tIn.ReadLine)		        		        // Here we'll initialize the frame completed status		        tempScene.InitFramesStatus()		        		        // Make sure we chack for frames before we go through the file		        if tempScene.CheckForFrames then		          if tempScene.CheckForRenderedFrames() then		            // MsgBox "Didn't check for frames: no path specified."		          end if		        end if		        		        for i = 0 to tempScene.GetFrameLastIndex		          if tIn.ReadLine = "1" then		            tempScene.Frame(i).Distributed = True		            tempScene.Frame(i).Completed = True		            tempScene.Frame(i).TimeStart = Val(tIn.ReadLine)		            tempScene.Frame(i).TimeEnd = Val(tIn.ReadLine)		          end if		        next		        		        tempScene.CurrentFrame = tempScene.FirstFrame		        tempScene.ID = me.Current_ID		        		        me.Scenes.Append tempScene		        		        // We need to add a row to the scene list		        QueueWindow.SceneList.AddRow("")		      else		        junk = tIn.ReadLine // Status data		        junk = tIn.ReadLine  // Check Frames Boolean		        junk = tIn.ReadLine // Check MaxTime		        junk = tIn.ReadLine // Check Group 1		        junk = tIn.ReadLine // Check Group 2		        		        tempScene = new FarmScene		        		        tempScene.FirstFrame = Val(tIn.ReadLine)		        tempScene.LastFrame = Val(tIn.ReadLine)		        tempScene.FrameStep = Val(tIn.ReadLine)		        		        for i = 0 to tempScene.GetFrameLastIndex		          junk = tIn.ReadLine		        next		      end if		    else		      junk = tIn.ReadLine // Status data		      junk = tIn.ReadLine  // Check Frames Boolean		      junk = tIn.ReadLine // Check MaxTime		      junk = tIn.ReadLine // Check Group 1		      junk = tIn.ReadLine // Check Group 2		      		      tempScene = new FarmScene		      		      tempScene.FirstFrame = Val(tIn.ReadLine)		      tempScene.LastFrame = Val(tIn.ReadLine)		      tempScene.FrameStep = Val(tIn.ReadLine)		      		      for i = 0 to tempScene.GetFrameLastIndex		        junk = tIn.ReadLine		      next		    end if		  next		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub LoadScenes102(Byref tIn as TextInputStream, sceneCount As Integer)		  Dim f as FolderItem		  Dim i, sceneInc as integer		  Dim tempScene As FarmScene		  Dim modoData As LXO300_Data		  Dim junk As String		  		  for sceneInc = 1 to sceneCount		    GenericFeedbackWindow.Show		    GenericFeedbackWindow.StaticText1.Refresh False		    // This is the LXO file path		    f = GetFolderItem(tIn.ReadLine)		    		    // If the LXO file exists then we can add it to the list		    if f <> nil then		      if f.Exists then		        // Increase the scene ID by 1 so that we can keep track of each scene		        me.Current_ID = me.Current_ID + 1		        		        tempScene = new FarmScene		        		        tempScene.File = f		        		        tempScene.Status =  Val(tIn.ReadLine)		        		        // Check for frames?		        if tIn.ReadLine = "1" then		          tempScene.CheckForFrames = True		          		          // Read the LXO and set the data the coresponds with it		          modoData = new LXO300_Data		          		          modoData.Read(f)		          		          tempScene.FramesPath = modoData.GetRenderPath()		          tempScene.FramesExtension = modoData.GetRenderExtension()		        else		          tempScene.CheckForFrames = False		        end if		        		        		        // The Bucket Render Prefs		        if tIn.ReadLine = "1" then		          tempScene.BucketRender = True		        else		          tempScene.BucketRender = False		        end if		        		        tempScene.BucketRenderMaxComputers = Val(tIn.ReadLine)		        		        		        // Maximum frame time		        tempScene.MaxFrameTime = Val(tIn.ReadLine)		        		        // Initial groups		        tempScene.Group_Primary = Val(tIn.ReadLine)		        tempScene.Group_Secondary = Val(tIn.ReadLine)		        		        // Read first, last, and frame step		        tempScene.FirstFrame =  Val(tIn.ReadLine)		        tempScene.LastFrame =  Val(tIn.ReadLine)		        tempScene.FrameStep =  Val(tIn.ReadLine)		        		        // Here we'll initialize the frame completed status		        tempScene.InitFramesStatus()		        		        // Make sure we chack for frames before we go through the file		        if tempScene.CheckForFrames then		          if tempScene.CheckForRenderedFrames() then		            // MsgBox "Didn't check for frames: no path specified."		          end if		        end if		        		        for i = 0 to tempScene.GetFrameLastIndex		          if tIn.ReadLine = "1" then		            tempScene.Frame(i).Distributed = True		            tempScene.Frame(i).Completed = True		            tempScene.Frame(i).TimeStart = Val(tIn.ReadLine)		            tempScene.Frame(i).TimeEnd = Val(tIn.ReadLine)		          end if		        next		        		        tempScene.CurrentFrame = tempScene.FirstFrame		        tempScene.ID = me.Current_ID		        		        me.Scenes.Append tempScene		        		        // We need to add a row to the scene list		        QueueWindow.SceneList.AddRow("")		      else		        junk = tIn.ReadLine // Status data		        junk = tIn.ReadLine  // Check Frames Boolean		        junk = tIn.ReadLine // Check MaxTime		        junk = tIn.ReadLine // Check Group 1		        junk = tIn.ReadLine // Check Group 2		        		        tempScene = new FarmScene		        		        tempScene.FirstFrame = Val(tIn.ReadLine)		        tempScene.LastFrame = Val(tIn.ReadLine)		        tempScene.FrameStep = Val(tIn.ReadLine)		        		        for i = 0 to tempScene.GetFrameLastIndex		          junk = tIn.ReadLine		        next		      end if		    else		      junk = tIn.ReadLine // Status data		      junk = tIn.ReadLine  // Check Frames Boolean		      junk = tIn.ReadLine // Check MaxTime		      junk = tIn.ReadLine // Check Group 1		      junk = tIn.ReadLine // Check Group 2		      		      tempScene = new FarmScene		      		      tempScene.FirstFrame = Val(tIn.ReadLine)		      tempScene.LastFrame = Val(tIn.ReadLine)		      tempScene.FrameStep = Val(tIn.ReadLine)		      		      for i = 0 to tempScene.GetFrameLastIndex		        junk = tIn.ReadLine		      next		    end if		  next		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub LoadScenes103(Byref tIn as TextInputStream, sceneCount As Integer)		  Dim f as FolderItem		  Dim i, sceneInc, vmapIndex as integer		  Dim tempScene As FarmScene		  Dim modoData As LXO300_Data		  Dim foundUV As Boolean		  Dim junk As String		  		  for sceneInc = 1 to sceneCount		    GenericFeedbackWindow.Show		    GenericFeedbackWindow.StaticText1.Refresh False		    // This is the LXO file path		    f = GetFolderItem(tIn.ReadLine)		    		    // If the LXO file exists then we can add it to the list		    if f <> nil then		      if f.Exists then		        // Read the LXO and set the data the coresponds with it		        modoData = new LXO300_Data()		        		        modoData.Read(f)		        		        // Increase the scene ID by 1 so that we can keep track of each scene		        me.Current_ID = me.Current_ID + 1		        		        tempScene = new FarmScene		        		        tempScene.File = f		        		        tempScene.Status = Val(tIn.ReadLine)		        		        // Save info for baking and for Layered output		        tempScene.ManualOuputPath = tIn.ReadLine		        tempScene.RenderType = Val(tIn.ReadLine)		        		        // Read in the VMAPs		        for vmapIndex = 0 to modoData.VMAP.Ubound		          if modoData.VMAP(vmapIndex).type = "TXUV" then		            tempScene.VMAP.Append modoData.VMAP(vmapIndex).name()		          end if		        next		        		        		        junk = tIn.ReadLine		        		        for vmapIndex = 0 to tempScene.VMAP.Ubound		          if tempScene.VMAP(vmapIndex) = junk then		            tempScene.VMAPIndex = vmapIndex		            foundUV = true		          end if		        next		        		        		        // Are we baking or not		        if tIn.ReadLine = "1" then		          tempScene.Bake = true		          		          // If we didn't find a UV map then we want to make sure the scene is stopped		          if not foundUV then		            tempScene.Status = FarmScene.snStopped		          end if		        else		          tempScene.Bake = false		        end if		        		        		        // Check for frames?		        if tIn.ReadLine = "1" then		          tempScene.CheckForFrames = True		          		          tempScene.FramesPath = modoData.GetRenderPath()		          tempScene.FramesExtension = modoData.GetRenderExtension()		        else		          tempScene.CheckForFrames = False		        end if		        		        		        // The Bucket Render Prefs		        if tIn.ReadLine = "1" then		          tempScene.BucketRender = True		        else		          tempScene.BucketRender = False		        end if		        		        tempScene.BucketRenderMaxComputers = Val(tIn.ReadLine)		        		        		        // Maximum frame time		        tempScene.MaxFrameTime = Val(tIn.ReadLine)		        		        // Initial groups		        tempScene.Group_Primary = Val(tIn.ReadLine)		        tempScene.Group_Secondary = Val(tIn.ReadLine)		        		        // Read first, last, and frame step		        tempScene.FirstFrame =  Val(tIn.ReadLine)		        tempScene.LastFrame =  Val(tIn.ReadLine)		        tempScene.FrameStep =  Val(tIn.ReadLine)		        		        // Here we'll initialize the frame completed status		        tempScene.InitFramesStatus()		        		        // Make sure we chack for frames before we go through the file		        if tempScene.CheckForFrames then		          if tempScene.CheckForRenderedFrames() then		            // MsgBox "Didn't check for frames: no path specified."		          end if		        end if		        		        for i = 0 to tempScene.GetFrameLastIndex		          if tIn.ReadLine = "1" then		            tempScene.Frame(i).Distributed = True		            tempScene.Frame(i).Completed = True		            tempScene.Frame(i).TimeStart = Val(tIn.ReadLine)		            tempScene.Frame(i).TimeEnd = Val(tIn.ReadLine)		          end if		        next		        		        tempScene.CurrentFrame = tempScene.FirstFrame		        tempScene.ID = me.Current_ID		        		        me.Scenes.Append tempScene		        		        // We need to add a row to the scene list		        QueueWindow.SceneList.AddRow("")		      else		        junk = tIn.ReadLine // Status data		        junk = tIn.ReadLine  // Check Frames Boolean		        junk = tIn.ReadLine // Check MaxTime		        junk = tIn.ReadLine // Check Group 1		        junk = tIn.ReadLine // Check Group 2		        		        tempScene = new FarmScene		        		        tempScene.FirstFrame = Val(tIn.ReadLine)		        tempScene.LastFrame = Val(tIn.ReadLine)		        tempScene.FrameStep = Val(tIn.ReadLine)		        		        for i = 0 to tempScene.GetFrameLastIndex		          junk = tIn.ReadLine		        next		      end if		    else		      junk = tIn.ReadLine // Status data		      junk = tIn.ReadLine  // Check Frames Boolean		      junk = tIn.ReadLine // Check MaxTime		      junk = tIn.ReadLine // Check Group 1		      junk = tIn.ReadLine // Check Group 2		      		      tempScene = new FarmScene		      		      tempScene.FirstFrame = Val(tIn.ReadLine)		      tempScene.LastFrame = Val(tIn.ReadLine)		      tempScene.FrameStep = Val(tIn.ReadLine)		      		      for i = 0 to tempScene.GetFrameLastIndex		        junk = tIn.ReadLine		      next		    end if		    		    QueueWindow.UpdateSceneList()		    QueueWindow.Refresh()		  next		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub LoadScenesFromFarmSaveData()		  Dim f as FolderItem		  Dim tIn As TextInputStream		  Dim checkStr As String		  Dim i, sceneInc, sceneCount as integer		  Dim tempScene As FarmScene		  Dim modoData As LXO300_Data		  		  GenericFeedbackWindow.StaticText1.text = "Please wait.. reading LXO data"		  GenericFeedbackWindow.StaticText1.Refresh False		  		  #if TargetMacOS then		    f = GetFolderItem(SpecialFolder.Preferences.AbsolutePath + "FrameWardenData")		  #elseif TargetWin32 then		    f = GetFolderItem(SpecialFolder.Preferences.AbsolutePath + "\FrameWardenData")		  #endif		  		  if f <> nil then		    if NOT f.exists then		      f.CreateAsFolder		    end if		  end if		  		  		  // Read the Preferences data		  tIn = f.Child("ServerScenes.txt").OpenAsTextFile		  		  // We need to see if the file actually exists		  if tIn <> nil then		    checkStr = tIn.ReadLine		    		    if checkStr = "Frame Warden 103" then		      LoadScenes103(tIn, Val(tIn.ReadLine))		    elseif checkStr = "Frame Warden 102" then		      LoadScenes102(tIn, Val(tIn.ReadLine))		    else		      LoadScenes101(tIn, Val(checkStr))		    end if		    		    // Let's check for frames in all the newly loaded scenes and see if they're done		    for i = 0 to Scenes.Ubound		      if Scenes(i).CheckForRenderedFrames() then		        if Scenes(i).IsDone then		        end if		      end if		    next		  end if		  		  GenericFeedbackWindow.Hide()		  QueueWindow.UpdateSceneList()		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub MarkSceneFrameAsCompleted(sceneID As Integer, frameNum As Integer)		  Dim sceneNum As Integer		  		  sceneNum = GetSceneIndexByID(sceneID)		  		  if sceneNum > -1 then		    if sceneNum <= Scenes.Ubound then		      TheFarm.Scenes(sceneNum).MarkFrameAsCompleted(frameNum)		    end if		  end if		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function NodeExists(nodeName As String) As Boolean		  Dim i as Int32		  		  if Nodes.Ubound <> -1 then		    for i = 0 to Nodes.Ubound		      if Nodes(i).Name = nodeName then		        return True		      end if		    next		  end if		  		  return False		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub QuitAll()		  Dim i as Int32		  		  if Nodes.Ubound > -1 then		    for i = 0 to Nodes.Ubound		      Nodes(i).Command = nc.quit		    next		  end if		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub RemoveNode(index as Integer)		  TheFarm.Nodes.Remove index		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ResetAppPathForNodes()		  Dim i as integer		  		  if me.Nodes.Ubound <> -1 then		    for i = 0 to me.Nodes.Ubound		      me.Nodes(i).HasAppPath = False		    next		  end if		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ResetNode(index As Integer)		  me.Nodes(index).Reset()		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub SetSceneFrameRange(sceneNum As Int32, first As Int32, last As Int32, frameStep As Int32)		  Scenes(sceneNum).FirstFrame = first		  Scenes(sceneNum).LastFrame = last		  Scenes(sceneNum).FrameStep = frameStep		  		  // We don't want to screw up the rendering by starting back over, so, make sure the scene is stopped before setting the first frame		  if Scenes(sceneNum).Status <> FarmScene.snRendering then		    Scenes(sceneNum).CurrentFrame = first		  end if		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub UpdateAllScenesStatus()		  Dim nodeIndex, sceneIndex As Integer		  Dim isStatusCorrect As Boolean		  		  if me.Nodes.Ubound <> -1 then		    if me.Scenes.Ubound <> -1 then		      For sceneIndex = 0 to me.Scenes.Ubound		        // we need to assume it isn't true		        isStatusCorrect = False		        		        if me.Scenes(sceneIndex).CheckForOverdueFrames() then		          WriteToLog "A Frame in " + me.Scenes(sceneIndex).File.Name + " is overdue.", LogFuncs.General		        end if		        		        // If it claims that it's rendering		        if me.Scenes(sceneIndex).Status = FarmScene.snRendering then		          For nodeIndex = 0 to me.Nodes.Ubound		            // If a node is indeed rendering this scene		            if me.Nodes(nodeIndex).CurrentSceneID = me.Scenes(sceneIndex).ID then		              // mark it as correct		              isStatusCorrect = True		              exit		            end if		          next		          		          // if it isn't correct that it's rendering		          if NOT isStatusCorrect then		            // mark it as just queued		            me.Scenes(sceneIndex).Status = FarmScene.snQueued		          end if		        end if		      next		    end if		  end if		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub UpdateNextNode()		  Static nodeIndex As Integer		  		  // Make sure we aren't going past out number of nodes		  if nodeIndex > TheFarm.Nodes.Ubound then		    nodeIndex = 0		  end if		  		  // Check the current node data		  if me.Nodes.Ubound <> -1 then		    me.Nodes(nodeIndex).CheckData()		    		    if me.Nodes(nodeIndex).Command = nc.Shutdown then		      me.Nodes.Remove nodeIndex		    end if		  end if		  		  // Make sure we go to the next node next time		  nodeIndex = nodeIndex + 1		End Sub	#tag EndMethod	#tag Property, Flags = &h0		Current_ID As Int32	#tag EndProperty	#tag Property, Flags = &h0		Nodes(-1) As Node	#tag EndProperty	#tag Property, Flags = &h0		Scenes(-1) As FarmScene	#tag EndProperty	#tag ViewBehavior		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass