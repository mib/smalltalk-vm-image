visiting
visitReturn: aReturn
	| lastInstruction |
	
	aReturn expression accept: self.
	
	lastInstruction := instructions last.
	
	(aReturn expression isVariable and: [ lastInstruction type == #pushNil ])
		ifTrue: [
			lastInstruction type: #returnNilFromMethod.
			^ nil
		].
	(aReturn expression isVariable and: [ lastInstruction type == #pushTrue ])
		ifTrue: [
			lastInstruction type: #returnTrueFromMethod.
			^ nil
		].
	(aReturn expression isVariable and: [ lastInstruction type == #pushFalse ])
		ifTrue: [
			lastInstruction type: #returnFalseFromMethod.
			^ nil
		].
	(aReturn expression isVariable and: [ lastInstruction type == #pushSelf ])
		ifTrue: [
			lastInstruction type: #returnSelfFromMethod.
			^ nil
		].
	
	(aReturn expression isVariable and: [ lastInstruction type == #pushInstanceVariable and: [ lastInstruction first <= 2 ] ])
		ifTrue: [
			lastInstruction type: (#(#returnInstanceVariable0FromMethod #returnInstanceVariable1FromMethod #returnInstanceVariable2FromMethod) at: lastInstruction first + 1).
			lastInstruction first: nil.
			^ nil
		].
	
	(aReturn expression isVariable and: [ lastInstruction type == #pushTemporaryVariable and: [ lastInstruction first <= 2 ] ])
		ifTrue: [
			lastInstruction type: (#(#returnTemporaryVariable0FromMethod #returnTemporaryVariable1FromMethod #returnTemporaryVariable2FromMethod) at: lastInstruction first + 1).
			lastInstruction first: nil.
			^ nil
		].
	
	self instruction: #returnTopFromMethod