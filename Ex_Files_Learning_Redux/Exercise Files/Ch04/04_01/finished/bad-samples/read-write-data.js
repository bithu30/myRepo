export const goal = (state=10, action) => {

	if (action.type === C.SET_GOAL) {

		//
		//  Bad Reducer!
		//  Don't read or write data to storage in a reduer
		//

		window.localStorage['last-action'] = JSON.stringify(action)

		return parseInt(action.payload)
	} else {
		return state
	}

}

