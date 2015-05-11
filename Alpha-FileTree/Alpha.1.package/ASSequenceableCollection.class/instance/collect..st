enumerating
collect: aBlock
	^ self class
		new: self size
		streamContents: [
			:stream |
			self do: [
				:each |
				stream nextPut: (aBlock value: each)
			]
		]