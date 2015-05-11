building
buildImage
	self initializeClasses.
	self processAll.
	self buildSymbolTable.
	self resolveFuturePointers.
	self buildSystemDictionary.
	self writeImage