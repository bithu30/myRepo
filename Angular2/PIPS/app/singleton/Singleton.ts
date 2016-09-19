
import { Injectable } from '@angular/core';
import { ClsMetadata }    from '../models/metadata/ClsMetadata';
import { CI_DateTypeCode } from  '../models/constant/CI_DateTypeCode'; 
import { Bool } from  '../models/constant/bool'; 
import { MD_SpatialRepresentationTypeCode } from  '../models/constant/MD_SpatialRepresentationTypeCode'; 

export class Singleton {
    private static singleton: Singleton;
    test : String;
    myMetadata: ClsMetadata;
    CI_DateTypeCode:CI_DateTypeCode;
    my_Bool : Bool;
    MD_SpatialRepresentationTypeCode: MD_SpatialRepresentationTypeCode;
    constructor() {
        if (!Singleton.singleton) {
            Singleton.singleton = this;
            // ... any one time initialization goes here ...
            this.test = 'first';
            this.myMetadata = new ClsMetadata();
            this.CI_DateTypeCode = new CI_DateTypeCode();
            this.my_Bool = new Bool();
            this.MD_SpatialRepresentationTypeCode = new MD_SpatialRepresentationTypeCode();
        }
        return Singleton.singleton;
    }
    // someMethod() {             
    //     this.test = 'second';
    // }
}