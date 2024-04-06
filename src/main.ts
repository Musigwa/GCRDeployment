import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const { API_SERVER_PORT = 3000 } = process.env;
  const app = await NestFactory.create(AppModule);
  await app.listen(API_SERVER_PORT);
}
bootstrap();
