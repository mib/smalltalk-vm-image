initialization
initialize
	Bytecodes := {
		#pushInstanceVariable -> 1.
		#pushClassVariable -> 2.
		#pushTemporaryVariable -> 3.
		#pushGlobalVariable -> 4.
		#pushLiteralConstant -> 5.
		#pushSelf -> 6.
		#pushSuper -> 6. "super only determines the root class of a method lookup, in all other situations it acts as self"
		#pushNil -> 7.
		#pushTrue -> 8.
		#pushFalse -> 9.
		#pushSmalltalk -> 10.
		#pushThisContext -> 11.
		#storeInstanceVariable -> 12.
		#storeClassVariable -> 13.
		#storeTemporaryVariable -> 14.
		#storeGlobalVariable -> 15.
		#pop -> 16.
		#duplicateTop -> 17.
		#returnTopFromMethod -> 18.
		#returnTopFromBlock -> 19.
		#sendSelector -> 20.
		#sendSelectorToSuper -> 21.
		#jump -> 22.
		#popJumpIfTrue -> 23.
		#popJumpIfFalse -> 24.
		#popJumpIfNil -> 25.
		#popJumpIfNotNil -> 26.
		#createBlockClosure -> 30.
		#sendSpecialSelectorWith0Arguments -> 40.
		#sendSpecialSelectorWith1Argument -> 41.
		#sendSpecialSelectorWith2Arguments -> 42.
		#sendSelectorIdentical -> 43.
		#sendSelectorNotIdentical -> 44.
		#pushInstanceVariable0 -> 50.
		#pushInstanceVariable1 -> 51.
		#pushInstanceVariable2 -> 52.
		#pushInstanceVariable3 -> 53.
		#pushInstanceVariable4 -> 54.
		#pushTemporaryVariable0 -> 55.
		#pushTemporaryVariable1 -> 56.
		#pushTemporaryVariable2 -> 57.
		#pushTemporaryVariable3 -> 58.
		#pushTemporaryVariable4 -> 59.
		#returnNilFromMethod -> 60.
		#returnTrueFromMethod -> 61.
		#returnFalseFromMethod -> 62.
		#returnSelfFromMethod -> 63.
		#returnInstanceVariable0FromMethod -> 64.
		#returnInstanceVariable1FromMethod -> 65.
		#returnInstanceVariable2FromMethod -> 66.
		#returnTemporaryVariable0FromMethod -> 67.
		#returnTemporaryVariable1FromMethod -> 68.
		#returnTemporaryVariable2FromMethod -> 69.
		#pushSmallInteger1 -> 70.
		#pushSmallInteger0 -> 71.
		#pushSmallIntegerNeg1 -> 72.
	} asDictionary.
	
	SpecialSelectors := {
		#class -> 0.
		#new -> 1.
		#basicNew -> 2.
		#size -> 3.
		#value -> 4.
		#initialize -> 5.

		#= -> 0.
		#~= -> 1.
		#< -> 2.
		#<= -> 3.
		#> -> 4.
		#>= -> 5.
		#+ -> 6.
		#- -> 7.
		#* -> 8.
		#/ -> 9.
		#value: -> 10.
		#new: -> 11.
		#basicNew: -> 12.
		#at: -> 13.
		#do: -> 14.
		#and: -> 15.
		#or: -> 16.

		#value:value: -> 0.
		#at:put: -> 1.
		#to:do: -> 2.
	} asDictionary