method dictionary
addSelector: aSymbol withMethod: aCompiledMethod
	<primitive: 125>
	"the primitive always fails, it serves as a notification for the VM to update its method lookup cache"
	
	^ methods
		at: aSymbol
		put: aCompiledMethod