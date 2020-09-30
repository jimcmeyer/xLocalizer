#tag Module
Protected Module googleModule
	#tag Method, Flags = &h0
		Function getGoogleLangs() As Dictionary
		  dim s as string
		  
		  dim js as new JSONItem
		  dim languages as JSONItem
		  dim language as JSONItem
		  
		  dim dict as new Dictionary
		  dim urlc as new URLConnection
		  
		  dim result as string
		  dim i as integer
		  
		  if app.keys.googleAPIKey.len > 0 then
		    
		    try
		      result = urlc.SendSync("GET", "https://translation.googleapis.com/language/translate/v2/languages?target=en&key="+app.keys.googleAPIKey, 30)
		      result = DefineEncoding(result, Encodings.UTF8)
		      
		      try
		        js = new JSONItem(result)
		        if js.HasName("data") and js.Child("data").HasName("languages") then
		          languages = js.Child("data").child("languages")
		          
		          for i = 0 to languages.Count - 1
		            language = languages.Child(i)
		            //  if added 1.2.1 since Chinese codes are different for Xojo ...  including _ instead of -
		            if language.Value("language") = "zh" then
		              dict.Value("zh_CN") = language.Value("name")
		            ElseIf language.Value("language") = "zh-TW" then
		              dict.Value("zh_TW") = language.Value("name")
		            else
		              dict.Value(language.Value("language")) = language.Value("name")
		            end if
		          next
		        else
		          s = js.Child("error").Value("message")
		          MsgBox("Error trying to get Languages!  ("+s+")")
		        end if
		        
		      catch
		        MsgBox("Error trying to load Language List! (Response not JSON)")
		      end try
		      
		    Catch e as RuntimeException
		      MsgBox("Error getting language list (exception) "+ e.Message)
		    end try
		    
		  end if
		  
		  return dict
		End Function
	#tag EndMethod


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
	#tag EndViewBehavior
End Module
#tag EndModule
