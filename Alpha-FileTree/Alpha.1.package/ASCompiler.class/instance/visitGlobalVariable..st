visiting
visitGlobalVariable: aVariable
	assigningExpression
		ifNotNil: [
			self instruction: #pushSmalltalk.
			
			aVariable literal asSymbol ~~ #Smalltalk ifTrue: [
				self instruction: #pushLiteralConstant
					with: (self literal: aVariable literal asSymbol).
				self evaluateAssigningExpression.
				self instruction: #sendSelector
					with: (self literal: #at:put:)
					with: 2
			]
		]
		ifNil: [
			aVariable literal asSymbol == #Smalltalk
				ifTrue: [
					self instruction: #pushSmalltalk
				]
				ifFalse: [
					self instruction: #pushGlobalVariable
						with: (self literal: aVariable literal asSymbol)
				]
		]