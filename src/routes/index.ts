import express, { Request, Response } from 'express';
import { name, version } from '../../package.json';
import carsRoutes from './cars';
import usersRoutes from './users';
import ordersRoutes from './orders';
import itemsRoutes from './items';

const router = express.Router();

router.get('/', (req: Request, res: Response) => {
  res.json({
    name,
    version,
  });
});

router.use('/cars', carsRoutes);
router.use('/users', usersRoutes);
router.use('/orders', ordersRoutes);
router.use('/items', itemsRoutes);

export default router;
