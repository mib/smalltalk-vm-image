printing
printContentsOn: aStream
	self do: [
		:each | each printOn: aStream
	] separatedBy: [
		aStream nextPut: $ 
	]