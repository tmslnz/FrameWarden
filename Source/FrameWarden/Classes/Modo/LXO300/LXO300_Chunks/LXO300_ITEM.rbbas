#tag ClassProtected Class LXO300_ITEMInherits LXO300_Chunk	#tag Method, Flags = &h0		Function GetRenderExtension() As String		  // This function returns a file extension if there is one		  Dim i As Integer		  Dim renderExt As String		  		  if me.type = "renderOutput" then		    for i = 0 to me.chns.Ubound		      if me.chns(i).channelName = "format" then		        if me.chns(i).stringValue <> "" then		          renderExt = me.chns(i).stringValue		          exit		        end if		      end if		    next		  end if		  		  // Let's get the actual extension		  return me.TranslateExtension(renderExt)		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GetRenderPath() As String		  // This function returns a file output path if there is one		  Dim i As Integer		  Dim renderPath As String		  		  if me.type = "renderOutput" then		    for i = 0 to me.chns.Ubound		      if me.chns(i).channelName = "filename" then		        if me.chns(i).stringValue <> "" then		          Return me.chns(i).stringValue		        end if		      end if		    next		  end if		  		  return ""		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function TranslateExtension(renderExt As String) As String		  Select Case renderExt		  Case "$FLEX"		    Return ".flx"		    		  Case "$Targa", "TGA"		    Return ".tga"		    		  Case "BMP"		    Return ".bmp"		    		  Case "GIF"		    Return ".gif"		    		  Case "HDR"		    Return ".hdr"		    		  Case "JPG"		    Return ".jpg"		    		  Case "PNG"		    Return ".png"		    		  Case "SGI"		    Return ".sgi"		    		  Case "TIF", "TIF16", "TIF16BIG"		    Return ".tif"		    		  Case "XPM"		    Return ".xpm"		    		  Case "openexr"		    Return ".exr"		    		  Case ""		    Return ""		    		  Else		    Return renderExt		  End Select		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub UpdateData()		  Dim subChunkType As String		  Dim chunkSize, i As Integer		  		  // Make sure the marker is at 0		  me.dataMarker = 0		  		  // Let's read the type of ITEM this is such as mesh or light or renderOutput		  me.type = me.ReadString()		  		  // Read the ITEM name		  me.name = me.ReadString()		  		  // Read the reference ID		  me.refID = me.ReadLong()		  		  // Read the sub-chunks		  while dataMarker < me.Size - 4		    subChunkType = me.ReadID4()		    		    Select Case subChunkType		    Case "XREF"		      chunkSize = me.ReadUShort()		      		      me.xref = new ITEM_XREF()		      		      me.xref.index = me.ReadLong		      me.xref.fileName = me.ReadString()		      me.xref.itemIdentifier = me.ReadString()		      		    Case "LAYR"		      chunkSize = me.ReadUShort()		      		      me.layr = new ITEM_LAYR()		      		      me.layr.index = me.ReadLong()		      me.layr.flags = me.ReadLong()		      me.layr.rgb = RGB(me.ReadByte(), me.ReadByte(), me.ReadByte())		      me.layr.alpha = me.ReadByte()		      		    Case "UNIQ"		      chunkSize = me.ReadUShort()		      		      uniq = me.ReadString()		      		    Case "LINK"		      chunkSize = me.ReadUShort()		      		      Redim me.link(me.link.Ubound + 1)		      		      me.link(me.link.Ubound) = new ITEM_LINK()		      		      me.link(me.link.Ubound).type = me.ReadString()		      me.link(me.link.Ubound).refID = me.ReadLong()		      me.link(me.link.Ubound).index = me.ReadLong()		      		    Case "PAKG"		      chunkSize = me.ReadUShort()		      		      Redim me.pakg(me.pakg.Ubound + 1)		      		      me.pakg(me.pakg.Ubound) = new ITEM_PAKG()		      		      me.pakg(me.pakg.Ubound).name = me.ReadString()		      me.pakg(me.pakg.Ubound).dataSize = me.ReadLong()		      Redim me.pakg(me.pakg.Ubound).data(me.pakg(me.pakg.Ubound).dataSize)		      		      for i = 0 to me.pakg(me.pakg.Ubound).dataSize		        me.pakg(me.pakg.Ubound).data(i) = me.ReadByte()		      next		      		    Case "CHNS"		      chunkSize = me.ReadUShort()		      		      Redim me.chns(me.chns.Ubound + 1)		      		      me.chns(me.chns.Ubound) = new ITEM_CHNS()		      me.chns(me.chns.Ubound).channelName = me.ReadString()		      me.chns(me.chns.Ubound).stringValue = me.ReadString()		      		    Case "CHNL"		      chunkSize = me.ReadUShort()		      		      dataMarker = dataMarker + chunkSize		      		    Case Else		      // dataMarker = dataMarker - 3		      chunkSize = me.ReadUShort()		      		      dataMarker = dataMarker + chunkSize		    End Select		  wend		  		End Sub	#tag EndMethod	#tag Property, Flags = &h0		chns(-1) As ITEM_CHNS	#tag EndProperty	#tag Property, Flags = &h0		layr As ITEM_LAYR	#tag EndProperty	#tag Property, Flags = &h0		link(-1) As ITEM_LINK	#tag EndProperty	#tag Property, Flags = &h0		name As String	#tag EndProperty	#tag Property, Flags = &h0		pakg(-1) As ITEM_PAKG	#tag EndProperty	#tag Property, Flags = &h0		refID As Integer	#tag EndProperty	#tag Property, Flags = &h0		type As String	#tag EndProperty	#tag Property, Flags = &h0		uniq As String	#tag EndProperty	#tag Property, Flags = &h0		xref As ITEM_XREF	#tag EndProperty	#tag ViewBehavior		#tag ViewProperty			Name="chunkNumber"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="LXO300_Chunk"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="refID"			Group="Behavior"			InitialValue="0"			Type="Integer"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="type"			Group="Behavior"			Type="String"			EditorType="MultiLineEditor"		#tag EndViewProperty		#tag ViewProperty			Name="uniq"			Group="Behavior"			Type="String"			EditorType="MultiLineEditor"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass