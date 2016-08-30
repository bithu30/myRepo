import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { JsonpModule } from '@angular/http';
import { AppComponent } from './app.component';
//import { WikipediaSearchComponent } from './wikipedia-search.component'
//import { WikipediaService } from './wikipedia.service';

@NgModule({
  imports: [BrowserModule, JsonpModule],
  //declarations: [AppComponent, WikipediaSearchComponent],
  declarations: [AppComponent],
 // providers: [WikipediaService],
  bootstrap: [AppComponent]
})
export class AppModule {}