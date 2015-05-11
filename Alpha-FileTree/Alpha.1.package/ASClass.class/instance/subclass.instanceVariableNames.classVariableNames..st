subclass creation
subclass: nameSymbol instanceVariableNames: instVarArray classVariableNames: classVarArray
	| class metaclass |
	
	metaclass := ASMetaclass new.
	metaclass superclass: self class.
	metaclass instanceVariables: classVarArray.
	
	class := metaclass new.
	class superclass: self.
	class instanceVariables: instVarArray.
	class name: nameSymbol.
	
	metaclass theClass: class.
	
	Smalltalk at: nameSymbol put: class.
	
	^ class