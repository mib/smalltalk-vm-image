writing
writeImage
	entries do: [
		:entry |
		entry do: [
			:field |
			field isCollection
				ifTrue: [ stream nextPutAll: field asByteArray ].
			field isNumber
				ifTrue: [ stream nextPutAll: (self convertToBytes: field) asByteArray ]
		]
	].
	
	stream nextPutAll: (self convertToBytes: 0) asByteArray