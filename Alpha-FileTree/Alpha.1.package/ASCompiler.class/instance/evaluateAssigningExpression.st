compiling
evaluateAssigningExpression
	| expressionBlock |
	
	expressionBlock := assigningExpression.
	assigningExpression := nil.
	expressionBlock value