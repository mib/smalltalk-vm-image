printing
printContentsOn: aStream
	self associationsDo: [
		:each | each printOn: aStream
	] separatedBy: [
		aStream nextPut: $ 
	]