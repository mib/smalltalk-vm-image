initialization
initializeCompilationContext
	compilationContext := ASCompilationContext new.
	
	classContext allClassVariables
		withIndexDo: [
			:instVar :index |
			compilationContext
				addBinding: (ASVariableBinding type: #classVariable index: index - 1)
				for: instVar
		].
	
	classContext allInstanceVariables
		withIndexDo: [
			:instVar :index |
			compilationContext
				addBinding: (ASVariableBinding type: #instanceVariable index: index - 1)
				for: instVar
		]