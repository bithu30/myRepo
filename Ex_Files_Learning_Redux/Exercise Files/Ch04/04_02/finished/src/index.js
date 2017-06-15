import expect from 'expect'
import storeFactory from './store'

import { 
	addError,
	clearError, 
	changeSuggestions, 
	clearSuggestions 
} from './actions'

const store = storeFactory()







//
// Challenge: build addError() Action Creator
//

store.dispatch(
    addError("something went wrong")
)

expect(store.getState().errors)
  .toEqual(["something went wrong"])

console.log(`

    addError() Action Creator Works!!!

`)








//
// Challenge: build clearError() Action Creator
//

store.dispatch(
    clearError(0)
)

expect(store.getState().errors)
  .toEqual([])

console.log(`

    clearError() Action Creator Works!!!

`)











//
// Challenge: build changeSuggestios() Action Creator
//

store.dispatch(
    changeSuggestions(['One', 'Two', 'Three'])
)
      
expect(store.getState().resortNames.suggestions)
    .toEqual(['One', 'Two', 'Three'])

console.log(`

    changeSuggestions() Action Creator Works!!!

`)   











//
// Challenge: build clearSuggestions() Action Creator
// 
   

    
store.dispatch(clearSuggestions())

expect(store.getState().resortNames.suggestions).toEqual([])
        
console.log(`

    clearSuggestions() Action Creator Works!!!

`)  




