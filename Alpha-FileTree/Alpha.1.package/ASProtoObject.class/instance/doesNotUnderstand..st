message sending
doesNotUnderstand: aMessage
	^ ASMessageNotUnderstood new
		message: aMessage;
		receiver: self;
		messageText: self printString , ' does not understand message ' , aMessage selector printString;
		signal