import { v4 } from 'node-uuid'

export const skiDay = (state=null, action) => {

	if (action.type === C.ADD_DAY) {

		//
		//  Bad Reducer!
		//  Don't generate id's in a reducer
		//

		const id = v4()

		return {
			id,
			...action.payload
		}

	} else {
		return state
	}

}

