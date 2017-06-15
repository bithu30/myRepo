import storeFactory from './store'
import { randomGoals } from './actions'

const store = storeFactory()

store.dispatch(
  randomGoals()
)

store.dispatch(
  randomGoals()
)
