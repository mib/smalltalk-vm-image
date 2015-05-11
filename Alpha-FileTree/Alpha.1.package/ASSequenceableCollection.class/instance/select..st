enumerating
select: aBlock
	^ self class
		new: self size
		streamContents: [
			:stream |
			self do: [
				:each |
				(aBlock value: each)
					ifTrue: [
						stream nextPut: each
					]
			]
		]