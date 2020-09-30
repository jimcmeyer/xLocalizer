#tag Module
Protected Module ConstantCode
	#tag Method, Flags = &h0
		Function decodeDefinition(def as String) As string
		  dim i as Integer
		  
		  dim s as string
		  dim theChar as string
		  
		  dim ret as string
		  dim conv as string
		  
		  dim cnt as integer
		  
		  dim rg as new regex
		  rg.SearchPattern = "\\x\w\w"
		  dim rm as RegExMatch
		  
		  s = Right(def, def.Len - 2)  //  drop the leading \ and "
		  s = Left(s, s.Len - 1)  //  drop trailing quote
		  
		  cnt = 0
		  conv = ""
		  rm = rg.Search(s, 0)
		  while rm <> nil and rm.SubExpressionCount > 0
		    cnt = cnt + 1
		    if cnt > 500 then
		      MsgBox("I seem to be stuck in a loop trying to decode a definiton.")
		      exit
		    end if
		    for i = 1 to s.Len
		      if mid(s, i, 2) = "\x" then
		        conv = conv + mid(s, i, 4)
		        i = i + 3
		      else
		        if conv.len > 0 then
		          theChar = DecodeHex(conv)
		          s = Replace(s, conv, theChar)
		          conv = ""
		          exit
		        end if
		      end if
		    next
		    if conv.len > 0 then
		      theChar = DecodeHex(conv)
		      s = Replace(s, conv, theChar)
		      conv = ""
		    end if
		    rm = rg.Search(s, 0)
		  wend
		  
		  s = ReplaceAll(s, "\b", chr(8))
		  s = ReplaceAll(s, "\t", chr(9))
		  s = ReplaceAll(s, "\n", chr(10))
		  s = ReplaceAll(s, "\v", chr(11))
		  s = ReplaceAll(s, "\f", chr(12))
		  s = ReplaceAll(s, "\r", chr(13))
		  s = ReplaceAll(s, "\'", "'")
		  s = ReplaceAll(s, "\"+chr(34), chr(34))
		  s = ReplaceAll(s, "\?", "?")  
		  
		  return s
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function encodeDefinition(def as String) As string
		  dim s as string
		  dim i, j as integer
		  dim c as string
		  dim h as string
		  
		  s = ""
		  
		  for i = 1 to def.len
		    c = mid(def, i, 1)
		    if c.Asc > 127 then
		      h = EncodeHex(c, true)
		      h = "\x" + h
		      h = ReplaceAll(h, " ", "\x")
		      s = s + h
		    else
		      s = s + c
		    end if
		  next
		  
		  s = replaceall(s, chr(8), "\b")
		  s = replaceall(s, chr(9), "\t") 
		  s = replaceall(s, chr(10), "\n")
		  s = replaceall(s, chr(11), "\v")
		  s = replaceall(s, chr(12), "\f")
		  s = replaceall(s, chr(13), "\r")
		  s = replaceall(s, ",", "\x2C")
		  s = replaceall(s, "'", "\'")  //  single quote
		  s = replaceall(s, chr(34), "\"+chr(34))
		  s = replaceall(s, "?", "\?") 
		  
		  s = "\"+chr(34)+s+chr(34)
		  
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function findControlTypes(projectFiles() as FolderItem) As string()
		  dim ret() as string
		  
		  dim s as string
		  dim i as integer
		  dim tin as TextInputStream
		  dim f as FolderItem
		  
		  dim cName as string
		  dim cInherits as string
		  
		  dim lastCnt as integer
		  
		  ret.Append("Label")
		  ret.Append("PushButton")
		  ret.Append("BevelButton")
		  ret.Append("CheckBox")
		  ret.Append("RadioButton")
		  ret.Append("GroupBox")
		  
		  lastCnt = 0
		  dim cnt as integer
		  
		  while lastCnt <> UBound(ret) 
		    cnt = cnt + 1  //  just to make sure we do not get stuck
		    if cnt > 100 then
		      exit
		    end if
		    for i = 0 to UBound(projectFiles)
		      f = projectFiles(i)
		      if right(f.name, 10) = ".xojo_code" then
		        tin = TextInputStream.Open(f)
		        if tin <> nil then
		          s = tin.ReadLine(Encodings.UTF8)
		          if s = "#tag Class" then
		            s = tin.ReadLine(Encodings.UTF8)
		            cName = NthField(s, " ", 3)
		            s = tin.ReadLine(Encodings.UTF8)
		            cInherits = NthField(s, " ", 2)
		            if ret.IndexOf(cInherits) >= 0 then
		              ret.Append(cName)
		            end if
		          end if
		          tin.Close
		        else
		          MsgBox("Error opening "+f.Name)
		        end if
		      end if
		    next
		    lastCnt = UBound(ret)
		  wend
		  
		  return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function findUnderSize(f as FolderItem, myConstants() as constantClass, controlTypes() as string) As string()
		  //  this codes needs a lot of testing
		  //  it curently does not account for the TextUnit 1 = pixels, 2 = points, 3 = inches, 4 = MM
		  //        default is 2 = points...  and that is what this code is based on 
		  //  it assumes that 0.0 size is 12.0
		  //  assumes no font is "system"
		  // assumes contstants are in a module
		  
		  //  there is no support for control types:
		  // SegmentedControl
		  // PopupMenu
		  // ComboBox
		  // PagePanel
		  // TabPanel
		  // Listbox
		  //  and other Project Type controls ex: web, ios, etc...
		  
		  
		  dim i, j as integer
		  dim s as string
		  dim tin as TextInputStream
		  
		  dim ret() as string
		  
		  dim p as Picture
		  
		  dim constantRG as new RegEx
		  dim constantRM as RegExMatch
		  dim theConstant as string
		  
		  dim captionRG as new RegEx
		  dim captionRM as RegExMatch
		  
		  dim fontRG as new RegEx
		  dim fontRM as RegExMatch
		  dim theFont as string
		  
		  dim multiLineRG as new RegEx
		  dim multiLineRM as RegExMatch
		  dim isMultiline as Boolean
		  
		  dim boldRG as new RegEx
		  dim boldRM as RegExMatch
		  dim isBold as Boolean
		  
		  dim italicRG as new RegEx
		  dim italicRM as RegExMatch
		  dim isitalic as Boolean
		  
		  dim widthRG as new RegEx
		  dim widthRM as RegExMatch
		  dim theWidth as integer
		  dim newWidth as integer
		  
		  dim heightRG as new RegEx
		  dim heightRM as RegExMatch
		  dim theHeight as integer
		  dim requiredHeight as integer
		  
		  dim sizeRG as new RegEx
		  dim sizeRM as RegExMatch
		  dim theSize as Double
		  
		  dim beginRG as new RegEx
		  dim beginRM as RegExMatch
		  dim theControlType as string
		  
		  dim endRG as new RegEx
		  dim endRM as RegExMatch
		  
		  dim dict as new Dictionary
		  
		  for i = 0 to UBound(myconstants)
		    for j = 0 to UBound(myconstants(i).instances)
		      dict.Value(myconstants(i).parentModule+"."+myconstants(i).name) = myconstants(i).instances(j).definition
		    next
		  next
		  
		  tin = TextInputStream.Open(f)
		  if tin = nil then
		    MsgBox("I could not open "+f.NativePath)
		    return ret
		  end if
		  
		  constantRG.SearchPattern = "\s+Text\s+=\s+"+chr(34)+"#(.*)"+chr(34)
		  captionRG.SearchPattern = "\s+Caption\s+=\s+"+chr(34)+"#(.*)"+chr(34)
		  fontRG.SearchPattern  = "\s+TextFont\s+=\s+"+chr(34)+"(.*)"+chr(34)
		  widthRG.SearchPattern  = "\s+Width\s+=\s+(.*)"
		  heightRG.SearchPattern  = "\s+Height\s+=\s+(.*)"
		  italicRG.SearchPattern  = "\s+Italic\s+=\s+(.*)"
		  boldRG.SearchPattern  = "\s+Bold\s+=\s+(.*)"
		  sizeRG.SearchPattern  = "\s+TextSize\s+=\s+(.*)"
		  beginRG.SearchPattern  = "\s+Begin\s(.*)\s(.*)"
		  multiLineRG.SearchPattern = "\s+Multiline\s+=\s+(.*)"
		  endRG.SearchPattern  = "\s+End"
		  
		  isMultiline = false
		  isBold = False
		  isitalic = false
		  
		  while not tin.EOF
		    s = tin.ReadLine
		    beginRM = beginRG.Search(s)
		    if beginRM <> nil and beginRM.SubExpressionCount = 3 then
		      theControlType = beginRM.SubExpressionString(1)
		    end if
		    
		    constantRM = constantRG.Search(s)
		    if constantRM <> nil and constantRM.SubExpressionCount = 2 then
		      theConstant = constantRM.SubExpressionString(1)  
		    end if
		    
		    captionRM = captionRG.Search(s)
		    if captionRM <> nil and captionRM.SubExpressionCount = 2 then
		      theConstant = captionRM.SubExpressionString(1)  
		    end if
		    
		    fontRM = fontRG.Search(s)
		    if fontRM <> nil and fontRM.SubExpressionCount = 2 then
		      theFont = fontRM.SubExpressionString(1)
		    end if
		    
		    widthRM = widthRG.Search(s)
		    if widthRM <> nil and widthRM.SubExpressionCount = 2 then
		      theWidth = val(widthRM.SubExpressionString(1))
		    end if
		    
		    heightRM = heightRG.Search(s)
		    if heightRM <> nil and heightRM.SubExpressionCount = 2 then
		      theHeight = val(heightRM.SubExpressionString(1))
		    end if
		    
		    sizeRM = sizeRG.Search(s)
		    if sizeRM <> nil and sizeRM.SubExpressionCount = 2 then
		      theSize = val(sizeRM.SubExpressionString(1))
		    end if
		    
		    multiLineRM = multiLineRG.Search(s)
		    if multiLineRM <> nil and multiLineRM.SubExpressionCount = 2 then
		      if multiLineRM.SubExpressionString(1) = "True" then
		        isMultiline = true
		      else
		        isMultiline = False
		      end if
		    end if
		    
		    italicRM = italicRG.Search(s)
		    if italicRM <> nil and italicRM.SubExpressionCount = 2 then
		      if italicRM.SubExpressionString(1) = "True" then
		        isitalic = true
		      else
		        isitalic = False
		      end if
		    end if
		    
		    boldRM = boldRG.Search(s)
		    if boldRM <> nil and boldRM.SubExpressionCount = 2 then
		      if boldRM.SubExpressionString(1) = "True" then
		        isBold = true
		      else
		        isBold = False
		      end if
		    end if
		    
		    if theHeight = 0 then
		      theHeight = 30
		    end if
		    
		    if theSize = 0.0 then  
		      theSize = 12.0  //  not sure what this should be...  docs indicate it is based on the OS
		    end if
		    
		    if theFont.Len = 0 then
		      theFont = "system"
		    end if
		    
		    endRM = endRG.Search(s)
		    if endRM <> nil and endRM.SubExpressionCount > 0 then
		      if controlTypes.IndexOf(theControlType) >= 0 then
		        if theConstant.Len > 0 and theFont.Len > 0 and theWidth > 0 then
		          if dict.HasKey(theConstant) then
		            p = new Picture(theWidth * 2, theHeight * 2, 32)  //  make picture plenty big
		            p.Graphics.TextFont = theFont
		            p.Graphics.TextSize = thesize
		            p.Graphics.Bold = isBold
		            p.Graphics.Italic = isitalic
		            if isMultiline then
		              requiredHeight = p.Graphics.StringHeight(dict.Value(theConstant), theWidth)
		              if requiredHeight > theHeight then
		                ret.Append(theConstant)
		              end if
		            else
		              newWidth = p.Graphics.StringWidth(dict.Value(theConstant))
		              if  newWidth > theWidth or requiredHeight > theHeight then
		                ret.Append(theConstant)
		              end if
		            end if
		          end if
		        end if
		      end if
		      
		      theConstant = ""
		      theControlType = ""
		      isMultiline = false
		      isBold = False
		      isitalic = false
		    end if
		    
		  wend
		  
		  tin.Close
		  
		  return ret
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function parseConstants(fin as FolderItem, targetLang as string, platform as string, warn as Boolean) As constantClass()
		  dim s as string
		  
		  dim tin as TextInputStream
		  dim cc as constantClass
		  dim ci as constantInstanceClass
		  
		  dim constants() as constantClass
		  
		  dim regexHeader as new RegEx
		  dim regexInstance as new RegEx
		  dim regexEnd as new RegEx
		  dim moduleHeader as new RegEx 
		  
		  dim moduleName as string
		  
		  dim headerMatch as RegExMatch
		  dim instanceMatch as RegExMatch
		  dim endmatch as RegExMatch
		  dim moduleMatch as RegExMatch
		  
		  dim newOne as Boolean
		  
		  tin = TextInputStream.Open(fin)
		  if tin = nil then
		    MsgBox("Unable to open the seleced file.")
		    return nil
		  end if
		  
		  tin.Encoding = Encodings.UTF8
		  
		  regexHeader.SearchPattern = "#tag Constant, Name = (.*), Type = (.*), Dynamic = (.*), Default = (.*), Scope = (.*)"
		  regexInstance.SearchPattern = "#Tag Instance, Platform = (.*), Language = (.*), Definition\s+= (.*)"
		  regexEnd.SearchPattern = "#tag EndConstant"
		  
		  moduleHeader.SearchPattern = "Protected Module (.*)"
		  
		  newOne = true
		  While not tin.EOF
		    s = tin.ReadLine()
		    
		    moduleMatch = moduleHeader.Search(s)
		    if moduleMatch <> nil and moduleMatch.SubExpressionCount = 2 then
		      moduleName = moduleMatch.SubExpressionString(1)
		    end if
		    
		    headerMatch = regexHeader.Search(s)
		    if headerMatch <> nil and headerMatch.SubExpressionCount = 6 then
		      newOne = true
		      cc = new constantClass
		      cc.name = headerMatch.SubExpressionString(1)
		      cc.type = headerMatch.SubExpressionString(2)
		      cc.dynamic = headerMatch.SubExpressionString(3)
		      cc.default = ConstantCode.decodeDefinition(headerMatch.SubExpressionString(4))
		      cc.scope = headerMatch.SubExpressionString(5)
		      cc.parentModule = moduleName
		    end if
		    
		    if cc <> nil then
		      instanceMatch = regexInstance.Search(s)
		      if instanceMatch <> nil and instanceMatch.SubExpressionCount = 4 then
		        if instanceMatch.SubExpressionString(2) = targetLang and instanceMatch.SubExpressionString(1) = platform then
		          newOne = false
		        end if
		      end if
		      
		      endmatch = regexEnd.Search(s)
		      if endmatch <> nil and endmatch.SubExpressionCount = 1 then
		        if newOne = true then
		          constants.Append(cc)
		        end if
		        cc = nil
		      end if
		      
		    end if
		    
		  wend
		  tin.Close()
		  
		  
		  
		  return constants
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function saveConstants(fin as folderitem, fout as FolderItem, constants() as constantClass, platform as String, targetLang as string) As Boolean
		  dim i, j as Integer
		  dim s, ss as string
		  
		  dim regexHeader as new RegEx
		  dim regexEnd as new RegEx
		  
		  dim headerMatch as RegExMatch
		  dim endmatch as RegExMatch
		  
		  dim moduleName as new RegEx
		  dim moduleMatch as RegExMatch
		  
		  dim curModuleName as string
		  
		  dim tout as TextOutputStream
		  dim tin as TextInputStream
		  
		  dim cname as string
		  
		  tin = TextInputStream.Open(fin)
		  if tin = nil then
		    MsgBox("Unable to open Constants file "+fin.Name)
		    return false
		  end if
		  
		  tout = TextOutputStream.Create(fout)
		  if tout = nil then
		    MsgBox("Unable to open new Constants file "+fout.Name)
		    return false
		  end if
		  
		  dim dict as new Dictionary
		  
		  for i = 0 to UBound(constants)
		    for j = 0 to UBound(constants(i).instances)
		      if constants(i).instances(j).language = targetLang then
		        dict.Value(constants(i).parentModule+"."+constants(i).name) = constants(i).instances(j).definition
		      end if
		    next
		  next
		  
		  tin.Encoding = Encodings.UTF8
		  
		  regexHeader.SearchPattern = "#tag Constant, Name = (.*), Type = (.*), Dynamic = (.*), Default = (.*), Scope = (.*)"
		  regexEnd.SearchPattern = "#tag EndConstant"
		  
		  moduleName.SearchPattern = "Protected Module (.*)"
		  
		  cname = ""
		  While not tin.EOF
		    s = tin.ReadLine()
		    
		    moduleMatch = moduleName.Search(s)
		    if moduleMatch <> nil and moduleMatch.SubExpressionCount = 2 then
		      curModuleName = moduleMatch.SubExpressionString(1)
		    end if
		    
		    headerMatch = regexHeader.Search(s)
		    endmatch = regexEnd.Search(s)
		    
		    if headerMatch <> nil and headerMatch.SubExpressionCount = 6 then
		      //if headerMatch.SubExpressionString(3) = "True" then   // uncomment if you do not want non-dynamic constants to update
		      cname = headerMatch.SubExpressionString(1)
		      //end if
		    end if
		    
		    if endmatch <> nil and endmatch.SubExpressionCount = 1 and cname.len > 0 and dict.HasKey(curModuleName+"."+cname) then
		      ss = chr(9) + chr(9) + "#Tag Instance, Platform = "+platform+", Language = "+targetLang+", Definition  = "+encodeDefinition(dict.Value(curModuleName+"."+cname))
		      tout.WriteLine(ss)
		      cname = ""
		    end if
		    
		    tout.WriteLine(s)
		  wend
		  
		  tin.Close
		  tout.Close
		  
		  return true
		  
		  Exception e as RuntimeException
		    return false
		    
		    
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function translateAWSString(awstt as AWSTranslateTextClass, sin as string) As string
		  dim sout as string
		  dim eol as string
		  dim j as integer
		  
		  eol = EndOfLine
		  
		  sout = ""
		  for j = 1 to CountFields(sin, EndOfLine)
		    awstt.sourceText = NthField( sin, EndOfLine, j)
		    if awstt.sourceText.len > 0 then
		      if awstt.doit() then
		        sout = sout + awstt.targetText + EndOfLine
		      else
		        exit
		      end if
		    else
		      sout = sout + EndOfLine
		    end if
		  next
		  
		  if Right(sout, eol.Len) = EndOfLine then
		    sout = Left(sout, sout.len - eol.Len)
		  end if
		  
		  return sout
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function translateConstants(constants() as constantClass, srcLangCode as string, targetLangCode as string, platform as string, service as String) As Boolean
		  dim i as integer
		  
		  dim cc as constantClass
		  dim ci as constantInstanceClass
		  
		  dim tlang as string
		  dim sLang as string
		  
		  
		  dim s as string
		  dim err as Boolean
		  
		  app.MouseCursor = System.Cursors.Wait
		  
		  err = false
		  
		  //   added 1.2.1 since xojo and services use different codes for Chinese
		  tlang = targetLangCode
		  sLang = srcLangCode
		  if tlang = "zh_CN" then
		    tlang = "zh"
		  end if
		  if sLang = "zh_CN" then
		    sLang = "zh"
		  end if
		  if tLang = "zh_TW" then
		    tLang = "zh-TW"
		  end if
		  if sLang = "zh_TW" then
		    sLang = "zh-TW"
		  end if
		  //  end add
		  
		  if service = "aws" then
		    
		    dim awstt as new AWSTranslateTextClass
		    awstt.secretKey = app.keys.awsSecretKey
		    awstt.accessKey = app.keys.awsAccessKey
		    awstt.region = "us-east-2"
		    
		    awstt.sourceLanguageCode = sLang
		    awstt.targetLanguageCode = tlang
		    
		    for i = 0 to UBound(constants)
		      owNotificationCenter.send("transCounter", str(i+1)+"/"+str(UBound(constants)+1))
		      if err = true then
		        exit
		      end if
		      cc = constants(i)
		      
		      //  aws requires 1 lang be english...  so if neither is "en" then translate to "en" first then into final lang
		      //  now aws allows non-English translations...  but not all pairs are supported
		      //      so this code was removed 1.2.0
		      'if srcLangCode <> "en" and targetLangCode <> "en" then
		      'awstt.sourceLanguageCode = srcLangCode
		      'awstt.targetLanguageCode = "en"
		      's = translateAWSString(awstt, cc.default)
		      'if awstt.err then
		      'MsgBox("Error translating '"+cc.name+"' "+awstt.errMess)
		      'err = true
		      'exit
		      'else
		      'awstt.sourceLanguageCode = "en"
		      'awstt.targetLanguageCode = targetLangCode
		      's = translateAWSString(awstt, s)
		      'if awstt.err then
		      'MsgBox("Error translating '"+cc.name+"' "+awstt.errMess)
		      'err = true
		      'exit
		      'end if
		      'end if
		      'else
		      s = translateAWSString(awstt, cc.default)
		      if awstt.err then
		        MsgBox("Error translating '"+cc.name+"' "+awstt.errMess)
		        err = true
		        exit
		        'end if
		      end if
		      
		      ci = new constantInstanceClass
		      ci.definition = s
		      ci.language = targetLangCode
		      ci.platform = platform
		      cc.instances.Append(ci)
		    next
		    
		    
		  else   //  googleTranslateClass
		    dim gt as new googleTranslateClass
		    gt.apikey = app.keys.googleAPIKey
		    gt.srcLangCode = sLang
		    gt.targetLangCode = tlang
		    
		    for i = 0 to UBound(constants)
		      owNotificationCenter.send("transCounter", str(i+1)+"/"+str(UBound(constants)+1))
		      cc = constants(i)
		      gt.sourcetext = cc.default
		      gt.targetText = ""
		      if gt.doit() then
		        ci = new constantInstanceClass
		        ci.definition = gt.targetText
		        ci.language = targetLangCode
		        ci.platform = platform
		        cc.instances.Append(ci)
		      else
		        MsgBox("Error translating '"+cc.name+"' "+gt.errMess)
		        err = true
		        exit
		      end if
		    next
		    
		  end if
		  
		  app.MouseCursor = System.Cursors.StandardPointer
		  
		  if err then
		    return false
		  end if
		  return true
		  
		  
		  
		  
		  
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
