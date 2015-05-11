visiting
visitCascade: aCascade
	| isSuperSend messageIndex |
	
	aCascade receiver accept: self.
	isSuperSend := instructions last type = #pushSuper.
	
	self instruction: #duplicateTop.
	
	messageIndex := 1.
	
	aCascade messages
		do: [
			:each | each accept: self
		]
		separatedBy: [
			isSuperSend ifTrue: [ instructions last type: #sendSelectorToSuper ].
			self instruction: #pop.
			messageIndex := messageIndex + 1.
			messageIndex < aCascade messages size ifTrue: [
				self instruction: #duplicateTop
			]
		]