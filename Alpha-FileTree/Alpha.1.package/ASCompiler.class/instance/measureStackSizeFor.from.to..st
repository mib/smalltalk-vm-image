compiling
measureStackSizeFor: instructionCollection from: beginIndex to: endIndex
	| index stackSize maxStackSize instruction jumpSize |
	
	stackSize := 0.
	maxStackSize := 0.
	index := beginIndex.
	
	[ index <= endIndex ]
		whileTrue: [
			instruction := instructionCollection at: index.
			
			stackSize := stackSize + (self stackPositionChangeFor: instruction).
			maxStackSize := maxStackSize max: stackSize.
			
			index := index + 1.
			
			"only follow forward jumps to avoid infinite cycles"
			((instruction type == #jump or: [ instruction type beginsWith: #popJump ])
			and: [ (jumpSize := ((instruction first - 128) * 256) + instruction second) > 0 ])
				ifTrue: [
					"if the jump is conditional, measure both options (following the jump or not)"
					(instruction type beginsWith: #popJump)
						ifTrue: [
							maxStackSize :=
								maxStackSize max:
									(stackSize + (self measureStackSizeFor: instructionCollection from: index to: endIndex)).
						].
					
					[ jumpSize > 0 ] whileTrue: [
						jumpSize := jumpSize - (instructionCollection at: index) bytes.
						index := index + 1
					]
				]
		].
	
	^ maxStackSize