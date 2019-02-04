import { Component, OnInit } from '@angular/core';
import { runtimeEnvironment } from 'src/environments/runtimeEnvironment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'docker-angular-runtime-variables';

  constructor() {}

  ngOnInit() {
    this.title = runtimeEnvironment.test;
  }
}
