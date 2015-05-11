visiting
visitAssignment: anAssignment
	assigningExpression := [ anAssignment expression accept: self ].
	anAssignment variable accept: self.