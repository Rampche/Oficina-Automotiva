import { Request, Response } from 'express';
import { create } from '../../services/orders';
import { Order } from '../../models/order';

export default async (req: Request, res: Response) => {
  const { ...order }: Order = req.body;
  const user: string = req.body;
  const car: string = req.body;

  const newOrder = await create(order, car, user);

  return res.json(newOrder);
};
