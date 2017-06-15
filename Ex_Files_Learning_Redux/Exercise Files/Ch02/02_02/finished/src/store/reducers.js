import C from '../constants'

export const goal = (state=10, action) => {

   if (action.type === C.SET_GOAL) {
   	   return parseInt(action.payload)
   } else {
       return state
   }

}
