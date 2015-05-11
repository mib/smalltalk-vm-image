accessing
name
	^ theClass
		ifNil: [ 'a Metaclass' ]
		ifNotNil: [ theClass name , ' class' ]