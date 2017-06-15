import C from '../constants'
import expect from 'expect'
import { suggestions, fetching } from '../store/reducers'

const action = {
    type: C.CHANGE_SUGGESTIONS,
    payload: ['Heavenly Ski Resort', 'Heavens Sonohara']
}

const state = {
	fetching: true,
	suggestions: []
}

const expectedState = {
	fetching: false,
	suggestions: ['Heavenly Ski Resort', 'Heavens Sonohara']
}

const actualState = {
	fetching: fetching(state.fetching, action),
	suggestions: suggestions(state.suggestions, action)
}

expect(actualState.suggestions).toEqual(expectedState.suggestions)
expect(actualState.fetching).toEqual(expectedState.fetching)

console.log(`

    Challenge D: CHANGE_SUGGESTIONS PASSED!!!


`)