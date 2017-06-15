export const suggestions = (state=[], action) => {

  switch(action.type) {

    case C.CLEAR_SUGGESTIONS :

    	//
      //  Bad Reducer!
      //  Don't make AJAX requests from a reducer
      //

    	fetch('http://localhost:3000/resorts')
    		.then(response => response.json())
    		.then(allNames => {
    			console.log('resort names', allNames)
    		})

      return []

    case C.CHANGE_SUGGESTIONS :
      return action.payload  

    default :
      return state
  }

}

