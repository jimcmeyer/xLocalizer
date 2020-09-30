#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  //if not DebugBuild then
		  MsgBox("Warning!!!  Use this app at your own risk!  It modifies your Xojo project using undocumented features.  Back up your project first.")
		  //end if
		  
		  self.keys = new keysClass
		  self.keys.getKeys()
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Note, Name = VersionNotes
		1.2.0  May 31, 2019
		Added Prefs window to store Google & AWS keys (instead of hard coding in the app.open event)
		These key are store in SpecialFolder.Preferences.Child(self.keyFileName) and are not encrypted
		Added code to properly handle more lower ASCII characters to the encoding and decoding of the constant string
		Added most recent AWS lanaguages
		Removed AWS code that would work around requirement that one language was English...  since AWS has removed that requirement
		
		1.2.1 Oct 11, 2019
		Corrected language codes for Chinese Traditional & Simplified (Xojo uses different codes that GCP & AWS)
		This was done by using the Xojo code throughout the app except when the translate service is actually called
		Updated AWS available languages
	#tag EndNote


	#tag Property, Flags = &h0
		keys As keysClass
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
