ranges
to: endNumber do: aBlock
	| currentNumber |
	
	currentNumber := self.
	
	[ currentNumber <= endNumber ]
		whileTrue: [
			aBlock value: currentNumber.
			currentNumber := currentNumber + 1
		]