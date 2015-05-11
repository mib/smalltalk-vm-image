printing
printOn: aStream base: base
	| reversedStream currentValue |
	
	self < 0
		ifTrue: [
			aStream nextPut: $-.
			self negated printOn: aStream base: base.
			^ self
		].
	
	self < base
		ifTrue: [
			aStream nextPut: $0 + self.
			^ self
		].
	
	reversedStream := '' writeStream.
	
	currentValue := self.
	
	[ currentValue = 0 ]
		whileFalse: [
			reversedStream nextPut: $0 + (currentValue \\ base).
			currentValue := currentValue // base
		].
	
	aStream nextPutAll: reversedStream contents reversed