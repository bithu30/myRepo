import {Pipe} from 'angular2/core';

@Pipe({
  name: 'tidyprint'
})
export class TidyPrintPipe {
  transform(val) {
    return JSON.stringify(val, null, 2)
      .replace(/ /g, '&nbsp;')
      .replace(/\n/g, '<br/>');
  }
}
