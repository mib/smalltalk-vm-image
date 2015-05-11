visiting
visitMethod: aMethod
	primitive := aMethod primitive.
	parameterCount := aMethod parameters size.
	
	temporaryCount := aMethod parameters size.
	
	aMethod parameters withIndexDo: [
		:parameter :index |
		compilationContext
			addBinding: (ASVariableBinding type: #temporaryVariable index: index - 1)
			for: parameter
	].
	
	aMethod block accept: self