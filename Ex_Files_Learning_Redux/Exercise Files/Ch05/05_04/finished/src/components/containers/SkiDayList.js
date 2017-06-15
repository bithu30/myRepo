import SkiDayList from '../ui/SkiDayList'
import { connect } from 'react-redux'
import { removeDay } from '../../actions'

const mapStateToProps = (state, props) => 
  ({
    days: state.allSkiDays,
    filter: props.params.filter,
  })

const mapDispatchToProps = disptach => 
  ({
    onRemoveDay(date) {
      disptach(
        removeDay(date)
      )
    }
  })  

export default connect(mapStateToProps, mapDispatchToProps)(SkiDayList)  
