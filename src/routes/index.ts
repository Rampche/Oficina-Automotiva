import express, { Request, Response } from 'express';
import { name, version } from '../../package.json';
import carsRoutes from './cars';

const router = express.Router();

router.get('/', (req: Request, res: Response) => {
  res.json({
    name,
    version,
  });
});

//router.use('/order', orderRoutes);
router.use('/cars', carsRoutes);

export default router;
