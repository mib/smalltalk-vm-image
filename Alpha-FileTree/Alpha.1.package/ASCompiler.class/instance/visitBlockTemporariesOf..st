visiting blocks
visitBlockTemporariesOf: aBlock
	aBlock temporaries do: [
		:parameter |
		compilationContext
			addBinding: (ASVariableBinding type: #temporaryVariable index: temporaryCount)
			for: parameter.
		temporaryCount := temporaryCount + 1
	].