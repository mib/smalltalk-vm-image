processing
processClasses
	(Smalltalk organization categoriesMatching: 'Alpha*')
		do: [
			:category |
			(Smalltalk organization classesInCategory: category)
				do: [
					:class |
					self processClass: class
				].
		]