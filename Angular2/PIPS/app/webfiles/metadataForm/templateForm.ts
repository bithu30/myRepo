import {Component} from '@angular/core';
import { Singleton } from '../../singleton/Singleton'; 
import {DatasetBasicForm} from '../../webfiles/metadataForm/tabs/basic/dataset-basic-form';
import {DatasetDescForm} from '../../webfiles/metadataForm/tabs/description/dataset-desc-form';
import {DatasetContactForm} from '../../webfiles/metadataForm/tabs/contact/dataset-contact-form';
import {DatasetMetadataForm} from '../../webfiles/metadataForm/tabs/metadata/dataset-metadata-form';
import {ReportForm} from '../../webfiles/metadataForm/tabs/report/report-form';

@Component({
  selector: 'templateForm',
  templateUrl: 'app/webfiles/metadataForm/templateForm.html',
  directives: [
    DatasetBasicForm, 
    DatasetDescForm, 
    DatasetContactForm,
    DatasetMetadataForm,
    ReportForm
    ]
})

export class TemplateForm {
  
}