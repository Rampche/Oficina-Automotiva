import express, { Request, Response } from 'express';
import { name, version } from '../../package.json';
import carsRoutes from './cars';
import usersRoutes from './users';
import ordersRoutes from './orders';

const router = express.Router();

router.get('/', (req: Request, res: Response) => {
  res.json({
    name,
    version,
  });
});

//router.use('/order', orderRoutes);
router.use('/cars', carsRoutes);
router.use('/users', usersRoutes);
router.use('/orders', ordersRoutes);

export default router;
