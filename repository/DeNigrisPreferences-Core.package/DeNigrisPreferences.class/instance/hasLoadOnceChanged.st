private
hasLoadOnceChanged

	^ lastLoadOnce ~= (self class>>#loadOnce) timeStamp.