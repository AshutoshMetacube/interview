/*
 * Provus Services Quoting
 * Copyright (c) 2023 Provus Inc. All rights reserved.
 */

import { LightningElement, api, wire, track } from "lwc";
import getQuoteData from '@salesforce/apex/quoteManager.getData';
import saveQuoteData from '@salesforce/apex/quoteManager.saveData';

export default class EditQuote extends LightningElement {
  @api recordId;

  quoteData = {
    name: "Quote Name",
    endDate: 1547250828000,
    startDate: 1547230828000
  };



  @wire(getQuoteData, { recordId: '$recordId', fields: [] })
  getQuote({ error, data }) {
    if (error) {
      console.error(error);
    } else if (data) {
      console.log(data);
      this.quoteData = data;
      console.log(this.quoteData);
    }
  }
  handleSave(event) {
    console.log("Saving record start");

    var enddate = new Date(this.template.querySelector("lightning-input[data-id='endDate']").value);
    var startdate = new Date(this.template.querySelector("lightning-input[data-id='startDate']").value);

    let clonedObject = { ...this.quoteData };

    console.log(enddate);
    console.log(startdate);
    clonedObject.startDate = startdate;
    clonedObject.endDate = enddate;
    console.log(clonedObject);
    saveQuoteData({ dtoObjct: clonedObject }).then({
    });
    //this.quoteData = {...clonedObject};

  }

  renderedCallback() { }
}
