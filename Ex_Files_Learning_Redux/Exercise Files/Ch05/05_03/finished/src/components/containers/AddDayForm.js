import AddDayForm from '../ui/AddDayForm'
import { withRouter } from 'react-router'

export default withRouter(
    (props) => 
        <AddDayForm suggestions={[]} 
                fetching={false} 
                router={props.router} 
                onNewDay={day => console.log('todo: add day', day)}
                onChange={value => console.log('todo: suggest', value)}
                onClear={() => console.log('todo: clear suggestions')} />
)