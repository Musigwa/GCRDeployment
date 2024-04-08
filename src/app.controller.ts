import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { ENDPOINT_NAME } from './constants';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get(ENDPOINT_NAME.apiHealth)
  getServiceStatus(): object {
    return this.appService.getServiceStatus();
  }
}
