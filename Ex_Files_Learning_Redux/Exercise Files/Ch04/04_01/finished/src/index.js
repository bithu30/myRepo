import storeFactory from './store'
import { addDay, removeDay, setGoal } from './actions'

const store = storeFactory()

store.dispatch(
	addDay("Heavenly", "2016-12-22")
)

store.dispatch(
	removeDay("2016-12-22")
)

store.dispatch(
  setGoal(55)
)
