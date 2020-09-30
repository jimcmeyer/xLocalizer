#tag Class
Protected Class AWSTranslateTextClass
	#tag Method, Flags = &h0
		Function doit() As Boolean
		  //AWS Reference:  https://docs.aws.amazon.com/translate/latest/dg/API_TranslateText.html
		  
		  dim pj as new JSONItem
		  
		  self.err = false
		  
		  pj = New JSONItem
		  pj.Value("SourceLanguageCode") = self.SourceLanguageCode
		  pj.Value("TargetLanguageCode") = self.TargetLanguageCode
		  pj.Value("Text") = self.sourceText
		  
		  dim aws as new AWSAIClass
		  aws.accessKey = self.accessKey
		  aws.secretkey = self.secretKey
		  
		  aws.amzTarget = "AWSShineFrontendService_20170701.TranslateText"
		  aws.region = self.region
		  aws.timeout = 30
		  aws.payloadJSON = pj
		  aws.service = "translate"
		  
		  if not aws.go() then
		    self.err = true
		    self.errMess = aws.errMess
		  else
		    self.resultJSON = aws.resultJSON
		    if aws.resultJSON.HasName("TranslatedText") then
		      self.targetText = aws.resultJSON.Value("TranslatedText")
		    else
		      self.err = true
		      self.errMess = aws.resultJSON.ToString
		    end if
		  end if
		  
		  if self.err then
		    return false
		  end if
		  return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		accessKey As string
	#tag EndProperty

	#tag Property, Flags = &h0
		err As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		errMess As string
	#tag EndProperty

	#tag Property, Flags = &h0
		region As string
	#tag EndProperty

	#tag Property, Flags = &h0
		resultJSON As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h0
		secretKey As string
	#tag EndProperty

	#tag Property, Flags = &h0
		sourceLanguageCode As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sourceText As String
	#tag EndProperty

	#tag Property, Flags = &h0
		targetLanguageCode As string
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
			Name="sourceLanguageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="targetLanguageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sourceText"
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
			Name="err"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="errMess"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="accessKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="region"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="secretKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
