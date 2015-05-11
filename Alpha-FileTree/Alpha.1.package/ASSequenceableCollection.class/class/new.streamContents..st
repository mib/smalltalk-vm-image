stream creation
new: size streamContents: aBlock
	| stream |
	
	stream := ASWriteStream on: (self new: size).
	aBlock value: stream.
	
	^ stream contents