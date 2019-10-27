import { Component, Inject, OnInit, PLATFORM_ID } from "@angular/core";
import { isPlatformBrowser } from "@angular/common";

@Component({
  selector: "app-public-page",
  template: "<p>Rendered by {{ renderer }}</p>"
})
export class PublicPageComponent implements OnInit {
  renderer: string;

  constructor(@Inject(PLATFORM_ID) platformId: any) {
    this.renderer = isPlatformBrowser(platformId) ? "Browser" : "Server";
  }

  ngOnInit() {}
}
