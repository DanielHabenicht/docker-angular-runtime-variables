import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { RouterModule } from '@angular/router';
import { runtimeEnvironment } from 'src/environments/runtimeEnvironment';

@NgModule({
  declarations: [AppComponent],
  imports: [
    BrowserModule,
    RouterModule.forRoot([{ path: '', component: AppComponent }], {
      enableTracing: runtimeEnvironment.test
    })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {}
