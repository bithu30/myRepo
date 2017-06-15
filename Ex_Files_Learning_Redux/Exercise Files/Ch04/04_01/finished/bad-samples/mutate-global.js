export const errors = (state=[], action) => {
  switch(action.type) {
    
    case C.ADD_ERROR :
    	
      //
      //  Bad Reducer!
      //  Don't mutate global state in a reducer
      //

      window.hasAnError = false
      window.error = action.payload

    	return [
         ...state,
         action.payload
    	]
    
    case C.CLEAR_ERROR : 
      return state.filter((message, i) => i !== action.payload)
  	
  	default: 
  		return state
  }
}

