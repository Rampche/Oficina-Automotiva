import env from 'dotenv';
import express, { Request, Response } from 'express';
import router from './routes';

env.config();

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

app.use(router);

app.listen(port, () =>
  console.log(`Server listening on http://localhost:${port}`)
);
