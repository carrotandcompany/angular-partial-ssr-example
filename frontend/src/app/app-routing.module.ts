import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { PublicPageComponent } from "./public-page/public-page.component";

const routes: Routes = [{ path: "public", component: PublicPageComponent }];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}
