import { Injectable } from '@nestjs/common';
import { RESPONSE_MESSAGE } from './constants';

/**
 * @returns string: The service availablility message and state information
 * @author Musigwa Pacifique
 * @export
 * @class AppService
 */
@Injectable()
export class AppService {
  getServiceStatus(): object {
    return { message: RESPONSE_MESSAGE.API_SERVICE_AVAILABLE };
  }
}
