processing
processClass: class
	| classOp metaclass metaclassOp superclass superclassOp metasuperclass metasuperclassOp methodsOp instVarsOp metamethodsOp metaInstVarsOp name nameOp totalInstanceVariableSizeOp metatotalInstanceVariableSizeOp classNamedPointers |
	
	class == ASProtoObject
		ifTrue: [ superclass := nil ]
		ifFalse: [ superclass := class superclass ].
	
	metaclass := class class.
	
	metaclass == ASProtoObject class
		ifTrue: [ metasuperclass := ASClass ]
		ifFalse: [ metasuperclass := metaclass superclass ].
	
	classOp := self opFor: class.
	superclassOp := self opFor: superclass.
	metaclassOp := self opFor: metaclass.
	metasuperclassOp := self opFor: metasuperclass.
	
	methodsOp := self processMethodsFor: class.
	instVarsOp := self createArrayWith: (class instVarNames collect: [ :each | self processObject: each ]).
	
	metamethodsOp := self processMethodsFor: metaclass.
	metaInstVarsOp := self createArrayWith: (class classVarNames collect: [ :each | self processObject: each ]).
	
	totalInstanceVariableSizeOp := self processObject: class totalInstanceVariableSize.
	metatotalInstanceVariableSizeOp := self processObject: metaclass totalInstanceVariableSize.
	
	name := class name.
	nameOp := self processObject: name.
	
	classNamedPointers := OrderedCollection with: superclassOp with: methodsOp with: instVarsOp with: totalInstanceVariableSizeOp with: nameOp.
	class classVarNames do: [
		:each | classNamedPointers add: (self processObject: (class classVarNamed: each))
	].
	
	self createEntryFor: classOp class: metaclassOp namedPointers: classNamedPointers indexablePointers: #() indexableBytes: #().
	
	self createEntryFor: metaclassOp class: (self opFor: ASMetaclass) namedPointers: {metasuperclassOp. metamethodsOp. metaInstVarsOp. metatotalInstanceVariableSizeOp. classOp} indexablePointers: #() indexableBytes: #().
	
	classes at: nameOp put: classOp