import {Component} from '@angular/core';
import { Singleton } from '../../singleton/Singleton'; 
import {DatasetBasicForm} from '../../webfiles/metadataForm/tabs/basic/dataset-basic-form';
import {DatasetDescForm} from '../../webfiles/metadataForm/tabs/description/dataset-desc-form';
import {DatasetContactForm} from '../../webfiles/metadataForm/tabs/contact/dataset-contact-form';
import {DatasetMetadataForm} from '../../webfiles/metadataForm/tabs/metadata/dataset-metadata-form';
import {ReportForm} from '../../webfiles/metadataForm/tabs/report/report-form';
import {DigitalTransferForm} from '../../webfiles/metadataForm/tabs/digitalTransfer/digital-transfer-form';
import {SpatialRepresentationForm} from '../../webfiles/metadataForm/tabs/spatialRepresentation/spatial-reprsentation-form';
import {ExtentForm} from '../../webfiles/metadataForm/tabs/Extent/extent-form';

@Component({
  selector: 'templateForm',
  templateUrl: 'app/webfiles/metadataForm/templateForm.html',
  directives: [
    DatasetBasicForm, 
    DatasetDescForm, 
    DatasetContactForm,
    DatasetMetadataForm,
    ReportForm,
    DigitalTransferForm,
    SpatialRepresentationForm,
    ExtentForm
    ]
})

export class TemplateForm {
  
}