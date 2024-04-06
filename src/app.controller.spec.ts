import { Test, TestingModule } from '@nestjs/testing';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { RESPONSE_MESSAGE } from './constants';

describe('AppController', () => {
  let appController: AppController;

  beforeEach(async () => {
    const app: TestingModule = await Test.createTestingModule({
      controllers: [AppController],
      providers: [AppService],
    }).compile();

    appController = app.get<AppController>(AppController);
  });

  describe('getServiceStatus()', () => {
    it(`Should return "${RESPONSE_MESSAGE.API_SERVICE_AVAILABLE}"`, () => {
      const response = appController.getServiceStatus();
      expect(typeof response).toBe('object');
      expect(response).toHaveProperty(
        'message',
        RESPONSE_MESSAGE.API_SERVICE_AVAILABLE,
      );
    });
  });
});
