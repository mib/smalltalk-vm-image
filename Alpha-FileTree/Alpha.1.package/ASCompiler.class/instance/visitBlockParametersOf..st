visiting blocks
visitBlockParametersOf: aBlock
	aBlock parameters do: [
		:parameter |
		compilationContext
			addBinding: (ASVariableBinding type: #temporaryVariable index: temporaryCount)
			for: parameter.
		temporaryCount := temporaryCount + 1
	]