error handling
executeEnsureBlock
	closure ifNotNil: [
		closure executeEnsureBlock
	]