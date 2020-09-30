#tag Module
Protected Module strings
	#tag Constant, Name = kAccept, Type = String, Dynamic = True, Default = \"Accept", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Acepta"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE6\x89\xBF\xE8\xAB\xBE"
	#tag EndConstant

	#tag Constant, Name = kAWS, Type = String, Dynamic = True, Default = \"AWS", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCancel, Type = String, Dynamic = True, Default = \"Cancel", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Cancela"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x82\xAD\xE3\x83\xA3\xE3\x83\xB3\xE3\x82\xBB\xE3\x83\xAB"
	#tag EndConstant

	#tag Constant, Name = kDefault, Type = String, Dynamic = True, Default = \"Default", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Por defecto"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\x87\xE3\x83\x95\xE3\x82\xA9\xE3\x83\xAB\xE3\x83\x88"
	#tag EndConstant

	#tag Constant, Name = kDefaultLanguage, Type = String, Dynamic = True, Default = \"Default Language", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Idioma predeterminado"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE6\x97\xA2\xE5\xAE\x9A\xE3\x81\xAE\xE8\xA8\x80\xE8\xAA\x9E"
	#tag EndConstant

	#tag Constant, Name = kDone, Type = String, Dynamic = True, Default = \"Done", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Cancelar"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE7\xB5\x82\xE3\x82\x8F\xE3\x81\xA3\xE3\x81\x9F"
	#tag EndConstant

	#tag Constant, Name = kEditTranslation, Type = String, Dynamic = True, Default = \"Edit Translation", Scope = Public
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE7\xBF\xBB\xE8\xA8\xB3\xE3\x82\x92\xE7\xB7\xA8\xE9\x9B\x86"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Editar traducci\xC3\xB3n"
	#tag EndConstant

	#tag Constant, Name = kgoogle, Type = String, Dynamic = True, Default = \"Google", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kName, Type = String, Dynamic = True, Default = \"Name", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Nombre"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE5\x90\x8D\xE5\x89\x8D"
	#tag EndConstant

	#tag Constant, Name = kOk, Type = String, Dynamic = True, Default = \"OK", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"EST\xC3\x81 BIEN"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE5\x88\x86\xE3\x81\x8B\xE3\x81\xA3\xE3\x81\x9F"
	#tag EndConstant

	#tag Constant, Name = kPlatform, Type = String, Dynamic = True, Default = \"Platform", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Plataforma"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\x97\xE3\x83\xA9\xE3\x83\x83\xE3\x83\x88\xE3\x83\x95\xE3\x82\xA9\xE3\x83\xBC\xE3\x83\xA0"
	#tag EndConstant

	#tag Constant, Name = kSelectXojo_codeFile, Type = String, Dynamic = True, Default = \"Select Xojo_code File", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Seleccionar archivo Xojo_code"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"Xojo_code\xE3\x83\x95\xE3\x82\xA1\xE3\x82\xA4\xE3\x83\xAB\xE3\x82\x92\xE9\x81\xB8\xE6\x8A\x9E"
	#tag EndConstant

	#tag Constant, Name = kService, Type = String, Dynamic = True, Default = \"Service", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTarget, Type = String, Dynamic = True, Default = \"Target", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Objetivo"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x82\xBF\xE3\x83\xBC\xE3\x82\xB2\xE3\x83\x83\xE3\x83\x88"
	#tag EndConstant

	#tag Constant, Name = kTargetLanguage, Type = String, Dynamic = True, Default = \"Target Language", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Idioma de destino"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x82\xBF\xE3\x83\xBC\xE3\x82\xB2\xE3\x83\x83\xE3\x83\x88\xE8\xA8\x80\xE8\xAA\x9E"
	#tag EndConstant

	#tag Constant, Name = ktranslate, Type = String, Dynamic = True, Default = \"Translate", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Traducir"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE7\xBF\xBB\xE8\xA8\xB3"
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
	#tag EndViewBehavior
End Module
#tag EndModule
