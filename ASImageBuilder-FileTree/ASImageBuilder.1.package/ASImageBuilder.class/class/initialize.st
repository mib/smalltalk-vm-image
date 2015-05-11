initialization
initialize
	| position |
	
	HeaderSize := 10.
	ClassInstanceVariableSize := 5.
	
	position := 0.
	
	FixedOp := ((
		{
			nil.
			true.
			false.
			Smalltalk class.
			
			ASBehavior.
			ASClassDescription.
			ASClass.
			ASMetaclass.
			ASProtoObject.
			ASObject.
			
			ASBehavior class.
			ASClassDescription class.
			ASClass class.
			ASMetaclass class.
			ASProtoObject class.
			ASObject class.
			
			ASCompiledMethod.
			ASMethodContext.
			ASBlockClosure.
			ASMessage.
			ASExceptionHandler.
			
			ASUndefinedObject.
			ASSmallInteger.
			ASArray.
			ASCharacter.
			ASString.
			ASSymbol.
			ASCompiler.
			ASBoolean.
			ASTrue.
			ASFalse.
			ASDictionary.
			ASIdentityDictionary.
			ASSystemDictionary.
			ASScriptRunner.
			
		} ,
		(0 to: 255) ,
		{
			#Smalltalk.
			#doesNotUnderstand:.
			#compileSource:forClass:.
			#defaultExceptionHandlerContext.
			#arguments:.
			#printString.
			
			#class.
			#new.
			#basicNew.
			#size.
			#value.
			#initialize.
			
			#=.
			#~=.
			#<.
			#<=.
			#>.
			#>=.
			#+.
			#-.
			#*.
			#/.
			#value:.
			#new:.
			#basicNew:.
			#at:.
			#do:.
			#and:.
			#or:.
			
			#value:value:.
			#at:put:.
			#to:do:.
		}
	) collect: [
		:each |
		| size op |
		size := self imageSpaceForObject: each.
		op := position.
		position := position + size.
		each -> (self convertOpForMemorySpace: op)
	])
		asDictionary.
	
	FirstFreeOp := position