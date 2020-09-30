#tag Class
Protected Class keysClass
	#tag Method, Flags = &h0
		Sub getKeys()
		  dim f as FolderItem
		  dim tin as TextInputStream
		  dim js as JSONItem
		  
		  self.awsAccessKey = ""
		  self.awsSecretKey = ""
		  self.googleAPIKey = ""
		  
		  f = SpecialFolder.Preferences.Child(self.keyFileName)
		  
		  if f.Exists then
		    tin = TextInputStream.Open(f)
		    if tin <> nil then
		      try
		        js = new JSONItem(tin.ReadAll)
		        self.awsAccessKey = js.Value("awsAccessKey")
		        self.awsSecretKey = js.Value("awsSecretKey")
		        self.googleAPIKey = js.Value("googleAPIKey")
		      catch
		        MsgBox("Error reading 'Keys'")
		      end try
		    end if
		    tin.Close
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub saveKeys()
		  dim f as FolderItem
		  dim tout as TextOutputStream
		  dim js as new JSONItem
		  
		  f = SpecialFolder.Preferences.Child(self.keyFileName)
		  
		  js.Value("awsAccessKey") = self.awsAccessKey
		  js.Value("awsSecretKey") = self.awsSecretKey
		  js.Value("googleAPIKey") = self.googleAPIKey
		  
		  if f.Exists then 
		    f.Delete
		  end if
		  
		  tout = TextOutputStream.Create(f)
		  if tout <> nil then
		    tout.Write(js.ToString)
		    tout.Close
		  else
		    MsgBox("Unable to save 'Keys'")
		  end if
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		awsAccessKey As String
	#tag EndProperty

	#tag Property, Flags = &h0
		awsSecretKey As String
	#tag EndProperty

	#tag Property, Flags = &h0
		googleAPIKey As String
	#tag EndProperty


	#tag Constant, Name = keyFileName, Type = String, Dynamic = False, Default = \"xLocalizerKeys.json", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="awsAccessKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="awsSecretKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="googleAPIKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
