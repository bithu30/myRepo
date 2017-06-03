import React from 'react';
import ReactDOM from 'react-dom';
import Board from './Board';
import registerServiceWorker from './registerServiceWorker';
import './index.css';

ReactDOM.render(<Board count={25} />, document.getElementById('react-container'));
registerServiceWorker();
