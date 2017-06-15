import C from './constants'
import { skiDay } from './store/reducers'

const state = null

const action = {
	type: C.ADD_DAY,
	payload: {
		"resort": "Heavenly",
		"date": "2016-12-16",
		"powder": true,
		"backcountry": false
	}
}

const nextState = skiDay(state, action)

console.log(`

    initial state: ${state}
    action: ${JSON.stringify(action)}
    new state: ${JSON.stringify(nextState)}

`)