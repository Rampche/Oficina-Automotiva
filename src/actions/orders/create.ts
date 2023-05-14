import { Request, Response } from 'express';
import { create } from '../../services/orders';
import { Order } from '../../models/order';

interface OrderData {
  user: string;
  car: string;
}

export default async (req: Request, res: Response) => {
  const { ...order }: Order = req.body;
  const { user, car }: OrderData = req.body;

  const newOrder = await create(order, car, user);

  return res.json(newOrder);
};
