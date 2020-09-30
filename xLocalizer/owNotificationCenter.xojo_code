#tag Module
Protected Module owNotificationCenter
	#tag Method, Flags = &h0
		Sub listen(extends onl as owNotificationListener, keys() as string)
		  Dim n,l as integer
		  n = ubound( keys )
		  for l=0 to n
		    register( keys( l ), onl )
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub register(key as string, inObject as OwnotificationListener)
		  if notificationSorter = nil then notificationSorter = new dictionary
		  
		  Dim c as collection = notificationsorter.lookup( key, new collection )
		  Dim n,l as integer
		  
		  Dim w as new weakRef( inObject )
		  
		  n = c.count
		  for l=1 to n
		    if c.item( l ) = w then
		      break
		      return
		    end if
		  next
		  
		  c.add w
		  
		  notificationSorter.value( key ) = c
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub send(key as string, value as variant = nil, sender as variant = nil)
		  if notificationSorter <> nil then
		    Dim p as pair = value : sender
		    dispatchQueue.append key : p
		    
		    if dispatchTimer = nil then
		      dispatchTimer = new Timer
		      dispatchTimer.period = 1
		      
		      AddHandler dispatchTimer.action, AddressOf timerFired
		    end if
		    
		    if dispatchTimer.mode <> 1 then dispatchTimer.mode = 1
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stopListening(extends onl as OwNotificationListener)
		  if notificationSorter <> nil then
		    
		    Dim dCount, dPos as integer
		    Dim currentKey as string
		    Dim oCount, oPos as integer
		    Dim receivers as collection
		    
		    Dim w as weakRef
		    
		    dcount = notificationSorter.count-1
		    for dPos=dcount downto 0
		      currentKey = notificationsorter.key( dPos )
		      receivers = notificationSorter.value( currentKey )
		      if receivers = nil then
		        #if debugBuild then
		          break
		          system.DebugLog currentMethodName+" there are no receivers for "+currentKey
		        #endif
		        notificationSorter.remove currentKey
		        
		      else
		        oCount = receivers.count
		        for oPos = oCount downto 1
		          w = receivers.item( opos )
		          if w <> nil and w.value = onl then
		            receivers.remove oPos
		            
		          elseif receivers.item( opos ) = nil then
		            receivers.remove oPos
		            
		          end if
		        next
		        notificationSorter.value( currentKey ) = receivers
		      end if
		    next
		    
		  else
		    #if debugBuild then
		      break
		      system.DebugLog currentMethodName+" notification center is not set-up"
		    #endif
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub timerfired(obj as timer)
		  Dim receivers as collection
		  Dim currentPost as Pair
		  Dim n, l, deliveredCount as integer
		  Dim w as weakRef
		  Dim key as string
		  Dim value, sender as variant
		  
		  while ubound( dispatchQueue ) > -1
		    currentPost = dispatchQueue( 0 )
		    key = currentPost.left
		    value = pair( currentPost.right ).left
		    sender = pair( currentPost.right ).right
		    dispatchQueue.remove 0
		    deliveredCount = 0
		    
		    receivers = notificationSorter.lookup( currentPost.left, nil )
		    if receivers = nil then
		      #if debugBuild then
		        system.DebugLog currentMethodName+" there are no receivers for the key:"+currentPost.left
		      #endif
		      
		    else
		      n = receivers.count
		      for l=1 to n
		        w = receivers.item( l )
		        if w <> nil and w.value <> nil then
		          owNotificationListener( w.value ).notificationReceived( key, value, sender )
		          deliveredCount = deliveredCount + 1
		        end if
		      next
		      
		      #if DebugBuild then
		        if deliveredCount <> n then system.debugLog currentMethodName+" out of "+str( n )+" receivers, only "+str( deliveredCount )+" were valid"
		      #endif
		      
		    end if
		  wend
		  
		  obj.mode = 0
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private dispatchQueue(-1) As Pair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private dispatchTimer As timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private notificationSorter As dictionary
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
	#tag EndViewBehavior
End Module
#tag EndModule
