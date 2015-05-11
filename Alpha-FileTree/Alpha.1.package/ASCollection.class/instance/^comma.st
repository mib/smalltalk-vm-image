copying
, aCollection
	^ (self class
		new: self size + aCollection size)
			addAll: self;
			addAll: aCollection;
			yourself