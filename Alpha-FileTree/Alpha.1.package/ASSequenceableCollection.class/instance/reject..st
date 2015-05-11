enumerating
reject: aBlock
	^ self class
		new: self size
		streamContents: [
			:stream |
			self do: [
				:each |
				(aBlock value: each)
					ifFalse: [
						stream nextPut: each
					]
			]
		]