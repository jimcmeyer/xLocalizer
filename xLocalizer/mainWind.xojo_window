#tag Window
Begin Window mainWind Implements owNotificationListener
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   726
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   1000
   MenuBar         =   1403203583
   MenuBarVisible  =   True
   MinHeight       =   612
   MinimizeButton  =   True
   MinWidth        =   860
   Placement       =   0
   Resizeable      =   True
   Title           =   "xLocalizer"
   Visible         =   True
   Width           =   1000
   Begin PopupMenu sourceLangPop
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   239
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   11
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   124
   End
   Begin PopupMenu targetLangPop
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   239
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   44
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   124
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   118
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kTargetLanguage"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   45
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   117
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   118
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kDefaultLanguage"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   117
   End
   Begin CustomListBoxClass constantsListBox
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   False
      ColumnWidths    =   "170, 375, 375"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   413
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "#kName	#kDefault	#kTarget	"
      Italic          =   False
      Left            =   29
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   293
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   940
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   118
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kPlatform"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   76
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   117
   End
   Begin PopupMenu platformPop
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   239
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   75
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   124
   End
   Begin PushButton translateBut
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "#ktranslate"
      Default         =   False
      Enabled         =   True
      Height          =   27
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   382
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   41
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin PushButton acceptBut
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "#kAccept"
      Default         =   False
      Enabled         =   True
      Height          =   27
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   780
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   11
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "#kService"
      Enabled         =   True
      Height          =   68
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   7
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   87
      Begin RadioButton awsRadio
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kAWS"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   28
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   ""
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   25
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   68
      End
      Begin RadioButton googleRadio
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kgoogle"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   28
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   ""
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   48
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   68
      End
   End
   Begin Label cntLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "0"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   270
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   443
   End
   Begin PushButton checkSizeBut
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Check Size"
      Default         =   False
      Enabled         =   True
      Height          =   27
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   382
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   72
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin PushButton selectProjectFileBut
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Select Project Folder"
      Default         =   False
      Enabled         =   True
      Height          =   27
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   382
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   11
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Listbox filesListbox
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   158
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Project Files (select your Strings Constants File)"
      Italic          =   False
      Left            =   29
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   108
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   545
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox controlTypesListBox
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "40,*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   161
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "✓	Control Types to Check Size "
      Italic          =   False
      Left            =   612
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   107
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   357
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  
		  //setLangOptions()
		  
		  enableButs()
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  if constantsListBox.ListIndex >= 0 then
		    EditCopy.Enabled = true
		  else
		    EditCopy.Enabled = False
		  end if
		  
		  prefsMenu.Enabled = true
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.Title = me.Title + " " + app.Version
		  
		  if app.keys.googleAPIKey.Len = 0 and app.keys.awsAccessKey.Len = 0 then
		    MsgBox("Using the Preferences menu you must enter AWS or Google credentials!")
		  end if
		  
		  owNotificationCenter.register( "transCounter", self)
		  
		  platformPop.AddRow("Any")
		  platformPop.AddRow("Mac OS")
		  platformPop.AddRow("Mac Carbon Mach-O")
		  platformPop.AddRow("Mac Cocoa")
		  platformPop.AddRow("Windows")
		  platformPop.AddRow("Linux")
		  platformPop.AddRow("Xojo Cloud")
		  platformPop.AddRow("iOS")
		  platformPop.ListIndex = 0
		  
		  controlTypesListBox.ColumnType(0) = Listbox.TypeCheckbox
		  
		  enableButs()
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function prefsMenu() As Boolean Handles prefsMenu.Action
			keysWind.ShowModal()
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub enableButs()
		  if me.status = "translated" then
		    checkSizeBut.Enabled = true
		    acceptBut.Enabled = true
		  end if
		  
		  if app.keys.awsAccessKey.Len > 0 then  //  aws
		    awsRadio.Enabled = true
		  else
		    awsRadio.Enabled = false
		  end if
		  
		  if app.keys.googleAPIKey.Len > 0 then  //  google
		    googleRadio.Enabled = true
		  else
		    googleRadio.Enabled = False
		  end if
		  
		  if awsRadio.Enabled = False and googleRadio.Enabled = false then
		    selectProjectFileBut.Enabled = false
		  else
		    selectProjectFileBut.Enabled = true
		  end if
		  
		  if constantsListBox.ListCount > 0 then
		    translateBut.Enabled = true
		    if awsRadio.Value = False and googleRadio.Value = False then
		      translateBut.Enabled = false
		    end if
		  else
		    translateBut.Enabled = false
		    checkSizeBut.Enabled = false
		    acceptBut.Enabled = False
		  end if
		  
		  if awsRadio.Value = False and googleRadio.Value = False then
		    if self.awsRadio.Enabled then
		      self.googleRadio.Value = false
		      self.awsRadio.Value = true
		    end if
		    if self.googleRadio.Enabled then
		      self.awsRadio.Value = false
		      self.googleRadio.Value = true
		    end if
		  end if
		  
		  self.Invalidate()
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub getProjectFiles(fin as FolderItem)
		  dim i as integer
		  
		  for i = 1 to fin.Count
		    if fin.Item(i).Directory then
		      getProjectFiles(fin.Item(i))
		    else
		      if fin.Item(i).Visible then
		        projectFiles.Append(fin.Item(i))
		      end if
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub notificationReceived(key as string, value as variant, sender as variant)
		  
		  if key = "transCounter" then  
		    cntLabel.text = value
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub processConstantFile(fin as FolderItem, translate as Boolean)
		  dim i, j as integer
		  dim service as string
		  dim warn as Boolean
		  
		  dim notDynamicCnt as integer
		  dim undersize() as string
		  dim ms as Double
		  
		  cntLabel.text = ""
		  
		  if awsRadio.Value then
		    service = "aws"
		  else
		    service = "google"
		  end if
		  
		  if translate then
		    warn = False
		  else
		    warn = true
		  end if
		  
		  redim myConstants(-1)
		  constantsListBox.DeleteAllRows()
		  
		  myConstants = ConstantCode.parseConstants(fin, targetLangPop.RowTag(targetLangPop.ListIndex), platformPop.text, warn) 
		  
		  if UBound(myConstants) < 0 then
		    //MsgBox("There are no new Constants in the selected file to translate into "+ targetLangPop.Text)
		    beep
		    return
		  end if
		  
		  if translate then
		    ms = Microseconds
		    if ConstantCode.translateConstants(myConstants, sourceLangPop.RowTag(sourceLangPop.ListIndex), targetLangPop.RowTag(targetLangPop.ListIndex), platformPop.text, service) then
		      cntLabel.text = cntLabel.Text + " " + format((Microseconds - ms) / 1000000, "####")+ " Secs"
		      me.status = "translated"
		    else
		      MsgBox("Translation failed! ")
		    end if
		  else
		    cntLabel.text = str(UBound(myConstants)+1)
		  end if
		  
		  for i = 0 to UBound(myConstants)
		    constantsListBox.AddRow("")
		    constantsListBox.Cell(i,0) = myConstants(i).parentModule+"."+myConstants(i).name
		    if myConstants(i).dynamic = "False" then
		      constantsListBox.CellBold(i,0) = true
		      notDynamicCnt = notDynamicCnt + 1
		    end if
		    constantsListBox.Cell(i,1) = myConstants(i).default
		    for j = 0 to UBound(myConstants(i).instances)
		      if myConstants(i).instances(j).language = targetLangPop.RowTag(targetLangPop.ListIndex) then
		        constantsListBox.Cell(i,2) = myConstants(i).instances(j).definition
		        exit
		      end if
		    next
		  next
		  
		  if notDynamicCnt > 0 then
		    cntLabel.text = cntLabel.Text + "  "+ str(notDynamicCnt) + " are NOT Dynamic/Localized (listed in BOLD)"
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setLangOptions()
		  dim i as integer
		  dim dict as new Dictionary
		  
		  if awsRadio.Value then
		    dict.Value("ar") = "Arabic"
		    dict.Value("zh_CN") = "Chinese (Simplified)"
		    dict.Value("zh_TW") = "Chinese (Traditional)"
		    dict.Value("cs") = "Czech"
		    dict.Value("da") = "Danish"
		    dict.Value("nl") = "Dutch"
		    dict.Value("en") = "English"
		    dict.Value("fi") = "Finnish"
		    dict.Value("fr") = "French"
		    dict.Value("de") = "German"
		    dict.Value("el") = "Greek"
		    dict.Value("he") = "Hebrew"
		    dict.Value("hi") = "Hindi"
		    dict.Value("id") = "Indonesian"
		    dict.Value("it") = "Italian"
		    dict.Value("ja") = "Japanese"
		    dict.Value("ko") = "Korean"
		    dict.Value("ms") = "Malay"
		    dict.Value("no") = "Norwegian"
		    dict.Value("fa") = "Persian"
		    dict.Value("pl") = "Polish"
		    dict.Value("pt") = "Portguese"
		    dict.Value("ro") = "Romainian"
		    dict.Value("ru") = "Russian"
		    dict.Value("es") = "Spanish"
		    dict.Value("sv") = "Swedish"
		    dict.Value("th") = "Thai"
		    dict.Value("tr") = "Turkish"
		    dict.Value("uk") = "Ukrainian"
		    dict.Value("ur") = "Urdu"
		    dict.Value("vi") = "Vietnamese"
		    
		  else
		    dict = googleModule.getGoogleLangs()
		  end if
		  
		  
		  sourceLangPop.DeleteAllRows()
		  targetLangPop.DeleteAllRows()
		  
		  for i = 0 to dict.Count - 1
		    sourceLangPop.AddRow(dict.Value(dict.Key(i).StringValue))
		    sourceLangPop.RowTag(sourceLangPop.ListCount - 1) = dict.Key(i).StringValue
		    if dict.Key(i).StringValue = "en" then
		      sourceLangPop.ListIndex = sourceLangPop.ListCount - 1
		    end if
		  next
		  
		  for i = 0 to dict.Count - 1
		    targetLangPop.AddRow(dict.Value(dict.Key(i).StringValue))
		    targetLangPop.RowTag(targetLangPop.ListCount - 1) = dict.Key(i).StringValue
		    if dict.Key(i).StringValue = "es" then
		      targetLangPop.ListIndex = targetLangPop.ListCount - 1
		    end if
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		constantFolderitem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		controlTypes() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		myConstants() As constantClass
	#tag EndProperty

	#tag Property, Flags = &h0
		projectFiles() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		projectFolderitem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		status As string
	#tag EndProperty


#tag EndWindowCode

#tag Events sourceLangPop
	#tag Event
		Sub Change()
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events targetLangPop
	#tag Event
		Sub Change()
		  if filesListbox.ListIndex >= 0 then
		    constantFolderitem = filesListbox.RowTag(filesListbox.ListIndex)
		    processConstantFile(constantFolderitem, false)
		  end if
		  
		  self.status = ""
		  
		  enableButs()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events constantsListBox
	#tag Event
		Sub DoubleClick()
		  dim i as Integer
		  dim s as string
		  dim dw as new detailWindow
		  
		  i = me.ListIndex
		  
		  dw.srcText = me.Cell(i, 1)
		  dw.targetText = me.Cell(i, 2)
		  
		  s = dw.go(me.Cell(i, 0))
		  
		  if s <> me.Cell(me.ListIndex, 2) then
		    myConstants(i).instances(0).definition = s
		    me.Cell(i, 2) = s
		    me.InvalidateCell(i,2)
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events platformPop
	#tag Event
		Sub Change()
		  if filesListbox.ListIndex >= 0 then
		    constantFolderitem = filesListbox.RowTag(filesListbox.ListIndex)
		    processConstantFile(constantFolderitem, false)
		  end if
		  
		  self.status = ""
		  
		  enableButs()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events translateBut
	#tag Event
		Sub Action()
		  MsgBox("Do NOT depend entirely on the translated text!  You should have someone that is fluent in that language review you app.")
		  
		  if constantFolderitem <> nil and constantFolderitem.Exists then
		    processConstantFile(constantFolderitem, true)
		  end if
		  
		  enableButs()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events acceptBut
	#tag Event
		Sub Action()
		  dim fout as FolderItem 
		  
		  fout = SpecialFolder.Temporary.Child(constantFolderitem.Name)
		  
		  if ConstantCode.saveConstants(constantFolderitem, fout, myConstants, platformPop.text, targetLangPop.RowTag(targetLangPop.ListIndex)) then
		    //  ok we can replace the file
		    
		    constantFolderitem.Delete
		    fout.CopyFileTo(constantFolderitem)
		    if fout.LastErrorCode <> 0 then
		      MsgBox("There has been an error replacing your xojo_code file.  It was not replaced.")
		    else
		      MsgBox(strings.kDone)
		      
		      constantFolderitem = nil
		      cntLabel.Text = ""
		      constantsListBox.DeleteAllRows()
		      self.status = ""
		      enableButs()
		    end if
		    
		  else
		    MsgBox("An error occured.  Your xojo_code file has not been replaced.")
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events awsRadio
	#tag Event
		Sub Action()
		  if me.Value then
		    setLangOptions()
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events googleRadio
	#tag Event
		Sub Action()
		  if me.Value then
		    setLangOptions()
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events checkSizeBut
	#tag Event
		Sub Action()
		  dim i, j as integer
		  dim undersize() as string
		  dim undersizeCnt as integer
		  
		  dim controlTypes() as string
		  dim s as string
		  
		  for j = 0 to controlTypesListBox.ListCount - 1
		    if controlTypesListBox.CellState(j, 0) = CheckBox.CheckedStates.Checked then
		      controlTypes.Append(controlTypesListBox.Cell(j, 1))
		    end if
		  next
		  
		  for j = 0 to constantsListBox.ListCount - 1
		    constantsListBox.CellBold(j, 2) = false
		  next
		  
		  for i = 0 to UBound(projectFiles)
		    if right(projectFiles(i).name, 12) = ".xojo_window" then
		      undersize = findUnderSize(projectFiles(i), myConstants, controlTypes)
		      undersizeCnt = undersizeCnt + UBound(undersize) + 1
		      for j = 0 to constantsListBox.ListCount - 1
		        if undersize.IndexOf(constantsListBox.Cell(j, 0)) >= 0 then
		          constantsListBox.CellBold(j, 2) = true
		        end if
		      next
		    end if
		  next
		  
		  cntLabel.text = str(undersizeCnt) + " are undersized"
		  
		  enableButs()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events selectProjectFileBut
	#tag Event
		Sub Action()
		  dim i as integer
		  dim baseProjectName as string
		  dim s as string
		  
		  projectFolderitem = SelectFolder()
		  if projectFolderitem = nil then
		    return
		  end if
		  
		  constantsListBox.DeleteAllRows()
		  filesListbox.DeleteAllRows()
		  
		  redim self.projectFiles(-1)
		  getProjectFiles(projectFolderitem)
		  
		  controlTypesListBox.DeleteAllRows()
		  redim self.controlTypes(-1)
		  self.controlTypes = ConstantCode.findControlTypes(self.projectFiles)
		  for i = 0 to UBound(self.controlTypes)
		    controlTypesListBox.AddRow("")
		    controlTypesListBox.CellState(controlTypesListBox.LastIndex, 0) = CheckBox.CheckedStates.Checked
		    controlTypesListBox.Cell(controlTypesListBox.LastIndex, 1) = controlTypes(i)
		  next
		  
		  baseProjectName = projectFolderitem.Parent.NativePath
		  
		  for i = 0 to UBound(self.projectFiles)
		    if Right(self.projectFiles(i).Name, 10) = ".xojo_code" then
		      s = Replace(self.projectFiles(i).NativePath, baseProjectName, "")
		      filesListbox.AddRow(s)
		      filesListbox.RowTag(filesListbox.LastIndex) = self.projectFiles(i)
		    end if
		  next
		  
		  enableButs()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events filesListbox
	#tag Event
		Sub Change()
		  if me.ListIndex >= 0 then
		    constantFolderitem = me.RowTag(me.ListIndex)
		    processConstantFile(constantFolderitem, false)
		  end if
		  
		  self.status = ""
		  
		  enableButs()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="status"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
