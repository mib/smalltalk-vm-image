processing
resolveFuturePointers
	entries do: [
		:entry |
		entry withIndexDo: [
			:op :index |
			(op isKindOf: ASFuturePointer)
				ifTrue: [
					entry at: index put: (self opFor: op object)
				]
		]
	]