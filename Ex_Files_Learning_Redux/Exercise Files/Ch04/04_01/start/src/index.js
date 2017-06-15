import C from './constants'
import storeFactory from './store'

const store = storeFactory()

const state = store.getState()

store.dispatch({
	type: C.ADD_DAY,
	payload: {
		"resort": "Heavenly",
		"date": "2016-12-22",
		"powder": false,
		"backcountry": false
	}
})
