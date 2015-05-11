parsing
makeArrayWith: items
	| array messages |
	
	array :=
		(ASMessageNode new
			receiver: (ASLiteralVariableNode new literal: #Array);
			selector: #new:;
			arguments: (OrderedCollection with: (ASConstantNode new literal: items size))
		).
	
	messages := OrderedCollection new.
	
	messages add:
		(ASMessageNode new
			receiver: ASCascadeReceiverNode new;
			selector: #initialize;
			arguments: (OrderedCollection new)
		).
	
	items withIndexDo: [
		:item :index |
		messages add:
			(ASMessageNode new
				receiver: ASCascadeReceiverNode new;
				selector: #at:put:;
				arguments: (OrderedCollection with: (ASConstantNode new literal: index) with: item)
			)
	].
	
	messages add:
		(ASMessageNode new
			receiver: nil;
			selector: #yourself;
			arguments: (OrderedCollection new)
		).
	
	^ ASCascadeNode new
		receiver: array;
		messages: messages