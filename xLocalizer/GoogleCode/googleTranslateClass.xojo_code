#tag Class
Protected Class googleTranslateClass
	#tag Method, Flags = &h0
		Function doit() As Boolean
		  dim i as integer
		  
		  dim payloadJSON as new JSONItem
		  dim payload as string
		  dim urlc as new URLConnection
		  
		  dim result as string
		  dim transJSON as JSONItem
		  dim transJSONs as JSONItem
		  
		  payloadJSON.Value("q") = self.sourcetext
		  payloadJSON.Value("format") = "text"
		  payloadJSON.Value("source") = self.srcLangCode
		  payloadJSON.Value("target") = self.targetLangCode
		  
		  payload = payloadJSON.ToString
		  urlc.SetRequestContent(payload, "application/json")
		  try
		    result = urlc.SendSync("POST", "https://www.googleapis.com/language/translate/v2?key="+self.apikey, 30)
		    result = DefineEncoding(result, Encodings.UTF8)
		    
		    if result.len = 0 then
		      self.errMess = "No answer from Google"
		      return false
		    end if
		    
		    try
		      transJSON = new JSONItem(result)
		      transJSONs = transJSON.Child("data").Child("translations")
		      for i = 0 to transJSONs.Count - 1
		        self.targetText = self.targetText + transJSONs.Child(i).Value("translatedText")
		      next
		    Catch
		      self.errMess = result
		      return false
		    end
		    
		  catch e as RuntimeException
		    self.errMess = e.Message
		    Return false
		  end try
		  
		  return true
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		apikey As string
	#tag EndProperty

	#tag Property, Flags = &h0
		errMess As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sourcetext As String
	#tag EndProperty

	#tag Property, Flags = &h0
		srcLangCode As String
	#tag EndProperty

	#tag Property, Flags = &h0
		targetLangCode As String
	#tag EndProperty

	#tag Property, Flags = &h0
		targetText As string
	#tag EndProperty


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
			Name="sourcetext"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="apikey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="srcLangCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="targetLangCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="targetText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="errMess"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
