#tag Class
Protected Class AWSAIClass
	#tag Method, Flags = &h0
		Sub Constructor()
		  self.timeout = 60
		  self.contentType = "application/x-amz-json-1.1"
		  self.method = "POST"
		  self.canonicalURI = "/"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function go() As Boolean
		  dim result as string
		  dim err as Boolean
		  
		  dim d as date
		  dim amzdate as string 
		  dim datestamp as string
		  
		  dim payload, payloadNil as string
		  dim nl as string
		  
		  dim canonicalQueryString as string
		  dim payloadHash as string
		  dim signedHeaders as string 
		  dim canonicalHeaders as string
		  dim canonicalRequest as string
		  dim hashCanonicalRequest as string
		  
		  dim algorithm as string
		  dim credentialScope as string 
		  dim stringToSign as string
		  
		  dim signature as string
		  dim kdate as string
		  dim kregion as string
		  dim kservice as string
		  dim signingKey as string
		  dim authorizationHeader as string
		  
		  dim host as string
		  
		  nl = chr(10)
		  
		  if self.service.Len = 0 then
		    self.errMess ="You must specify a 'service'."
		    Return False
		  end if
		  if self.region.Len = 0 then
		    self.errMess ="You must specify a 'region'."
		    Return False
		  end if
		  
		  
		  host = self.service+"."+self.region+".amazonaws.com"
		  
		  //  remove encoding on the payload so that any hashing is done correctly
		  payload = self.payloadJSON.ToString
		  payloadNil = DefineEncoding(payload, nil)
		  
		  //  create proper date strings 
		  d = new date
		  d.hour = d.hour - d.GMTOffset
		  
		  amzdate = d.SQLDateTime
		  amzdate = ReplaceAll(amzdate, " ", "T")
		  amzdate = ReplaceAll(amzdate, "-", "")
		  amzdate = ReplaceAll(amzdate, ":", "")
		  amzdate = amzdate + "Z"
		  
		  datestamp = d.SQLDate
		  datestamp = ReplaceAll(datestamp, "-", "")
		  
		  //  build authorization/signature stuff
		  canonicalQueryString = ""
		  
		  payloadHash = Crypto.Hash(payloadNil, Crypto.Algorithm.SHA256)
		  payloadHash = EncodeHex(payloadHash)
		  payloadHash = Lowercase(payloadHash)
		  
		  signedHeaders = "host;x-amz-date;x-amz-target"
		  canonicalHeaders =  "host:" + host + nl + "x-amz-date:" + amzdate  + nl + "x-amz-target:" + self.amzTarget + nl
		  canonicalRequest = method + nl + canonicalURI+ nl + canonicalQueryString + nl + canonicalHeaders + nl + signedHeaders  + nl + payloadHash
		  
		  hashCanonicalRequest = Crypto.Hash(canonicalRequest, Crypto.Algorithm.SHA256)
		  hashCanonicalRequest = EncodeHex(hashCanonicalRequest)
		  hashCanonicalRequest = Lowercase(hashCanonicalRequest)
		  
		  algorithm = "AWS4-HMAC-SHA256"
		  credentialScope = datestamp + "/" + self.region + "/" + self.service + "/" + "aws4_request"
		  stringToSign = algorithm + nl +  amzdate + nl +  credentialScope + nl +  hashCanonicalRequest
		  
		  kdate = Crypto.HMAC("AWS4"+self.secretkey, datestamp, Crypto.Algorithm.SHA256) 
		  kregion = Crypto.HMAC(kdate, self.region, Crypto.Algorithm.SHA256)
		  kservice = Crypto.HMAC(kregion, self.service, Crypto.Algorithm.SHA256)
		  signingKey = Crypto.HMAC(kservice, "aws4_request", Crypto.Algorithm.SHA256)
		  
		  signature = Crypto.HMAC(signingKey, stringToSign, Crypto.Algorithm.SHA256)
		  signature = EncodeHex(signature)
		  signature = Lowercase(signature)
		  
		  authorizationHeader = algorithm +  " Credential=" + self.accesskey + "/" + credentialScope + ", " +  "SignedHeaders=" + signedHeaders + ", " + "Signature=" + signature
		  
		  err = false
		  
		  //  now send the request
		  dim urlc as new URLConnection
		  urlc.RequestHeader("Authorization") = authorizationHeader
		  urlc.RequestHeader("Host") = host
		  urlc.RequestHeader("X-Amz-Date") = amzdate
		  urlc.RequestHeader("Content-Type") = self.contentType
		  urlc.RequestHeader("X-Amz-Target") = self.amzTarget
		  urlc.RequestHeader("Content-Length") = str(lenb(payloadNil))
		  urlc.SetRequestContent(payloadNil, contentType)
		  
		  try
		    result = urlc.SendSync(self.method, "https://"+host+self.canonicalURI, self.timeout)
		    self.resultMimeType = urlc.ResponseHeader("Content-Type")
		     
		    if urlc.HTTPStatusCode <> 200 then  //  we got an error 
		      err = true
		      if self.resultMimeType.InStr("json") > 0 then  //  but we have a json error message 
		        try
		          self.resultJSON = new JSONItem(ConvertEncoding(result, Encodings.UTF8))
		          if self.resultJSON.HasName("Message") then  //   different errors use Message or message
		            self.errMess = self.resultJSON.Value("Message")
		          ElseIf self.resultJSON.HasName("message") then
		            self.errMess = self.resultJSON.Value("message")
		          else
		            self.errMess = result
		          end if
		        catch
		          self.errMess = "Invalid JSON: "+ result
		        end
		      else
		        self.errMess = "Non JSON Error "+ result
		      end if
		      
		    else  //  httpstatus = 200  OK
		      if self.resultMimeType.InStr("json") > 0 then
		        try
		          self.resultJSON = new JSONItem(ConvertEncoding(result, Encodings.UTF8))
		        catch
		          err = true
		          self.errMess = "Invalid JSON: "+ result
		        end
		      else
		        self.resultNonJSON = result
		      end if
		    end if
		    
		    
		  Catch e as RuntimeException
		    self.errMess = e.Message
		    err = true
		  end try
		  
		  
		  if err then
		    return false
		  end if
		  return true
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		accessKey As String
	#tag EndProperty

	#tag Property, Flags = &h0
		amzTarget As string
	#tag EndProperty

	#tag Property, Flags = &h0
		canonicalURI As string
	#tag EndProperty

	#tag Property, Flags = &h0
		contentType As string
	#tag EndProperty

	#tag Property, Flags = &h0
		errMess As string
	#tag EndProperty

	#tag Property, Flags = &h0
		method As String
	#tag EndProperty

	#tag Property, Flags = &h0
		payloadJSON As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h0
		region As String
	#tag EndProperty

	#tag Property, Flags = &h0
		resultJSON As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h0
		resultMimeType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		resultNonJSON As string
	#tag EndProperty

	#tag Property, Flags = &h0
		secretkey As String
	#tag EndProperty

	#tag Property, Flags = &h0
		service As string
	#tag EndProperty

	#tag Property, Flags = &h0
		timeout As Integer
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
			Name="errMess"
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
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="accessKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="secretkey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="service"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="amzTarget"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="timeout"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="contentType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="method"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="canonicalURI"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="resultNonJSON"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="resultMimeType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
