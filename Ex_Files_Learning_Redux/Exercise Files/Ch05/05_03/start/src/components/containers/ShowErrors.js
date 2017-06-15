import ShowErrors from '../ui/ShowErrors'

export default () =>
	<ShowErrors errors={['sample error']}
						  onClearError={index => console.log('todo: clear error at', index)} />
